let backgroundParticle = [];
let speedX = 1;
let speedY = 1;
let record, save, wind, water, rain, ocean;
let play, pause;
let podcast, rainSound, waterSound, windSound, oceanSound;
let songs = [];
let cnt = 0;
let initOnce = true,moveBar = false;
let mainSlider;
let recorder;
let soundFile;
let currentDuration = 0;
let dots = ".";
let saveAudio = false, recordSound = false;

function preload() {
  podcast = new p5.SoundFile("assets/podcast.wav", _ => {
    cnt += 1;
  });

  rainSound = new p5.SoundFile("assets/rain.wav", _ => {
    cnt += 1;
  });

  waterSound = new p5.SoundFile("assets/water.wav", _ => {
    cnt += 1;
  });

  windSound = new p5.SoundFile("assets/wind.wav", _ => {
    cnt += 1;
  });

  oceanSound = new p5.SoundFile("assets/ocean.wav", _ => {
    cnt += 1;
  });
}

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  init();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  recorder = new p5.SoundRecorder();
  soundFile = new p5.SoundFile();

  record = new Button(width * 0.2, height * .80, width * .15, height * .10, "Record");
  save = new Button(width * 0.45, height * .80, width * .15, height * .10, "Save");

  wind = new Button(width * 0.80, height * .20, width * .15, height * .10, "Wind");
  water = new Button(width * 0.80, height * .40, width * .15, height * .10, "Water");
  rain = new Button(width * 0.80, height * .60, width * .15, height * .10, "Rain");
  ocean = new Button(width * 0.80, height * .80, width * .15, height * .10, "Ocean");

  play = new Button(width * .25, height * .60, width * .07, height * .05, "Play");
  pause = new Button(width * .40, height * .60, width * .07, height * .05, "Pause");
}

function init() {
  for (let i = 0; i < parseInt(width * .20); i++) {
    backgroundParticle.push(new Particle(random(width), random(height)));
  }
}

function draw() {
  background(0);
  noStroke();

  if (cnt == 5) {
    frameRate(60);
    animateBackground();
    textSize(width*.05);
    text("Antigone Podcast",width*.33,height*.30);
    record.show();
    save.show();
    wind.show();
    water.show();
    rain.show();
    ocean.show();
    play.show();
    pause.show();

    if(recordSound){
      
      fill(255);
      circle(width*.02,height*.04,width*.02);
      fill(255,0,0);
      circle(width*.02,height*.04,width*.015);
    }
    if (initOnce) initSlider();
    if (!moveBar) mainSlider.value(podcast.currentTime());

  } 
  else{
    if(saveAudio && soundFile.isLoaded())
    {
      cnt = 5;
      soundFile.save();
      mainSlider.show();
    }else notLoaded();
  } 
}

function initSlider() {
  mainSlider = createSlider(0, podcast.duration());
  mainSlider.position(width * .10, height * .50);
  mainSlider.size(width * .45);
  mainSlider.addClass("mySliders");
 
  mainSlider.mouseClicked(() => {
    moveBar = !moveBar;
    podcast.jump(mainSlider.value());
  });

  initOnce = false;
}

function notLoaded() {
  frameRate(5);
  fill(255);
  textAlign(CENTER);
  textSize(width * .05);
  text("Loading" + dots, width / 2, height / 2)
  dots += ".";
  if (dots.length > 5) dots = "";
}

function animateBackground() {
  for (let i = 0; i < backgroundParticle.length; i++) {
    backgroundParticle[i].show();
    backgroundParticle[i].update();
  }
}

function mousePressed() {
  if (record.clicked()) {
    print("Started Recording...");
    recordSound = true;
    recorder.record(soundFile);
  }

  if (save.clicked()) {
    print("Saving...");
    recorder.stop();
    recordSound = false;
    stopAll();
    mainSlider.hide();
    saveAudio = true;
    cnt = -1;
  }

  if (play.clicked() && !podcast.isPlaying()) {
    podcast.play();
  }

  if (pause.clicked() && podcast.isPlaying()) {
    print(podcast.duration());
    podcast.pause();
  }


  if (wind.clicked())
    if (!windSound.isPlaying()) windSound.play();
    else windSound.stop();

  if (rain.clicked())
    if (!rainSound.isPlaying()) rainSound.play();
    else rainSound.stop();

  if (ocean.clicked())
    if (!oceanSound.isPlaying()) oceanSound.play();
    else oceanSound.stop();

  if (water.clicked())
    if (!waterSound.isPlaying()) waterSound.play();
    else waterSound.stop();

}

function stopAll() {
  podcast.stop();
  windSound.stop();
  rainSound.stop();
  oceanSound.stop();
  waterSound.stop();
}