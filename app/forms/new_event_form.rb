class NewEventForm
  include ActiveModel::Model
  include Virtus.model
  include Rails.application.routes.url_helpers

  attribute :event_type, String
  attribute :ponente_name, String
  attribute :person_in_charge, String
  attribute :phone, String
  attribute :code_event, Integer
  attribute :forniture, Boolean

  validates :event_type, :person_in_charge, presence: true

  attr_accessor :event

  def initialize(attrs = {}, event: nil)
    self.event = event || Event.new
    self.event_type = event.eventType
    self.person_in_charge = event.personInCharge
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
    return :put if event.persisted?
    :post
  end

  def action
    return event_path(event) if event.persisted?
    events_path
  end

  def persist!
    self.event.eventType = event_type
    self.event.personInCharge = person_in_charge
    self.event.codeEvent = code_event
    self.event.ponenteName = ponente_name
    self.event.phoneNum = phone
    self.event.forniture = forniture
    self.event.save!
  end
end
