<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
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
	var wavesurfer1 = Object.create(WaveSurfer);

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

		var options1 = {
			container : '#waveform1',
			waveColor : 'black',
			//progressColor : 'purple',
			//loaderColor : 'purple',
			//cursorColor : 'navy'
			loopSelection : false,
			cursorWidth : 0
		}
		wavesurfer1.init(options1);
		//wavesurfer1.load('Audio/vowel/a.mp3');

		document.querySelector('#micBtn1').onclick = function() {
			wavesurfer1.load('Audio/word/15.mp3');
			wavesurfer1.play();
		};
	});
</script>

<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/HiSpeech.js"></script>
<script>
	/*function loadWords() {
		//alert('loadWord');
		var con = document.getElementById("list_consonant");
		var con_str = con.options[con.selectedIndex].value;
		var vowel = document.getElementById("list_vowel");
		var vowel_str = vowel.options[vowel.selectedIndex].value;
		//alert(con_str + "," + vowel_str);
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("list_word").innerHTML = xmlhttp.responseText;
			}
			xmlhttp.open("GET", "conWordLesson.jsp?con_str="+con_str+"&vowel_str="+vowel_str, true);
			//xmlhttp.open("GET","NewFile.jsp", true);
			xmlhttp.send();
		}
	}*/
	/*function loadWords() {

	}*/
	// เมื่อเปลี่ยนค่าของ select id เท่ากับ list1  
	/*$("select#list_consonant" + "select#list_vowel").change(function() {
		var con = document.getElementById("list_consonant");
		var con_str = con.options[con.selectedIndex].value;
		var vowel = document.getElementById("list_vowel");
		var vowel_str = vowel.options[vowel.selectedIndex].value;
		// ส่งค่า ตัวแปร list1 มีค่าเท่ากับค่าที่เลือก ส่งแบบ get ไปที่ไฟล์ data_for_list2.php  
		$.get("conWordLesson.jsp", {
			list1 : $(this).val()
		}, function(data) { // คืนค่ากลับมา  
			$("select#list_word").html(data); // นำค่าที่ได้ไปใส่ใน select id เท่ากับ list2        
			$("select#list_word").trigger("change"); // อัพเดท list2 เพื่อให้ list2 ทำงานสำหรับรีเซ็ตค่า  
		});
	});*/
	function loadWords() {
		var con = document.getElementById("list_consonant");
		var con_str = con.options[con.selectedIndex].value;
		var vowel = document.getElementById("list_vowel");
		var vowel_str = vowel.options[vowel.selectedIndex].value;
		console.log(con_str + "," + vowel_str);
		$.get("conWordLesson.jsp?con_str=" + con_str + "&vowel_str="
				+ vowel_str, function(data, status) {
			console.log("Data: " + data + "\nStatus: " + status);
			$("#list_word").empty();
			$("#list_word").append("<option value=\"\">กรุณาเลือก</option>");
			$("#list_word").append(data);
		});
	}
