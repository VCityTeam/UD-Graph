import sys, preXSLT, postXSLT
from os import walk, system


def main( filepath='' ):

   preprocess_list = ['Schema/GML/gml.xsd']

   if filepath != '':
      filename = filepath.split('/')[-1].split('.')[0]
      if filepath in preprocess_list:
         print('preprocessing...')
         composite_path = preXSLT.main(filepath)
         if composite_path is not None:
            filepath = composite_path
      print('transforming {}...'.format(filepath))
      system( 'java -jar ../saxon9he.jar -s:{} -xsl:XSD2RDF.xsl > Results/{}.rdf'.format( filepath, filename ))
      print('postprocessing...')
      postXSLT.main(filepath)
      print('done!')
      return 0


   filepaths  = []
   file_count = 0
   file_total = 0


   print('preprocessing...')
   updateProgressBar(0, len(preprocess_list))
   # preprocessing
   for file in preprocess_list:
      updateProgressBar(file_count, len(preprocess_list))
      preXSLT.main(file)
      file_count += 1

   # get files to transform
   for directory, directories, files in walk('Schema'):
      for filename in files:
         if '.xsd' in filename:
            filepaths.append( '{}/{}'.format( directory,filename ))
            file_total += 1

   # transform files
   sys.stdout.write('\033[K')
   print('transforming...')
   file_count = 0
   updateProgressBar(0, file_total)
   for file in filepaths:
      filename = file.split('/')[-1].split('.')[0]
      updateProgressBar(file_count, file_total, 'transforming {}'.format(file))
      system( 'java -jar ../saxon9he.jar -s:{} -xsl:XSD2RDF.xsl > Results/{}.rdf'.format( file, filename ))
      updateProgressBar(file_count, file_total, 'postprocessing {}'.format(file))
      postXSLT.main(file)
      file_count += 1

   sys.stdout.write('\033[K')
   print('done!')


def updateProgressBar(count, total, status=''):
   bar_length = 20
   filled_length = int(round(bar_length * count / float(total)))

   percent = round(100.0 * count / float(total), 1)
   bar = '#' * filled_length + ' ' * (bar_length - filled_length)

   sys.stdout.write('\033[K')
   sys.stdout.write('|%s| %s%s,%i/%i ...%s\r' % (bar, percent, '%', count, total, status))
   sys.stdout.flush()



if __name__ == "__main__":

   if len(sys.argv) == 2:
      main(sys.argv[1])
   elif len(sys.argv) == 1:
      main()
   else:
      sys.exit('Incorrect number of arguments: {}\nUsage: run.py\n       run.py [xsd to convert]'.format(len(sys.argv)))