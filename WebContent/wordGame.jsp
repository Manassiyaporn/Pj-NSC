<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>บทเรียน</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!--<link rel="stylesheet" href="css/HiSpeech.css" />-->
<!--<link rel="stylesheet" href="css/my.css" />-->
<script src="js/HiSpeech.js"></script>

<script src="js/wavesurfer.min.js"></script>
<script src="js/webaudio.js"></script>
<script src="js/drawer.js"></script>
<script src="js/drawer.canvas.js"></script>
<script src="js/wavesurfer.microphone.js"></script>
<!--<script src="js/app.js"></script>-->
<script type="text/javascript">
	'use strict';

	//Create an instance
	var wavesurfer = Object.create(WaveSurfer);
	//var wavesurfer1 = Object.create(WaveSurfer);

	//Init & load
	document.addEventListener('DOMContentLoaded', function() {
		var options = {
			container : '#waveform',
			waveColor : 'black',
			loopSelection : false,
			cursorWidth : 0
		};

		// Init wavesurfer
		wavesurfer.init(options);

		// Init Microphone plugin
		var microphone = Object.create(WaveSurfer.Microphone);
		microphone.init({
			wavesurfer : wavesurfer
		});

		// start/stop mic on click
		document.querySelector('#micBtn').onclick = function() {
			if (microphone.active) {
				microphone.stop();
			} else {
				microphone.start();
			}
		};

		/*var options1 = {
			container : '#waveform1',
			waveColor : 'black',
			//progressColor : 'purple',
			//loaderColor : 'purple',
			//cursorColor : 'navy'
			loopSelection : false,
			cursorWidth : 0
		}*/
		//wavesurfer1.init(options1);
		//wavesurfer1.load('Audio/vowel/a.mp3');
		/*document.querySelector('#micBtn1').onclick = function() {
			wavesurfer1.load('Audio/vowel/1.mp3');
			wavesurfer1.play();
		};*/
	});
</script>
<!--<script type="text/javascript">
function readvdo() {
	var vowel = document.getElementById("vowelId");
	var vowel_str = vowel.options[con.selectedIndex].value;
	console.log(vowel_str);
	alert(vowel_str);
	$(document).ready(function(){
		$("button").click(function(){
			$.get("vowelLessonData.jsp?vowel_str="+vowel_str,function(data,status){
				alert("Data:"+data+"\nStatus:"+status);
			});
		});
	});
}
</script>-->
<script src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	var ranWord;
	var rWord = 0;
	var scoreWord = document.getElementById("scoreRanWord");
	function myFunction() {
		/*var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("show_ranword").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "randomWordGame.jsp", "true");
		xmlhttp.send();*/

		$(document).ready(function() {
			//$("button").click(function(){
			$.get("randomWordGame.jsp", function(data, status) {
				//alert("Data: " + data + "\nStatus: " + status);
				ranWord = data;
				if(rWord <10){
					$("#show_ranword").empty();
					$("#show_ranword").append(ranWord);
					rWord++;
					//alert(rWord);
				}else{
					alert("คุณทำได้ "+scoreWord+" คำ จากจำนวนทั้งหมด 10 คำ");
				}
			});
			//});
		});
	}
</script>

<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/HiSpeech.js"></script>

<!--<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>-->

