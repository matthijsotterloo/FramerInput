# Framer Input

Framer module to easily turn your designs inputs into real inputs.

## How to add it

- Clone or download the repo.
- Copy `inputscript.coffee` into your projects `modules/` folder.
- Import it in your project by writing: `textfield = require "input"`.

## How to use it

Export your assets as you would do normally, then create an input object and place it over your designed input. Done!  
Remember that all parameters are optional.

```coffeescript
textfield = new textfield.Input
	setup: false
	text: "Some text"
	placeholder: "Username"
	placeholderColor: "#fff"
	type: "text"
	y: 240
	x: 90
	width: 500
	height: 60
```

#### Styling your input

```coffeescript
input.style = 
	fontSize: "30px"
	lineHeight: "30px"
	padding: "10px"
	color: "white"
	opacity: "0.5"
	fontFamily: "HelveticaNeue"
	...
```

#### Get the input value

You can access the `.value` property to get the value. For example to get the value on each key up you could do something like this

```coffeescript
input.on "keyup", ->
	print @value
```

#### Focusing the input via code

Imagine that you want to focus the input once you click "button1", here is an example:

```coffeescript
button1.on Events.Click, ->
	input.focus()
```
