#!/bin/bash

# 必要なディレクトリを作成
mkdir -p public src/components src/styles

# package.jsonの作成
cat <<EOL > package.json
{
  "name": "recipe-collector",
  "version": "1.0.0",
  "private": true,
  "dependencies": {
    "react": "^18.0.0",
    "react-dom": "^18.0.0",
    "react-scripts": "5.0.0"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
EOL


# 必要なReactファイルの作成
cat <<EOL > src/App.js
import React from 'react';
import RecipeInputForm from './components/RecipeInputForm';
import RecipeList from './components/RecipeList';
import RecipeSummary from './components/RecipeSummary';

function App() {
  return (
    <div className="App">
      <RecipeInputForm />
      <RecipeSummary />
      <RecipeList />
    </div>
  );
}

export default App;
EOL

cat <<EOL > src/components/RecipeInputForm.js
import React, { useState } from 'react';

function RecipeInputForm() {
  const [name, setName] = useState('');
  const [details, setDetails] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    // ここでレシピをリストに追加するロジックを実装
    console.log('Recipe added:', name, details);
    setName('');
    setDetails('');
  };

  return (
    <form onSubmit={handleSubmit}>
      <input 
        type="text" 
        placeholder="Recipe Name" 
        value={name} 
        onChange={(e) => setName(e.target.value)} 
      />
      <textarea 
        placeholder="Recipe Details" 
        value={details} 
        onChange={(e) => setDetails(e.target.value)} 
      ></textarea>
      <button type="submit">Add Recipe</button>
    </form>
  );
}

export default RecipeInputForm;
EOL

cat <<EOL > src/components/RecipeList.js
import React, { useState } from 'react';

function RecipeList() {
  const [recipes, setRecipes] = useState([
    { name: 'Sample Recipe', details: 'Sample Details' }
  ]);
  const [selectedRecipe, setSelectedRecipe] = useState(null);

  const toggleDetails = (index) => {
    setSelectedRecipe(selectedRecipe === index ? null : index);
  };

  return (
    <ul>
      {recipes.map((recipe, index) => (
        <li 
          key={index} 
          onClick={() => toggleDetails(index)}
          style={{ cursor: 'pointer', backgroundColor: selectedRecipe === index ? '#f0f0f0' : 'transparent' }}
        >
          {recipe.name}
          {selectedRecipe === index && <p>{recipe.details}</p>}
        </li>
      ))}
    </ul>
  );
}

export default RecipeList;
EOL

cat <<EOL > src/components/RecipeSummary.js
import React from 'react';

function RecipeSummary() {
  // レシピの数を管理するロジックを追加
  const totalRecipes = 1; // 仮の数値

  return (
    <div>
      <h2>Total Recipes: {totalRecipes}</h2>
    </div>
  );
}

export default RecipeSummary;
EOL

# スタイルファイルの作成
cat <<EOL > src/styles/App.css
.App {
  width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
EOL

# index.jsの作成
cat <<EOL > src/index.js
import React from 'react';
import ReactDOM from 'react-dom';
import './styles/App.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

reportWebVitals();
EOL

# reportWebVitals.jsの作成
cat <<EOL > src/reportWebVitals.js
const reportWebVitals = onPerfEntry => {
  if (onPerfEntry && onPerfEntry instanceof Function) {
    import('web-vitals').then(({ getCLS, getFID, getFCP, getLCP, getTTFB }) => {
      getCLS(onPerfEntry);
      getFID(onPerfEntry);
      getFCP(onPerfEntry);
      getLCP(onPerfEntry);
      getTTFB(onPerfEntry);
    });
  }
};

export default reportWebVitals;
EOL

# public/index.htmlの作成
cat <<EOL > public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recipe Collector</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
EOL

# Dockerfileの作成
cat <<EOL > Dockerfile
# ベースイメージ
FROM node:18

# 作業ディレクトリの設定
WORKDIR /app

# 依存関係をインストール
COPY package*.json ./
RUN npm install

# アプリケーションのコピー
COPY . .

# 開発サーバの起動
CMD ["npm", "start"]
EOL

# docker-compose.ymlの作成
cat <<EOL > docker-compose.yml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - NODE_ENV=development
EOL

echo "プロジェクト構成の準備が完了しました。"

