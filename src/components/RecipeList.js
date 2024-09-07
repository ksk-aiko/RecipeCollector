import React, { useState } from 'react';

function RecipeList({ recipes }) {
  const [selectedRecipe, setSelectedRecipe] = useState(null);

  const toggleDetails = (index) => {
    setSelectedRecipe(selectedRecipe === index ? null : index);
  };

  return (
    <ul className="list-group">
      {recipes.map((recipe, index) => (
        <li 
          key={index} 
          onClick={() => toggleDetails(index)}
          className={`list-group-item ${selectedRecipe === index ? 'active' : ''}`}
          style={{ cursor: 'pointer' }}
        >
          {recipe.name}
          {selectedRecipe === index && <p>{recipe.details}</p>}
        </li>
      ))}
    </ul>
  );
}

export default RecipeList;