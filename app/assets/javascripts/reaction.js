$(document).on( 'turbolinks:load', function() {
  $('.far.fa-surprise').on('click',function(e){
    e.preventDefault();
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
    .done(function(){
      console.log("done");
    })
    .fail(function(){
      console.log("failure");
    })
  });
});
