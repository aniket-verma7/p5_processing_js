var matrix = []; // holds all the matrix rain/stream on the canvas
var size;
var song;
let amp;

//loading soundFile here
function preload()
{
  song = loadSound('assets/song.wav');
}

//basic preemptive setup for proper working of the matrix animation with code
function setup() 
{
  createCanvas(window.innerWidth,window.innerHeight);
  background(0);
  size = round(random(8,15));
  initMatrix();
  amp = new p5.Amplitude();
}

/**
 * here we are creating the MatrixRain or Matrix Stream which is going to 
 * drop from top with a certain velocity/speed and its y will get update according to the
 * height of the canvas.
 */
function initMatrix()
{
  let x = 0;
  for (let i = 0; i <= width / size; i++) 
  {
    var mat = new MatrixRain(size);
    mat.symbolsStream(x);
    matrix.push(mat);
    x += size;
  }
}

/**
 * in draw we are playing music and rendering our matrix animation and every aspect of the canvas is closely connected 
 * to the amplitude of the music and it reacts to the highs and lows
 * the song is played in the loop as long as program runs
 */
function draw() 
{
  let ampLevel = amp.getLevel();
  background(200*ampLevel,200*ampLevel,200*ampLevel,255*ampLevel);
  
  if(!song.isPlaying())
  {
    song.play();
    amp.setInput(song);
  }
  for(let i=0;i<matrix.length;i++)
  matrix[i].rainStream(ampLevel);
}












