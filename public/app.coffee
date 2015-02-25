# Made with Framer
# by Min-Sang Choi
# www.framerjs.com

bg = new BackgroundLayer backgroundColor:'#7DB6E6'

container = new Layer width:640	, height:800, backgroundColor:'',shadowY:0, shadowBlur:0,  borderRadius:"50%",shadowColor:'rgba(0,0,0,0.1)'

imageLayer = new Layer width:640, height:480, image:"images/a8264df3c3f5091bb6cbc96ca7ecf183.jpg"
	
circle = new Layer 
	width:200, height:200, backgroundColor:'transparent'

container.addSubLayer(imageLayer)
container.addSubLayer(circle)
circle.center()
circle.style =
	borderRadius:"200%"

circle.addSubLayer(imageLayer)
imageLayer._prefer2d = true
imageLayer.center()

textlabel = new Layer x:0, y:circle.y+circle.height+60, width:260, height:180, backgroundColor:'transparent'

textlabel.html = "<bold>widen your perspective on happiness.<br />it's found in all places</bold>"
textlabel.style =
	textAlign:'center'
	color:'#fff'

container.addSubLayer(textlabel)
textlabel.centerX()
textlabel.style =
fontSize:'36px'
		
myspring = 'cubic-bezier(0.4, 0, 0.2, 1)'
moveup = 500

scalemask = () ->
	textlabel.destroy()
	
	circle.animate
		properties:
			width:moveup
			height:moveup
			x:Math.floor(container.width/2-moveup/2)
			y:Math.floor(container.height/2-moveup/2)
		curve:myspring
		time:0.6
	
	imageLayer.animate
		properties:
			x:Math.floor(moveup/2-imageLayer.width/2)-180
			y:Math.floor(moveup/2-imageLayer.height/2)-60
			borderRadius:"120%"
		curve:myspring
		time:0.6
	
textarea = new Layer x:0, y: 0, width:480, height:600, backgroundColor:'transparent', opacity:0
textarea.html = '<bold>we are always looking for new volunteers to pitch in a hand (or paw) and help us take care of another animal.       <br /><br />+14159527297 (PAWS)<br />or email us at helpus@pawsforpawsperity.org</bold>'

textarea.style = 
	color:'FFFF'
	fontSize:'32px'
	padding:'24px'
	
container.addSubLayer(textarea)
textarea.y = 60

circle.on Events.Click,->
	scalemask()
	
	textarea.animate
		delay:0.1
		properties:
			y:500
			opacity:1
		curve:myspring

container.center()