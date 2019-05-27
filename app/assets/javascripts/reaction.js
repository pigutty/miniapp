$(document).on( 'turbolinks:load', function() {
  $(function(){
    $('.far.fa-surprise').on('click',function(e){
      e.preventDefault();
      var target = $(this);
      stamp_type = $(this).attr('data-type');
      user_id = $(this).parents('.reactions').attr('user_data-id');
      message_id = $(this).parents('.reactions').attr('message_data-id');
      url = '/user/'+ user_id +'/messages/' + message_id + '/reactions'
      $.ajax({
        url: url,
        type: "POST",
        dataType: 'json',
        data: { stamp_type: stamp_type, user_id: user_id, message_id: message_id }
      })
      .done(function(reactions){
        var surprise_number = reactions.length
        $(target).text(surprise_number)
      })
      .fail(function(){
      })
    });
  });
});
