# Made with Framer
# by Min-Sang Choi
# www.framerjs.com

bg = new BackgroundLayer backgroundColor:'#7DB6E6'

container = new Layer width:400	, height:640, backgroundColor:'',shadowY:0, shadowBlur:0,  borderRadius:"50%",shadowColor:'rgba(0,0,0,0.1)'

imageLayer = new Layer width:600, height:480, image:"images/a8264df3c3f5091bb6cbc96ca7ecf183.jpg"
	
circle = new Layer 
	width:200, height:200, backgroundColor:'transparent'

container.addSubLayer(imageLayer)
container.addSubLayer(circle)
circle.center()
circle.style =
	borderRadius:"50%"

circle.addSubLayer(imageLayer)
imageLayer._prefer2d = true
imageLayer.center()

textlabel = new Layer x:0, y:circle.y+circle.height+60, width:260, height:180, backgroundColor:'transparent'

textlabel.html = "widen your perspective about street dogs, they  deserve their owners too"
textlabel.style =
	textAlign:'center'
	fontFamily:'Roboto'
	color:'#fff'

container.addSubLayer(textlabel)
textlabel.centerX()
		
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
	
textarea = new Layer x:0, y: 480, width:300, height:640, backgroundColor:'transparent', opacity:0, fontSize:'14px'
textarea.html = '<bold>we are always looking for new volunteers to pitch in a hand (or paw) and help us take care of another animal.       <br /><br />415-952-PAWS helpus@pawsforpawsperity.org</bold>'

textarea.style = 
	color:'#FFF'
	fontSize:'18px'
	padding:'24px'
	
container.addSubLayer(textarea)
textarea.y = 80

circle.on Events.Click,->
	scalemask()
	
	textarea.animate
		delay:0.1
		properties:
			y:360
			opacity:1
		curve:myspring

container.center()