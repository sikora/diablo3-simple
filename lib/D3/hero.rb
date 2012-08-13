require 'net/http'
require 'json'

class Hero
  attr_accessor :name, :id, :level, :hardcore, :gender, :last_updated, :dead

  def initialize(server, btag, id, info=[])

    @id = id

    if info.empty?

      btag.gsub!('#','-')

      api_url = URI.escape("http://#{server}.battle.net/api/d3/profile/#{btag}/hero/#{id}")
      ret = Net::HTTP.get(URI.parse(api_url))
      info = JSON(ret)

    end

    @name = info['name']
    @level = info['level']
    @gender = info['gender']
    @last_updated = info['last-updated']
    @dead = info['dead']
    @hardcore = info['hardcore']


  end

end
