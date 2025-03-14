import { Controller } from "@hotwired/stimulus"
// import debounce from 'lodash.debounce';

export default class extends Controller {
  static targets = ["input"]

  connect() {
    console.log("✅ Search Controller Loaded"); // Vérification si Stimulus fonctionne
    // this.filter = debounce(this.filter.bind(this), 300)
  }

  filter() {
    console.log("🔍 Recherche activée"); // Debug
    const query = this.inputTarget.value.trim();

    fetch(`/cars?query=${encodeURIComponent(query)}`, {
      headers: { "X-Requested-With": "XMLHttpRequest" }
    })
    .then(response => response.text())
    .then(html => {
      document.querySelector(".index_page").innerHTML = html
    })
  }

  submitSearch(event) {
    event.preventDefault();
    console.log("🔘 Bouton de recherche cliqué"); // Debug
    this.filter();
  }
}
