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

    // Ajoute l'effet de survol pour un effet doux violet
    this.element.querySelectorAll(".category").forEach((category) => {
      category.addEventListener("mouseenter", () => {
        if (!category.classList.contains("active")) {
          category.classList.add("hover-effect");
        }
      });

      category.addEventListener("mouseleave", () => {
        category.classList.remove("hover-effect");
      });
    });
  }

  updateActiveClass(activeCategory, wasActive) {
    document.querySelectorAll(".category").forEach(category => {
      category.classList.remove("active", "hover-effect"); // Supprime l'effet sur tous
    });

    if (!wasActive) {
      activeCategory.classList.add("active");
    }
  }
}
