#encoding: utf-8
require 'net/http'
require 'json'
require 'D3/hero'
require 'ostruct'

# The main D3 class
class Diablo3
  # Diablo 3 simple class to retrieve info from Blizzard official D3 API
  #
  # Usage:
  #  require 'diablo3-simple'
  #  d3 = Diablo3.new(<server>, <battletag> )  
  #  server should be 'us' or 'eu' (it may work with other regions if they use like <server>.battle.net pattern)
  #  battletag is the user battletag
  #  
  #  d3 = Diablo3.new('us', 'sikora#1521' )
  #  heroes = d3.list_heroes  #returns a hash whose key is the hero id and value is the respective Hero class
  #  heroes[1234].name #return the hero's name whose id is 1234
  #  
  #  You can fetch the global progression information using:
  #  prog = d3.global_progression
  #  then you'll have access to
  #  prog.normal 
  #  prog.nightmare...inferno
  #  
  #  refer to https://github.com/Blizzard/d3-api-docs for more information about the fetched data

  attr_accessor :global_progression

  def initialize(server='us', btag)

    @server = server
    @btag = btag

    @btag.gsub!('#','-')
    api_url = URI.escape("http://#{@server}.battle.net/api/d3/profile/#{@btag}/")
    ret = Net::HTTP.get(URI.parse(api_url))
    @data = JSON(ret)


    if @data.empty?
      raise "D3_cannot_retrieve_info"
    elsif @data['code'].eql?('OOPS')
      raise "D3_possible_invalid_battletag"
    end

    @global_progression = OpenStruct.new(@data['progression'])

  end

  def list_heroes
    heroes = Hash.new
    @data['heroes'].map do |h|
      heroes[h['id']] = Hero.new(@server, @btag, h['id'], h)
    end

    heroes
  end
end
