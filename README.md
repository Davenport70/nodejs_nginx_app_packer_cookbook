# Nodejs and Nginx cookbook :monkey: :moon: :sun:

This cookbook will install nodejs and nginx.

To use it import it in your own cookbook and run recipes.

## Learning outcomes:
- Git, Github
- Documentation
- chef, inspec, chefspec
- importing cookbooks (will require our search)
- attributes and templates
- TDD
- ERB

## Installation

## Test

To run the unit tests run:
```
chef exec rspec
```
To run integration test:
```
kitchen test
```

## ERB and ice cream cones <% %> and <%= %>

ERB is embeded ruby.

Meaning you can interpolate variables or run ruby code.

It can then be converted to a string

ERB is like python's f' my name is {name} ' but for entire documents!

#### <% %> allows ruby with no output

#### <%= %> allows ruby with output (output means printing to the documents)
