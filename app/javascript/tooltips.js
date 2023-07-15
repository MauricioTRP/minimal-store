import { Tooltip } from "bootstrap";

document.addEventListener("turbo:load", function () {
  // This code is copied from Bootstrap's docs. See link below.
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
  const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new Tooltip(tooltipTriggerEl))
});
