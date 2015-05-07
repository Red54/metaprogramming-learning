class Greeting
  constructor: (text) ->
    @text = text

  welcome: ->
    @text

my_object = new Greeting "Hello"

console.log my_object.welcome()
console.log ''
console.log my_object.constructor
console.log ''
console.log m for m of my_object
console.log ''
console.log my_object
