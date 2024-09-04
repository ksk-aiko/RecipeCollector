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