</head>
<body onload="myFunction()">
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">PronouncelT</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">PronouncelT</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.html"><span
						class="glyphicon glyphicon-home"></span>หน้าแรก</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">บทเรียน<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="vowelLesson.jsp">สระ</a></li>
						<li><a href="consonantLesson.jsp">พยัญชนะ</a></li>
						<li><a href="wordLesson.jsp">คำ</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">แบบทดสอบ<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="wordGame.jsp">คำพยางค์เดียว</a></li>
						<li><a href="wordsGame.html">คำหลายพยางค์</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<div class="row">
		<div class="col-xs-2 col-sm-2 col-md-2"></div>
		<div class="col-xs-8 col-sm-8 col-md-8">
			<div class="text-center">
				<h3>แบบทดสอบ : คำพยางค์เดียว</h3>
			</div>
			<br>
			<div class="row">
			<div class="text-right">
				<div class="col-xs-10 col-sm-10 col-md-10">score :</div>
				<div class="col-xs-2 col-sm-2 col-md-2 text-left" id="scoreRanWord"></div>
			</div>
			</div>
			<div class="row">
				<!-- เช็คเสียงว่าถูกต้องหรือไม่ -->
				<div style="margin: auto; width: 40%;" class="col-xs-6 col-sm-6 col-md-6 text-center">
					<br>
					<!-- textarea สำหรับใช้แสดง ข้อความที่แปลงจากเสียงพูด-->
					<div id="show_vowel"></div>
					<textarea id="transcript" name="transcript" cols="40" rows="3" class="img-responsive"></textarea>
					<br> <br>
					<!--div นี้ เราจะใช้แสดง คำแนะนำ การใช้งาน หรือสถานะ-->
					<div id="instructions"></div>
					<br>
					<!--   ปุ่มนี้ เราใช้สำหรับควบคุมการทำงาน การจดจำเสียงพูดและแปลงเป็นข้อความ-->
					<button id="start_button">Click to Start</button>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 text-center">
					<div>
						<img alt="" src="img/Waiter.png" width="250" height="300" class="img-responsive">
					</div>
					<div>
						<div>
						<h4 id="show_ranword"></h4>
							<%
								/*String userDB = "root";
								String pwdDB = "";
								String urlDB = "jdbc:mysql://localhost:3306/pronounceit?";

								try {
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection(urlDB, userDB,
											pwdDB);

									//String sql = "SELECT 'word_id','word_word',COUNT(`word_id`) FROM word";
									String sql = "SELECT * FROM word ORDER BY RAND()LIMIT 1";
									Statement stmt = con.createStatement();
									ResultSet rs = stmt.executeQuery(sql);

									while (rs.next()) {
										String id = rs.getString("word_id");
										String word = rs.getString("word_word");

										out.println(word);
									}
									stmt.close();
									con.close();
								} catch (Exception e) {
									out.print("Exception:" + e);
								}*/
							%>
						</div>
						<button id="button_random" onClick="myFunction()">ไปยังคำถัดไป</button>
						<div id="name1" onClick="myFunction1()"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-2 col-md-2"></div>
	</div>
	<script type="text/javascript">
		var final_transcript = ''; // ตัวแปร สำหรับเก็บข้อความที่แปลงจากเสียง  
		var recognizing = false; // กำหนดค่าเริ่มต้นการจดจำเสียง เริ่มต้น ให้เป็น false ไม่ทำงาน  
		//var language = 'en-US';  // กำหนดภาษา en-US,  
		var language = 'th-TH'; // กำหนดภาษา th-TH, 
		
		var word_con;
		var scoreWord = 0;
		
		$(function() {
			
			$('#scoreRanWord').append(scoreWord);
			// ตรวจสอบ browser ว่าสนับสนุนการใช้งาน Speech API หรือไม่  
			if (!('webkitSpeechRecognition' in window)) {
				alert("Your Browser does not support the Speech API");
			} else {

				// สร้าง recognition object และกำหนด event handlers  
				// (onstart , onerror, onend, onresult)  

				var recognition = new webkitSpeechRecognition(); // สร้าง recognition object   
				recognition.continuous = true; // กำหนด true ให้รับค่า จากเสียงไปเรื่อยๆ จนกว่าจะกดปุ่มหยุด  
				recognition.interimResults = true; // แสดงข้อความช่วงจังหวะหรือไม่ กรณีพูดยาวๆ  
				recognition.lang = language; // กำหนดภาษา จากตัวแปรด้านบน  

				recognition.onstart = function() {
					// เมื่อเกิดการเริ่มทำงานของการจดจำเสียง มาจากคำสั่ง recognition.start();  
					recognizing = true; // เปลี่ยนค่าให้เริ่มทำการจดสับเสียงเป็น true เริ่มทำงาน  
					$('#instructions').html('Speak slowly and clearly'); // แสดงคำแนะนำ   
					$('#start_button').html('Click to Stop'); // เมื่อกดแล้วเปลี่ยนข้อความปุ่มเป็น คลิกอีกทีเพื่อหยุด หรือ Stop  
				};

				recognition.onerror = function(event) {
					// ถ้าเกิดข้อผิดพลาด ทำงานส่วนนี้  
					$('#instructions').html("There was a recognition error..."); // แจ้งสถานะถ้าเกิดข้อผิดพลาด  
				};

				recognition.onend = function() {
					// ถ้าจบการทำงาน เช่นหยุดด้วยคำสั่ง recognition.stop();  
					// หรือไม่ได้พูดเพื่อใช้งาน การจดจำเสียงนาน ก็จะหยุดการทำงานเอง  
					recognizing = false; // กำหนดให้การจดจำเสียงอยูในสถานะหยุดการทำงาน  
					$('#instructions').html('Done'); // แสดงสถานะว่าเสร็จสิ้นแล้ว Done  
					$('#start_button').html('Click to Start'); // เปลี่ยนข้อความปุ่มกดให้เป็นค่าเริ่มต้น  
				};

				recognition.onresult = function(event) {
					// เมื่อแปลงเสียงเป็นข้อความสำเร็จ ส่งผลลัธ์กลับมา  
					// ตัวแปรไว้เก็บข้อความในช่วงจังหวะหนึ่งจังหวะใดบางช่วง กรณีพูดยาวๆ  
					var interim_transcript = ''; // ปกติค่านี้ไม่ค่อยได้ใช้ จะใช้ค่า final มากกว่า  

					// ถอดจากข้อความจาก array ผลลัพธ์  
					for (var i = event.resultIndex; i < event.results.length; ++i) {
						// ถ้าเป็นค่าสุดท้ายแล้ว หยุดพูด หรือไม่ได้พูดต่อ  
						if (event.results[i].isFinal) {
							// เอาข้อความผลัพธ์ที่ได้ มาต่อๆ กันและกับในตัวแปร final_transcript  
							final_transcript += event.results[i][0].transcript;
						} else {
							// ถ้าเป็นค่าข้อความระหว่างช่วงเวลา ในกรณีพูดยาวๆ เก็บในตัวแปร   
							// เก็บในตัวแปร  interim_transcript  
							interim_transcript += event.results[i][0].transcript;
						}
					}

					// บรรทัดที่ เอาไว้ทดสอบดูค่า ใน console  ไม่ได้ใช้ปิดไป  
					//                console.log("interim:  " + interim_transcript);   
					//                console.log("final:    " + final_transcript);  

					if (final_transcript.length > 0) { // นับความยาวข้อความ ถ้ามากกว่า 0 แสดงว่ามีค่า  
						// ตัวแปร final_transcript คือค่าข้อความที่ได้ เอาไปใช้งานต่อได้  
						//$('#transcript').val(final_transcript); // แสดงค่าใน textarea
						 word_con = final_transcript.trim();
		                 $('#transcript').val(word_con);
						
					}
				};

				// ภ้ากดปุ่ม id start_button  
				$("#start_button").click(function(e) {
					e.preventDefault();

					// การจดจำเสียงกำลังทำงานอยู่หรือไม่ กดครั้งแรก จะยังไม่ทำงาน  
					if (recognizing) { // ภ้าทำงานอยู่ เมื่อกดก็จะเป็นหยุด  
						recognition.stop(); // ให้หยุดการจัดจำเสียง  
						$('#start_button').html('Click to Start Again'); // เปลี่ยนข้อความปุ่ม แนะนำกดใหม่ ถ้าต้องการจดจำเสียงอีกครั้ง  
							recognizing = false; // เปลี่ยนสถานะว่าหยุดทำงาน  
								
							var ranWord1 = document.getElementById("show_ranword").innerHTML;
							var ranWord2 = ranWord1.trim()
							//alert("ranWord2 = "+ranWord2);
							//alert("ranWord2.length = "+ranWord2.length);
		                    //alert(word_con.length+", "+ ranWord2.length);
							//alert(word_con);
							if (word_con == ranWord2) {
		                    	//$("#show_vowel").empty();
		                    	//$("#show_vowel").append("ออกเสียงถูก");
								//alert(scoreWord++);
								$("#show_vowel").empty();
								$("#show_vowel").append("ออกเสียงถูกและได้คะแนนเพิ่มไปอีก 1 คะแนน");
								scoreWord++;
								$("#scoreRanWord").empty();
		                    	$("#scoreRanWord").append(scoreWord);
							} else {
								//$("#show_vowel").empty();
								//$("#show_vowel").append("ออกเสียงผิด ลองพูดให้อีกครั้งนะ ");
								//alert(scoreWord);
								$("#show_vowel").empty();
								$("#show_vowel").append("ออกเสียงผิด ลองพยายามหน่อยนะ");
		                    	//$("#scoreRanWord").append(scoreWord);
		                    	
							}

					} else { // ถ้ากดแล้วสถานะการจดจำเสียงหยุดอยู่ ให้ทำงาน  
							final_transcript = ''; // กำหนดตัวแปรเก็บข้อความเป็นค่าว่างก่อน  

							// ขออนุญาตใช้งานการจดจำเสียงและเริ่มใช้งาน  
							recognition.start();

							// แจ้งคำแนะนำว่าให้ กด allow หรือตกลง เพื่ออนุญาตให้ใช้งาน Microphone  
							$('#instructions').html('Allow the browser to use your Microphone');
							$('#start_button').html('waiting'); // เปลี่ยนข้อความปุ่ม ว่ารอ waiting  
							$('#transcript').val(''); // แสดงข้อความเป็นค่าว่าง   
					}
				});
			}
		});
	</script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</body>
</html>