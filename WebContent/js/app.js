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
			wavesurfer1.load('Audio/vowel/a.mp3');
			wavesurfer1.play();
	};	
});