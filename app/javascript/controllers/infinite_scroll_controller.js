import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  loadMore() {
    let nextPage = this.element.dataset.nextPage;

    if (!nextPage) return;

    let bottomOfPage = window.innerHeight + window.scrollY >= document.body.offsetHeight - 200;
    if (bottomOfPage) {
      fetch(nextPage, {
        headers: { "X-Requested-With": "XMLHttpRequest" }
      })
        .then(response => response.text())
        .then(html => {
          let carsList = document.querySelector("#cars-list");
          carsList.insertAdjacentHTML("beforeend", html);
        })
        .catch(error => console.error("Erreur de chargement :", error));
    }
  }
}
