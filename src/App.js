import React, { useState } from 'react';
import RecipeInputForm from './components/RecipeInputForm';
import RecipeList from './components/RecipeList';
import RecipeSummary from './components/RecipeSummary';

function App() {
  const [recipes, setRecipes] = useState([
    { name: 'Sample Recipe', details: 'Sample Details' },
    { name: 'カレー', details: '材料:\n- 玉ねぎ\n- にんじん\n- じゃがいも\n- 牛肉\n- カレールー\n\n作り方:\n1. 野菜と肉を切る。\n2. 鍋で炒める。\n3. 水を加えて煮る。\n4. カレールーを加えてさらに煮る。' }
  ]);

  const addRecipe = (name, details) => {
    setRecipes([...recipes, { name, details }]);
  };

  return (
    <div className="container mt-5">
      <h1 className="display-4 text-center mb-4">Recipe Collector</h1>
      <div className="row">
        <div className="col-md-6">
          <h2 className="h4 font-weight-bold">Add a New Recipe</h2>
          <RecipeInputForm addRecipe={addRecipe} />
        </div>
        <div className="col-md-6">
          <h2 className="h4 font-weight-bold">Recipe Summary</h2>
          <RecipeSummary count={recipes.length} />
        </div>
      </div>
      <div className="row mt-4">
        <div className="col-12">
          <h2 className="h4 font-weight-bold">Recipe List</h2>
          <RecipeList recipes={recipes} />
        </div>
      </div>
    </div>
  );
}

export default App;