## XML Schema
This folder contains the CityGML 2.0 and 3.0 (as of 3/11/2020) application schema and its schema dependencies such as GML 3.1 and 3.2 and the xAL addressing schema. In addition, composite schema are also stored here to be consumed by XSLT transformation processes and a Python utility script for creating these composite schema.   

### compileXMLSchema,py
This is a utility script used to combine xml schema into a single file. The script also enforces all names to use their respective namespace prefixes and normalizes these prefixes according to predetermined naming conventions. To modify these naming conventions, the variable `target_namespaces` must be set to a dictionary containing the desired namespace prefixes. _The CityGML 3.0 namespaces are used by default._

There are two ways to implement this script.

The first method is by specifying an input folder, containing the desired XML Schema to compose. This script will recursively search through the folder and all subfolders for the file extension '.xsd'.
```
python compileXMLSchema.py [path to XML Schema]
```
Optionally, a "manifest.txt" file can be used to list specific schema files to be used by the script. In the manifest file, each desired schema can be listed line by line or a specific folder can be listed by appending a '\*' to the folder path. In addition, lines can be commented using the '#' character. See the _manifest.txt_ file for examples.

To use this functionality, simply run the script without any arguments
```
python compileXMLSchema.py
```


Outputs are written to the file _"compositeSchemaOutput.xsd"_.