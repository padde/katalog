///////////////// DYNAMIC FIELDS /////////////////

// function to dynamically remove fields from forms,
// used by ApplicationHelper::link_to_remove_fields
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val(1);
  $(link).closest(".fields").slideUp();
}

// function to dynamically add fields to forms,
// used by ApplicationHelper::link_to_add_fields
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
  $(link).next(".fields").slideUp();
}


$(document).ready(function() {
  
  ///////////////// FANCYBOX /////////////////
  
  // settings for fancybox
  var fancybox_properties = {
    'transitionIn'       : 'elastic',
    'transitionOut'      : 'elastic',
    'speedIn'            : 300,
    'speedOut'           : 300,
    'overlayOpacity'     : 0.5,
    'overlayColor'       : '#000',
    'showCloseButton'    : true,
    'hideOnContentClick' : true,
    'titleShow'          : false,
    'titlePosition'      : 'inside',
    'titleFormat'        : function(title, currentArray, currentIndex, currentOpts) {
      return '<span id="fancybox-title-over">' + title + '</span>';
    }
  };
  
  // enable fancybox for images in gallery
  $("a[rel=fancybox]").fancybox(fancybox_properties);
  
  // // settings only for linked images in the content
  // fancybox_properties_for_content = fancybox_properties;
  // fancybox_properties_for_content['hideOnContentClick'] = true;
  // 
  // // enable fancybox for images enclosed in links,
  // // thus images in description text. 
  // $("#content a img").parent().not('a[rel=fancybox]').fancybox(fancybox_properties_for_content);
  
  
  ///////////////// OEMBED /////////////////
  
  // enable oEmbed  
  $('#page #main a').oembed(null, {
    embedMethod: "append",
    maxWidth: 580
  });
  
  // oembed fix for safari (videos do not work,
  // original links still redirect to provider page
  // when clicking on a video to play it)
  $('#page #main a[href^=http://youtube.com], ' + 
    '#page #main a[href^=http://www.youtube.com], ' + 
    '#page #main a[href^=http://vimeo.com], ' +
    '#page #main a[href^=http://www.vimeo.com]').click(
      function() { return false; }
  );
  
    ///////////////// COLUMNIZE /////////////////

	$('li').addClass("dontsplit");
	$('.columnize').columnize();

});