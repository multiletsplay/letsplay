<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<button type="button"  class="sport" name="spoId" onclick="location.href='/facility/list'">전체</button>
			<button type="submit"  class="sport" name="spoId" value="1">풋살</button>
			<button type="submit"  class="sport" name="spoId" value="2">테니스</button>
			<button type="submit"  class="sport" name="spoId" value="3">배드민턴</button>
			<button type="submit"  class="sport" name="spoId" value="4">탁구</button>
			<button type="submit"  class="sport" name="spoId" value="5">수영</button>
			<button type="submit"  class="sport" name="spoId" value="6">골프</button>


	<script>
		const button = document.getElementsByClassName('sport');
		
    button.addEventListener('click', function(){
			button.classList.add('active');
		})

	</script>
</div>
<!-- 상세조건검색 -->