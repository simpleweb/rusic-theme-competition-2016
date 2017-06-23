(function() {

  document.addEventListener("DOMContentLoaded", function() {
    if (window.Clipboard) {
      var selector = ".js-clipboard";
      var $button = document.querySelector(selector);
      var board = new Clipboard(selector);

      board.on("success", function() {
        $button.innerText = "✔";
        $button.classList.add("active");
      });
    }
  });

})();
