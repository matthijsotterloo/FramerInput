#Input module by Matthijs Otterloo
class exports.Input extends Layer
	@define "style",
		get: -> @input.style
		set: (value) ->
			_.extend @input.style, value

	@define "value",
		get: -> @input.value
		set: (value) ->
			@input.value = value

	constructor: (options = {}) ->
		options.setup ?= false
		options.width ?= Screen.width
		options.clip ?= false
		options.height ?= 60
		options.backgroundColor ?= if options.setup then "rgba(255, 60, 47, .5)" else "transparent"
		options.fontSize ?= 30
		options.lineHeight ?= 30
		options.padding ?= 10
		options.fontFamily ?= ""
		options.opacity ?= 1
		options.text ?= ""
		options.placeholder ?= ""
		options.type ?= "text"

		super options

		@placeholderColor = options.placeholderColor if options.placeholderColor?
		@input = document.createElement "input"
		@input.id = "input-#{_.now()}"
		@input.style.cssText = "font-size: #{options.fontSize}px; line-height: #{options.lineHeight}px; padding: #{options.padding}px; width: #{options.width}px; height: #{options.height}px; border: none; outline-width: 0; background-image: url(about:blank); background-color: #{options.backgroundColor}; font-family: #{options.fontFamily}; opacity: #{options.opacity};"
		@input.value = options.text
		@input.type = options.type
		@input.placeholder = options.placeholder
		@form = document.createElement "form"

		@form.appendChild @input
		@_element.appendChild @form

		@backgroundColor = "transparent"
		@updatePlaceholderColor options.placeholderColor if @placeholderColor

	updatePlaceholderColor: (color) ->
		@placeholderColor = color
		if @pageStyle?
			document.head.removeChild @pageStyle
		@pageStyle = document.createElement "style"
		@pageStyle.type = "text/css"
		css = "##{@input.id}::-webkit-input-placeholder { color: #{@placeholderColor}; }"
		@pageStyle.appendChild(document.createTextNode css)
		document.head.appendChild @pageStyle

	focus: () ->
		@input.focus()
