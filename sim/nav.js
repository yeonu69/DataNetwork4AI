// 각 시뮬레이터 위쪽에 "이 장의 시뮬레이터" 메뉴를 붙입니다.
(function(){
  var m=location.pathname.match(/ch(\d\d)\/([^\/]*)$/);if(!m)return;
  var ch=+m[1],file=m[2]||"index.html";
  function build(){
    var c=window.SIMS&&SIMS[ch];if(!c)return;
    var n=document.createElement('nav');n.className='simnav';
    var h='<span class="lbl">'+ch+'장 시뮬레이터</span>';
    c.s.forEach(function(x,i){h+='<a href="'+(x[0]=="index.html"?"./":x[0])+'"'+(x[0]==file?' class="on"':'')+' title="'+x[2]+'">'+(i+1)+'. '+x[1]+'</a>'});
    n.innerHTML=h;var hd=document.querySelector('header');hd.parentNode.insertBefore(n,hd.nextSibling);
  }
  if(window.SIMS)build();else{var s=document.createElement('script');s.src='../list.js';s.onload=build;document.head.appendChild(s)}
})();
