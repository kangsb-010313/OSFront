<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>로또 번호 생성기 (JSP)</title>
  <style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    input[type=number] { width: 50px; }
    .lotto-set { margin: 10px 0; }
    .result { margin-top: 20px; }
    #map {
      width: 50%;
      height: 400px;
      margin-top: 30px;
    }
  </style>
</head>
<body>

<h2>로또 번호 생성기</h2>

<!-- 몇 세트의 로또를 만들지 입력 -->
<label>몇 세트? 
  <input type="number" id="setCount" value="3" min="1" max="10">
</label>
<button id="generateBtn" type="button">로또 생성</button>

<!-- 만들어진 로또 번호를 보여주는 영역 -->
<div id="lottoArea"></div>

<h3>당첨 번호 입력 (6개)</h3>
<div id="winInputs">
  <input type="number" class="winNum" min="1" max="45">
  <input type="number" class="winNum" min="1" max="45">
  <input type="number" class="winNum" min="1" max="45">
  <input type="number" class="winNum" min="1" max="45">
  <input type="number" class="winNum" min="1" max="45">
  <input type="number" class="winNum" min="1" max="45">
</div>
<br>
<button id="checkBtn" type="button">결과 확인</button>

<!-- 결과를 보여주는 영역 -->
<div class="result" id="resultArea"></div>

<!-- 카카오 지도 표시 영역 -->
<div id="map"></div>

<script>
// ===== 로또 번호 관련 =====
let lottoSets = [];

// 랜덤하게 6개의 로또 번호(1~45, 중복 없음)를 반환
function getRandomLottoNumbers() {
  const numbers = Array.from({length: 45}, (_, i) => i + 1);
  for (let i = numbers.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [numbers[i], numbers[j]] = [numbers[j], numbers[i]];
  }
  return numbers.slice(0, 6).sort((a, b) => a - b);
}

function generateLottoSets() {
  const count = parseInt(document.getElementById("setCount").value) || 3;
  const area = document.getElementById("lottoArea");
  area.innerHTML = "";
  lottoSets = [];
  for (let i = 0; i < count; i++) {
    const set = getRandomLottoNumbers();
    lottoSets.push(set);
    area.innerHTML += '<div class="lotto-set">' + (i + 1) + '번: [' + set.join(', ') + ']</div>';
  }
  document.getElementById("resultArea").innerHTML = "";
}

function checkResults() {
  const winNums = Array.from(document.querySelectorAll('.winNum'))
    .map(input => parseInt(input.value)).filter(n => !isNaN(n));
  const resultArea = document.getElementById("resultArea");
  if (winNums.length !== 6) {
    resultArea.innerHTML = "당첨 번호 6개를 정확히 입력해주세요."; return;
  }
  if (new Set(winNums).size !== 6) {
    resultArea.innerHTML = "당첨 번호는 중복 없이 6개를 입력하세요."; return;
  }
  for (let n of winNums) {
    if (n < 1 || n > 45) {
      resultArea.innerHTML = "번호는 1~45 사이여야 합니다."; return;
    }
  }
  if (lottoSets.length === 0) {
    resultArea.innerHTML = "먼저 로또 번호를 생성하세요."; return;
  }
  const winSet = new Set(winNums);
  let resultHTML = "<h3>결과</h3>";
  for (let i = 0; i < lottoSets.length; i++) {
    const my = lottoSets[i];
    const match = my.filter(n => winSet.has(n)).length;
    let rank;
    if (match === 6) rank = "1등";
    else if (match === 5) rank = "2등";
    else if (match === 4) rank = "3등";
    else if (match === 3) rank = "4등";
    else if (match === 2) rank = "5등";
    else rank = "꽝";
    resultHTML += (i + 1) + "번 세트: " + match + "개 일치 → <strong>" + rank + "</strong><br>";
  }
  resultArea.innerHTML = resultHTML;
}

document.addEventListener('DOMContentLoaded', function() {
  document.getElementById("generateBtn").onclick = generateLottoSets;
  document.getElementById("checkBtn").onclick = checkResults;
});

</script>

<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5fe0d3fc0a2057f2003e0006cc9b198b"></script>
<script>
// 현재 위치 기반 지도 표시
window.onload = function() {
  var mapContainer = document.getElementById('map');
  var defaultCenter = new kakao.maps.LatLng(37.5665, 126.9780); // 기본: 서울시청

  var mapOption = { 
      center: defaultCenter,
      level: 3
  };  
  var map = new kakao.maps.Map(mapContainer, mapOption);
  var marker = null;

  // 브라우저에서 위치정보 지원하는지 확인
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var lat = position.coords.latitude;
      var lng = position.coords.longitude;
      var locPosition = new kakao.maps.LatLng(lat, lng);
      map.setCenter(locPosition);
      marker = new kakao.maps.Marker({
        map: map,
        position: locPosition
      });
    }, function(error) {
      // 실패(거부, 에러 등) 시 그냥 기본 위치(서울시청)
      marker = new kakao.maps.Marker({
        map: map,
        position: defaultCenter
      });
    });
  } else {
    // geolocation 미지원 브라우저
    marker = new kakao.maps.Marker({
      map: map,
      position: defaultCenter
    });
  }
};
</script>

</body>
</html>
