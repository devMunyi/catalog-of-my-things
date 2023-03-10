require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && ((Date.today.year - @last_played_at.year) > 2)
  end

  def as_json
    {
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
