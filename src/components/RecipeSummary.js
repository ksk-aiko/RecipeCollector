import React from 'react';

function RecipeSummary({ count }) {
  return (
    <div className="alert alert-info">
      <h3>Total Recipes: {count}</h3>
    </div>
  );
}

export default RecipeSummary;
