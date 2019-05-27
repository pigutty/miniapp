$(document).on( 'turbolinks:load', function() {
  $(function(){
    $('.far.fa-surprise').on('click',function(e){
      e.preventDefault();
      var target = $(this);
      console.log(target);
      stamp_type = $(this).attr('data-type');
      console.log(stamp_type);
      user_id = $(this).parents('.reactions').attr('user_data-id');
      message_id = $(this).parents('.reactions').attr('message_data-id');
      console.log(user_id); 
      url = '/user/'+ user_id +'/messages/' + message_id + '/reactions'
      console.log(url);
      $.ajax({
        url: url,
        type: "POST",
        dataType: 'json',
        data: { stamp_type: stamp_type, user_id: user_id, message_id: message_id }
      })
      .done(function(reactions){
        console.log(reactions);
        var surprise_number = reactions.length
        console.log(target);
        $(target).text(surprise_number)
      })
      .fail(function(){
        console.log("failure");
      })
    });
  });
});
