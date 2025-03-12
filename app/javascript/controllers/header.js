document.addEventListener("DOMContentLoaded", function () {
  const header = document.querySelector(".header");

  // Effet au scroll : Change la couleur de la bordure
  window.addEventListener("scroll", function () {
    let scrollValue = window.scrollY;
    let intensity = Math.min(1, scrollValue / 300);

    let newColor = `rgba(140, 122, 230, ${0.3 + intensity * 0.7})`;
    header.style.boxShadow = `0px 4px 20px ${newColor}`;
  });

  // Effet au survol : Ajout d'un glow temporaire
  header.addEventListener("mouseenter", function () {
    header.style.boxShadow = "0px 4px 25px rgba(140, 122, 230, 1)";
  });

  header.addEventListener("mouseleave", function () {
    header.style.boxShadow = "0px 4px 20px rgba(140, 122, 230, 0.3)";
  });
});
