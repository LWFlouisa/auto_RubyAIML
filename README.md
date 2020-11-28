# auto_RubyAIML
An automated process of generating AIML scripts for Ruby.

## Prerequitsites
~~~
sudo apt-get install ruby
sudo gem install programr
~~~

## Writing Patterns And Templates

### Patterns

~~~
What is your name?
Do you have a hobby?
How do you make your living?
What would you consider your skill?
What is the current weather?
~~~

### Templates

~~~
answer one
answer two
answer three
answer four
answer five
~~~

These are just example patterns and templates, customize to your needs.

## Under The Hood
Ruby reads in an input number, and that input number picks a line procedurally to extend the AIML script. Once it has reached the maximum length of the patterns or templates, it resets to zero. Going to modify this to be based on the size of the template list.

## Applications In Mind
Eventually going to make chatbots out of different characters in my stories.
