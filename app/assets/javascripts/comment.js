$(function(){
  function buildHTML(comment){
    if (comment.text) {
    let html = `<div class="height-line"></div>
                  <div class="comment-content">
                    <div class="comment-content__user-name" >
                      @${comment.name}
                    </div>
                    <div class="comment-content__text">
                      ${comment.text}
                    </div>
                  </div>`
    return html;
    } else {
      alert('error');
    }
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')

    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.coment-area').prepend(html);
      $('.text-area').val('');
      $('.comment-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    });
  });
});