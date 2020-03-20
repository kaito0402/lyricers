$(function() {
  let search_list = $(".contents");
  function appendTweet(tweet) {
    let html =`<div class="content">
                <div class="content__top">
                  <div class="content__top__lyric">
                    ${tweet.lyric}
                  </div>
                  <div class="content__top__info">
                    <div class="content__top__info__artist">
                      @ ${tweet.artist}
                    </div>
                    <div class="content__top__info__sn">
                      ♪ ${tweet.song_name}
                    </div>
                  </div>
                </div>
                <div class="content__bottom">
                  <div class="content__bottom__text">
                    ${tweet.text}
                  </div>
                  <div class="content__bottom__bottom">
                    <div class="content__bottom__bottom__link">
                      <a href="${tweet.link}" target="_blank">Music Link</a>
                    </div>
                    <div class="content__bottom__bottom__likes">
                      <ul>
                        <li class="like__top">  
                          <i class="fas fa-heart"></i>
                        </li>
                        <li class="like__bottom">
                          ${tweet.likes}
                        </li>
                      </ul>
                    </div>
                    <div class="content__bottom__bottom__trash-btn">
                      <a href="/tweets/${tweet.id}" data-method="get">
                        <i class="fas fa-angle-double-right"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </div>`
    search_list.append(html);
  }
  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }
  $(".form-control").on("keyup",function() {
    let input = $(".form-control").val();
    $.ajax({
      type: 'GET',
      url: '/tweets/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(tweets) {
      $(".contents").empty();
      if (tweets.length !== 0) {
        tweets.forEach(function(tweet) {
          appendTweet(tweet);
        });
      }
      else {
        appendErrMsgToHTML("Sorry, not found");
      }
    }) 
    .fail(function(){
      alert('error');
    });
  });
});