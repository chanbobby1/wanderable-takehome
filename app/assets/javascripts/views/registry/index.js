$(document).ready(function() {
  $(".main #registry_info").html(_.template($("#registry_tmpl").html(), registry));

  $(window).resize(layoutGiftsInColumns);
  layoutGiftsInColumns();
});


function layoutGiftsInColumns() {
  var $items = $(".main #registry_items");
  // Put items in
  $items.html(_.template($("#registry_items_tmpl").html(), registry));
  var max_width = $(".main").width();
  var gift_width = $items.find(".gift").width();
  var column_spacing = 30;
  var cols = Math.floor(max_width / gift_width);

  for (var i = 0; i < cols; i++) {
    var $col = $("<div></div>").addClass("col");
    $items.append($col);
  }

  var $gifts = $items.find(".gift");
  $gifts.each(function(index) {
    var $gift = $(this).remove();
    var colToPutIn = index % cols;
    $items.find(".col:eq(" + colToPutIn + ")").append($gift);
  }).click(function() {
    $(this).toggleClass("open");
  });

  $items.width(cols * gift_width + (cols-1) * column_spacing );
}
