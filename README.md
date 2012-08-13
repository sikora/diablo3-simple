diablo3-simple
==============

my first gem, trying to implement some sort of class to access d3 api

so far you can instantiate a D3 class and retrieve basic hero info:

Diablo 3 simple class to retrieve info from Blizzard official D3 API

Example:
```ruby
 require 'diablo3-simple'
 d3 = Diablo3.new('us', 'sikora#1521' )
 heroes = d3.list_heroes  #returns a hash whose key is the hero id and value is the respective Hero class
 heroes[1234].name #return the hero's name whose id is 1234
```
 

