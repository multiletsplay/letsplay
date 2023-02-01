


let observer = new IntersectionObserver((e)=>{
  //감시중인 박스가 화면에 등장하면 이쪽 코드가 실행 
  e.forEach((move)=>{
    if(move.isIntersecting){
      move.target.style.opacity = 1 ;
      move.target.style.transform = 'translateY(0rem)' ;
    }else{
      move.target.style.opacity = 0 ;
      move.target.style.transform = 'translateY(3rem)' ;
    }
    move.intersectionRatio
  })
})


let section = document.querySelectorAll('section')
observer.observe(section[0])
observer.observe(section[1])
observer.observe(section[2])
observer.observe(section[3])
observer.observe(section[4])
observer.observe(section[5])
observer.observe(section[6])