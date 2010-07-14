// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function() {
  
  $("a[rel=fancybox]").fancybox({
    'transitionIn'  : 'none',
    'transitionOut' : 'none',
    'titlePosition' : 'over',
    'titleFormat'   : function(title, currentArray, currentIndex, currentOpts) {
      return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' +
      currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
    }
  });
  
});