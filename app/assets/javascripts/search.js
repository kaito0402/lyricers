$(function() {
  let search_list = $(".contents");
  function appendTweet(tweet) {
    let signedin = gon.signed_user;
    let html =`<div class="content">
                <div class="content__top">
                  <div class="content__top__user_name">
                    <a href="/users/${tweet.user_id}" data-method="get" class="personal">
                      ${tweet.name}
                    </a>
                  </div>
                  <div class="content__top__lyric">
                    ${tweet.lyric}
                  </div>
                  <div class="content__top__info">
                  ${tweet.song_name == "" ? `<div class="content__top__info__sn">♪ unknown</div>` : `<div class="content__top__info__sn">♪ ${tweet.song_name}</div>`}
                  ${tweet.artist == "" ? `<div class="content__top__info__artist">@ unknown</div>` : `<div class="content__top__info__artist">@ ${tweet.artist}</div>`}
                  </div>
                </div>
                <div class="content__bottom">
                  <div class="content__bottom__text">
                    ${tweet.text}
                  </div>
                  <div class="content__bottom__bottom">
                    ${tweet.link == "" ? `<div class="content__bottom__bottom__link-false">
                    <i class="fab fa-youtube"></i>
                  </div>` : `<div class="content__bottom__bottom__link">
                    <a href="${tweet.link}" target="_blank"><i class="fab fa-youtube"></i></a>
                  </div>`}
                    
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
                      ${signedin ? `<a href="/tweets/${tweet.id}" data-method="get">
                      <i class="fas fa-angle-double-right"></i>
                    </a>` : ""}
                      
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