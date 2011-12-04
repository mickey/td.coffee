window.tdjs = function(func) {
  var canvas = document.getElementById("processing");
  new Processing(canvas, function(processing) {
    window.Game = processing;
    func.call(processing);
  });
}