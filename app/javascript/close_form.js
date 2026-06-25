import $ from "jquery";

$(document).on("turbo:load", () => {
  $("[data-exit]").on("click", () => {
    $("[data-content]").show();
    $("[data-form]").remove();
    $("[data-link]").show();
  });
});
