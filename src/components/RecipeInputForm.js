import React, { useState } from 'react';

function RecipeInputForm({ addRecipe }) {
  const [name, setName] = useState('');
  const [details, setDetails] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    addRecipe(name, details);
    setName('');
    setDetails('');
  };

  return (
    <form onSubmit={handleSubmit} className="p-3">
      <div className="form-group">
        <label htmlFor="recipeName">Recipe Name</label>
        <input 
          type="text" 
          id="recipeName"
          className="form-control" 
          placeholder="Recipe Name" 
          value={name} 
          onChange={(e) => setName(e.target.value)} 
        />
      </div>
      <div className="form-group">
        <label htmlFor="recipeDetails">Recipe Details</label>
        <textarea 
          id="recipeDetails"
          className="form-control" 
          placeholder="Recipe Details" 
          value={details} 
          onChange={(e) => setDetails(e.target.value)} 
        ></textarea>
      </div>
      <button type="submit" className="btn btn-primary">Add Recipe</button>
    </form>
  );
}

export default RecipeInputForm;