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
