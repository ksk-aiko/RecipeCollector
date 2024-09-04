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
