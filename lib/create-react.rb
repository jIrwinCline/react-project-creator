#!/usr/bin/env ruby
require 'pry'
require 'fileutils'

p "Enter your project name:"
project = gets.chomp
FileUtils.cd("../../")
FileUtils.mkdir("./#{project}")
FileUtils.cd("./#{project}")
FileUtils.touch("./template.ejs")
FileUtils.touch("./notes.txt")
FileUtils.touch("./.eslintrc.json")
FileUtils.touch("./.gitignore")
FileUtils.touch("./package.json")
FileUtils.touch("./webpack.config.js")
# FileUtils.cd("~/Desktop/#{project}")
File.open(".eslintrc.json", 'w') { |file| file.write('{
    "env": {
        "browser": true,
        "es6": true
    },
    "extends": "eslint:recommended",
    "parserOptions": {
        "ecmaFeatures": {
            "experimentalObjectRestSpread": true,
            "jsx": true
        },
        "sourceType": "module"
    },
    "plugins": [
        "react"
    ],
    "rules": {
        "react/jsx-key": 2,
        "react/jsx-uses-vars": 2,
        "react/jsx-uses-react": 2,
        "react/jsx-no-duplicate-props": 2,
        "react/jsx-no-undef": 2,
        "react/no-multi-comp": 2,
        "react/jsx-indent-props": [
            "error",
            2
          ],
        "react/jsx-pascal-case": 2,
        "react/prop-types": 2,
        "react/jsx-indent": [
            "error",
            2
          ],
        "indent": [
            "error",
            2
        ],
        "quotes": [
            "error",
            "single"
        ],
        "semi": [
            "error",
            "always"
        ]
    }
}

') }
File.open("template.ejs", 'w') { |file| file.write('<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title><%= htmlWebpackPlugin.options.title %></title>
</head>
  <body>
    <% if (htmlWebpackPlugin.options.appMountId) { %>
      <div id="<%= htmlWebpackPlugin.options.appMountId%>"></div>
    <% } %>
  </body>
</html>

') }
File.open("notes.txt", 'w') { |file| file.write("To initiate the project, you must run 'npm install' to allow the package-lock.json to render properly.

Then run 'webpack' and 'npm start'. Your app should be viewable at localhost:8080 with the default template of a static help queue

") }
File.open(".gitignore", 'w') { |file| file.write("
  node_modules
  build
  MyStyledComponents.jsx
") }
# File.open("package-lock.json", 'w') { |file| file.write("
#
# ") }
File.open("package.json", 'w') { |file| file.write('{
  "name": "react",
  "version": "1.0.0",
  "description": "first react project",
  "main": "\u001b[D\u001b[Dx)",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "webpack-dev-server",
    "lint": "eslint src/** src/**/**; exit 0",
    "lint-fix": "eslint src/** src/**/** --fix; exit 0"
  },
  "author": "Jacob Irwin",
  "license": "ISC",
  "dependencies": {
    "prop-types": "^15.5.10",
    "react": "^15.5.4",
    "react-dom": "^15.5.4",
    "styled-jsx": "^3.2.2"
  },
  "devDependencies": {
    "babel-core": "^6.24.1",
    "babel-loader": "^7.0.0",
    "babel-preset-es2015": "^6.24.1",
    "babel-preset-react": "^6.24.1",
    "eslint": "^4.19.1",
    "eslint-loader": "^3.0.0",
    "eslint-plugin-react": "^7.14.3",
    "html-webpack-plugin": "^2.29.0",
    "react-hot-loader": "^3.0.0-beta.7",
    "webpack": "^3.4.0",
    "webpack-dev-server": "^2.5.0"
  }
}


  ') }
File.open("webpack.config.js", 'w') { |file| file.write('const webpack = require("webpack");
const { resolve } = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");


module.exports = {

  entry: [
    "react-hot-loader/patch",
    "webpack-dev-server/client?http://localhost:8080",
    "webpack/hot/only-dev-server",
    resolve(__dirname, "src", "index.jsx")
  ],

  output: {
    filename: "app.bundle.js",
    path: resolve(__dirname, "build"),
    publicPath: "/"
  },

  resolve: {
    extensions: [".js", ".jsx"]
  },

  devtool: "#source-map",

  devServer: {
    hot: true,
    contentBase: resolve(__dirname, "build"),
    publicPath: "/"
  },

  module: {
    rules: [
      {
        test: /\.jsx?$/,
        enforce: "pre",
        loader: "eslint-loader",
        exclude: /node_modules/,
        options: {
          emitWarning: true,
          configFile: "./.eslintrc.json"
          }
        },
        {
        test: /\.jsx?$/,
        loader: "babel-loader",
        exclude: /node_modules/,
        options: {
          presets: [
            ["es2015", {"modules": false}],
            "react",
          ],
          plugins: [
            "react-hot-loader/babel",
            "styled-jsx/babel",
          ]
        }
      }
    ]
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NamedModulesPlugin(),
    new HtmlWebpackPlugin({
      template:"template.ejs",
      appMountId: "react-app-root",
      title: "React Help Queue",
      filename: resolve(__dirname, "build", "index.html"),
    }),
  ]
};


') }


FileUtils.mkdir("./src")
FileUtils.cd("./src")
FileUtils.touch("./index.jsx")
File.open("index.jsx", 'w') { |file| file.write("import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import { AppContainer } from 'react-hot-loader';

const render = (Component) => {
  ReactDOM.render(
    <AppContainer>
      <Component/>
    </AppContainer>,
    document.getElementById('react-app-root')
  );
};

render(App);

if (module.hot) {
  module.hot.accept('./components/App', () => {
    render(App);
  });
}


") }
FileUtils.mkdir("./components")
FileUtils.cd("./components")
FileUtils.touch("App.jsx")
FileUtils.touch("Header.jsx")
FileUtils.touch("Ticket.jsx")
FileUtils.touch("TicketList.jsx")

File.open("App.jsx", 'w') { |file| file.write("import React from 'react';
import TicketList from './TicketList';
import Header from './Header';

function App(){
  return (
    <div>
      <Header/>
      <TicketList/>
    </div>
  );
}

export default App;

") }

File.open("Header.jsx", 'w') { |file| file.write("import React from 'react';

function Header(){
  return (
    <h1>Help Queue</h1>
  );
}

export default Header;

") }

File.open("Ticket.jsx", 'w') { |file| file.write("import React from 'react';
import PropTypes from 'prop-types';

function Ticket(props){
  return (
    <div>
        <style global jsx>{`
          div {
            background-color: red;
          }
        `}</style>
      <h3>{props.location} - {props.names}</h3>
      <p><em>{props.issue}</em></p>
      <hr/>
    </div>
  );
}

Ticket.propTypes = {
  names: PropTypes.string.isRequired,
  location: PropTypes.string.isRequired,
  issue: PropTypes.string
};

export default Ticket;

") }

File.open("TicketList.jsx", 'w') { |file| file.write("import React from 'react';
import Ticket from './Ticket';

var masterTicketList = [
  {
    names: 'Thato and Haley',
    location: '3A',
    issue: 'Firebase wont save record. Halp.'
  },
  {
    names: 'Sleater and Kinney',
    location: '4B',
    issue: 'Fox image not displaying on page, can only see duck?'
  },
  {
    names: 'Imani & Jacob',
    location: '9F',
    issue: 'Donkey picture not displaying on hover in Zoology app. :('
  }
];

function TicketList(){
  return (
    <div>
      <hr/>
      {masterTicketList.map((ticket, index) =>
        <Ticket names={ticket.names}
          location={ticket.location}
          issue={ticket.issue}
          key={index}/>
      )}
    </div>
  );
}

export default TicketList;

") }
#----------------------------------------------------------------
