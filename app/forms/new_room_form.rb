class NewRoomForm
  include ActiveModel::Model
  include Virtus.model
  include Rails.application.routes.url_helpers

  attribute :name, String
  attribute :capacity, Integer

  validates :name, presence: true

  attr_accessor :room

  def initialize(attrs = {}, room: nil)
    self.room = room || Room.new
    self.name = room.name
    self.capacity = room.capacity
    super(attrs)
  end

  def save
    if valid?
      persist!
    else
      false
    end
  end

  def method
    return :put if room.persisted?
    :post
  end

  def action
    return room_path(room) if room.persisted?
    rooms_path
  end

  def persist!
    self.room.name = name
    self.room.capacity = capacity
    self.room.save!
  end
end
