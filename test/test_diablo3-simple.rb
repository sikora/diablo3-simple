require 'minitest/spec'
require 'minitest/autorun'
require 'diablo3-simple'

class TestD3 < MiniTest::Unit::TestCase
  def setup
    @d3 = Diablo3.new('us', 'sikora#1521')
  end

  def test_list_heroes
    @heroes = @d3.list_heroes
    refute_empty(@heroes)
  end

  def test_hero_retrieve
    hero = Hero.new('us', 'sikora#1521', 2241364)
    assert_equal('Sikora', hero.name, "There's something wrong when retrieving the hero information.")
  end
end