</script>
</head>
<body>
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
		<!-- /.container-fluid -->
	</nav>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<h2>บทเรียน : คำ เจอ</h2>
			</div>
			<div class="col-md-2 text-center" onload="loadWords()">
				กรุณาเลือกพยัญชนะ <br /> 
				<select class="form-control" id="list_consonant"  name="list_consonant">
					<%
						String userDB = "root";
						String pwdDB = "";
						String urlDB = "jdbc:mysql://localhost:3306/pronounceit?";

						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(urlDB, userDB,
									pwdDB);
							out.print("connection establish: " + con);

							String sql = "select * from consonant";
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery(sql);

							while (rs.next()) {
								String id_Consonant = rs.getString("Consonant_id");
								String name_Consonant = rs.getString("Consonant_word");
								out.println(" <option value=" + id_Consonant + ">"
										+ name_Consonant + "</option>");
							}
							stmt.close();
							con.close();
						} catch (Exception e) {
							out.print("Exception:" + e);
						}
					%>
					<!-- script type="text/javascript">
						function dropdownCon() {
							var con = document.getElementById('list_consonant').value;
							if (con === "<!--%select * from word%>") {
								
							}
						}
					</script-->
				</select><br> กรุณาเลือกสระ <br /> <select class="form-control"
					id="list_vowel" name="list_vowel">
					<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(urlDB, userDB,
									pwdDB);
							out.print("connection establish: " + con);

							String sql = "select * from vowel";
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery(sql);

							while (rs.next()) {
								String id_Vowel = rs.getString("Vowel_id");
								String word_Vowel = rs.getString("Vowel_word");
								out.println("<option value=" + id_Vowel + ">" + word_Vowel
										+ "</option>");
							}
							stmt.close();
							con.close();
						} catch (Exception e) {
							out.print("Exception:" + e);
						}
					%>
				</select><br>
				<button onClick="loadWords()">เลือก</button>
				<br> <br> กรุณาเลือกคำ <br /> 
				<select class="form-control" id="list_word" name="list_word">
					<!--%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(urlDB, userDB,pwdDB);
							out.print("connection establish: " + con);

							String sql = "select * from word";
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery(sql);

							while (rs.next()) {
								String id_word = rs.getString("word_id");
								String word_word = rs.getString("word_word");
								String id_Wcon = rs.getString("Consonant_id");
								String id_Wvowel = rs.getString("Vowel_id");
					%-->
					<!-- while(con_str=id_Wcon){ while(vowel_str=id_Wvowel){
					alert(word_word) } }-->
					<!--%
						out.println("<option value=" + id_word + ">" + word_word+ "</option>");
							}
							stmt.close();
							con.close();
						} catch (Exception e) {
							out.print("Exception:" + e);
						}
					%-->

				</select><br>
				<!-- <button onClick="loadWords()">OK</button>-->
				<script>
					$(function() {
						// bind change event to select
						$('#list_word').bind('change', function() {
							var url = $(this).val(); // get selected value
							if (url) { // require a URL
								window.location = url; // redirect
							}
							return false;
						});
					});
				</script>
			</div>
			<div class="col-md-3 col-xs-4 text-center">
				<!--<div>2 แอนนิเมชั่น</div>-->
				<img src="img2/1186945_10202925496287057_3269783426668126358_n.jpg" class="img-responsive">
				<!-- เช็คเสียงว่าถูกต้องหรือไม่ -->
				<div style="margin: auto; width: 80%;">
					<br>
					<!-- textarea สำหรับใช้แสดง ข้อความที่แปลงจากเสียงพูด-->
					<div id="show_vowel"></div>
					<textarea id="transcript" name="transcript" cols="40" rows="3" class="img-responsive"></textarea>
					<br>
					<br>
					<!--div นี้ เราจะใช้แสดง คำแนะนำ การใช้งาน หรือสถานะ-->
					<div id="instructions"></div>
					<br>
					<!--   ปุ่มนี้ เราใช้สำหรับควบคุมการทำงาน การจดจำเสียงพูดและแปลงเป็นข้อความ-->
					<button id="start_button">Click to Start</button>
				</div>
			</div>
			<div class="col-md-3 col-xs-4 text-center">
				<!--<div>3 vdo</div>-->
				<video width="350" height="400" controls="" autoplay="" class="img-responsive">
					<source src="VDO/word/15.mp4" type="video/mp4">
				</video>
			</div>
			<div class="col-md-4 col-xs-4">
				<!--<div>4 กล้อง</div>-->
				<div class="text-center">
					<video id="video" width="300" height="300" autoplay="" class="img-responsive">
						<canvas id="canvas" width="1" height="1"></canvas>
					</video>
				</div>
				<!--<input type="file" accept="image/*capture=camera">
                    <input type="file" accept="video/*;capture=camcorder">
                    <input type="file" accept="audio/*;capture=microphone">-->
				<!--<div>5 ระดับเสียง</div>-->
				<!--<div class="progress">
					<a href="js/AudioLesson.js">
						<div class="progress-bar" role="progressbar" id="analyser"
							aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
							style="width: 80%"></div>
					</a>
				</div>
				<div class="progress">
					<div class="progress-bar progress active" role="progressbar"
						id="wavedisplay" aria-valuenow="80" aria-valuemin="0"
						aria-valuemax="100" style="width: 60%">
						<div class="bar" style="width: 0%"></div>
					</div>
				</div>
				<button id="record" type="button" class="btn btn-success Lbutton"
					onclick="toggleRecording(this);">Start</button>
				<a id="save"
					href="blob:http%3A//webaudiodemos.appspot.com/e0cb76d3-5ab3-456d-a0dc-72edad973b64"
					download="myRecording00.wav">
					<button id="save" type="button" class="btn btn-danger Lbutton">
						Check</button>
				</a>-->
				<div id="demo">
					<!-- รับเสียงจากวิดีโฮ -->
					<div id="waveform1"></div>
					<div class="controls text-center">
						<button id="micBtn1" class="btn btn-primary" data-action="start">
							Microphone: <i class="glyphicon glyphicon-play"></i> Start / <i
								class="glyphicon glyphicon-stop"></i> Stop
						</button>
					</div>
					<!-- รับเสียงจากไมโครโฟน -->
					<div id="waveform"></div>
					<div class="controls text-center">
						<button id="micBtn" class="btn btn-primary" data-action="start">
							Microphone: <i class="glyphicon glyphicon-play"></i> Start / <i
								class="glyphicon glyphicon-stop"></i> Stop
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--script type="text/javascript">
		$(function() {
			$("select#list_consonant").change(function() {
				$.get("conWordLesson.jsp", {
					list_consonant : $(this).val()
				}, function(data) {
					$("select#list_vowel").html(data);
				});
			});
		});
	</script-->
