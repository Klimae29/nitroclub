import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.element.querySelectorAll(".category-link").forEach((link) => {
      link.addEventListener("click", (event) => {
        event.preventDefault();
        const url = event.currentTarget.href;

        fetch(url, {
          headers: { "X-Requested-With": "XMLHttpRequest" },
        })
          .then(response => response.text())
          .then(html => {
            document.querySelector(".cars-container").innerHTML = html;
          });
      });
    });
  }
}
