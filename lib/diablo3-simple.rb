#encoding: utf-8
require 'net/http'
require 'json'
require 'D3/hero'

class Diablo3
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

  end

  def list_heroes
    heroes = Hash.new
    @data['heroes'].map do |h|
      heroes[h['id']] = Hero.new(@server, @btag, h['id'], h)
    end

    heroes
  end
end
