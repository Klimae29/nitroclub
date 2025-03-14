import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = ["category"];

  connect() {
    this.element.querySelectorAll(".category-link").forEach((link) => {
      link.addEventListener("click", (event) => {
        event.preventDefault();

        const clickedCategory = event.currentTarget.closest(".category");
        const isActive = clickedCategory.classList.contains("active");

        let url;
        if (isActive) {
          // Si déjà activé, on enlève la sélection et recharge toutes les voitures
          url = window.location.pathname;
        } else {
          // Sinon, on applique le filtre sélectionné
          url = event.currentTarget.href;
        }

        // Effectuer une requête AJAX pour charger les données
        fetch(url, { headers: { "X-Requested-With": "XMLHttpRequest" } })
          .then(response => response.text())
          .then(html => {
            // Mise à jour de la liste des voitures
            const carContainer = document.querySelector(".cars-container");
            if (carContainer) {
              carContainer.innerHTML = html;
            } else {
              console.error("Impossible de trouver .cars-container !");
            }

            // Mise à jour des classes pour l'affichage actif/inactif
            this.updateActiveClass(clickedCategory, isActive);
          })
          .catch(error => console.error("Erreur AJAX :", error));
      });
    });
  }

  updateActiveClass(activeCategory, wasActive) {
    if (wasActive) {
      // Désactive la classe active sur toutes les catégories
      document.querySelectorAll(".category").forEach(category => {
        category.classList.remove("active");
      });
    } else {
      // Active uniquement la catégorie cliquée
      document.querySelectorAll(".category").forEach(category => {
        category.classList.remove("active");
      });
      activeCategory.classList.add("active");
    }
  }
}
