/** @format */
const path = require('path');
const mode = process.env.NODE_ENV;
const debugBuild = mode === 'development';
const HtmlWebpackPlugin = require('html-webpack-plugin');

let outputPath;
if (debugBuild) {
  outputPath = path.resolve(__dirname, 'dist/debug');
} else {
  outputPath = path.resolve(__dirname, 'dist/release');
}

module.exports = (env) => {
  const rules = [
    {
      // We also want to (web)pack the style files:
      test: /\.css$/,
      use: ['style-loader', 'css-loader'],
    },
    {
      test: /\.json$/,
      include: [path.resolve(__dirname, 'src')],
      loader: 'raw-loader',
    },
    {
      test: /\.html$/,
      use: [
        {
          loader: 'html-loader',
          options: { minimize: !debugBuild },
        },
      ],
    },
  ];

  const plugins = [];
  if (debugBuild)
    plugins.push(
      new HtmlWebpackPlugin({
        title: 'Demo debug',
        filename: 'index.html',
      })
    );

  const config = {
    mode,
    entry: [path.resolve(__dirname, './src/bootstrap.js')],
    output: {
      path: outputPath,
      filename: 'app_name.js',
      library: 'app_name',
      libraryTarget: 'umd',
      umdNamedDefine: true,
    },
    module: {
      rules: rules,
    },
    devServer: {
      port: 8000,
      hot: true,
    },
    plugins: plugins,
  };

  if (debugBuild) config.devtool = 'source-map';

  return config;
};
