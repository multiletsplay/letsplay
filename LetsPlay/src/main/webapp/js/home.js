// ------------
// 디테일 캐러셀
// ------------


//모든 div의 참조값이 순서대로 담겨있는 배열 얻어내기
const items = document.querySelectorAll("li.nav__item a")


// 위의 모든 div에 "mouseover" 이벤트 리스너 함수를 등록해 보세요.
for(let i=0;i<items.length;i++){
  items[i].addEventListener("click",function(){
    items[i].style.color = 'red';
      console.log('click')
    });
}
