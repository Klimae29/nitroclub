document.addEventListener("DOMContentLoaded", function() {
  const categories = document.querySelectorAll(".category");

  categories.forEach(category => {
    category.addEventListener("click", function() {
      // Retirer la classe "selected" de toutes les catégories
      categories.forEach(cat => cat.classList.remove("selected"));

      // Ajouter la classe "selected" à la catégorie cliquée
      this.classList.add("selected");

      // Stocker la catégorie sélectionnée dans le localStorage pour la garder après rechargement
      localStorage.setItem("selectedCategory", this.dataset.category);
    });
  });

  // Vérifier s'il y a une catégorie sélectionnée dans le localStorage
  const savedCategory = localStorage.getItem("selectedCategory");
  if (savedCategory) {
    const selectedCategory = document.querySelector(`.category[data-category='${savedCategory}']`);
    if (selectedCategory) {
      selectedCategory.classList.add("selected");
    }
  }
});