<script type="text/javascript">
var final_transcript = '';  // ตัวแปร สำหรับเก็บข้อความที่แปลงจากเสียง  
var recognizing = false;  // กำหนดค่าเริ่มต้นการจดจำเสียง เริ่มต้น ให้เป็น false ไม่ทำงาน  
//var language = 'en-US';  // กำหนดภาษา en-US,  
var language = 'th-TH';  // กำหนดภาษา th-TH, 

var word_con;

$(function(){  
  
        // ตรวจสอบ browser ว่าสนับสนุนการใช้งาน Speech API หรือไม่  
        if (!('webkitSpeechRecognition' in window)) {  
            alert("Your Browser does not support the Speech API");  
        }else{  
  
            // สร้าง recognition object และกำหนด event handlers  
            // (onstart , onerror, onend, onresult)  
  
            var recognition = new webkitSpeechRecognition(); // สร้าง recognition object   
            recognition.continuous = true;         // กำหนด true ให้รับค่า จากเสียงไปเรื่อยๆ จนกว่าจะกดปุ่มหยุด  
            recognition.interimResults = true;     // แสดงข้อความช่วงจังหวะหรือไม่ กรณีพูดยาวๆ  
            recognition.lang = language;           // กำหนดภาษา จากตัวแปรด้านบน  
  
            recognition.onstart = function() {  
                // เมื่อเกิดการเริ่มทำงานของการจดจำเสียง มาจากคำสั่ง recognition.start();  
                recognizing = true;  // เปลี่ยนค่าให้เริ่มทำการจดสับเสียงเป็น true เริ่มทำงาน  
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
                recognizing = false;  // กำหนดให้การจดจำเสียงอยูในสถานะหยุดการทำงาน  
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
  
                if(final_transcript.length > 0) { // นับความยาวข้อความ ถ้ามากกว่า 0 แสดงว่ามีค่า  
                    // ตัวแปร final_transcript คือค่าข้อความที่ได้ เอาไปใช้งานต่อได้  
                    //$('#transcript').val(final_transcript); // แสดงค่าใน textarea
                	 word_con = final_transcript.trim();
                     $('#transcript').val(vowel_con);
                }  
            };  
  
  
            // ภ้ากดปุ่ม id start_button  
            $("#start_button").click(function(e) {  
                e.preventDefault();  
                  
                // การจดจำเสียงกำลังทำงานอยู่หรือไม่ กดครั้งแรก จะยังไม่ทำงาน  
                if (recognizing) { // ภ้าทำงานอยู่ เมื่อกดก็จะเป็นหยุด  
                    recognition.stop();  // ให้หยุดการจัดจำเสียง  
                    $('#start_button').html('Click to Start Again'); // เปลี่ยนข้อความปุ่ม แนะนำกดใหม่ ถ้าต้องการจดจำเสียงอีกครั้ง  
                    recognizing = false;  // เปลี่ยนสถานะว่าหยุดทำงาน  
                    
                    var word1 = "เจอ";
                    //alert(vowel_con+", "+vowel1);
                    //alert(vowel_con.length+", "+vowel1.length);
                    
                    if(word_con==word1){
                    	$("#show_vowel").empty();
    					$("#show_vowel").append("ออกเสียงถูก");
                    }else{
                    	$("#show_vowel").empty();
    					$("#show_vowel").append("ออกเสียงผิด ลองพูดให้อีกครั้งนะ ");
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