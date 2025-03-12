import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    let observer = new IntersectionObserver(entries => {
      if (entries[0].isIntersecting) {
        this.loadMore();
      }
    });

    observer.observe(this.element);
  }

  loadMore() {
    let next_page = this.element.dataset.next;

    if (next_page) {
      fetch(next_page, { headers: { accept: "text/javascript" } })
        .then(response => response.text())
        .then(html => {
          document.querySelector(".cars-container").insertAdjacentHTML("beforeend", html);

          let newLoadMore = document.querySelector("#load-more");
          if (newLoadMore) {
            this.element.dataset.next = newLoadMore.dataset.next;
          } else {
            this.element.remove(); // Supprime la div si plus de pages
          }
        });
    }
  }
}
