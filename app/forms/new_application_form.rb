class NewApplicationForm
  include ActiveModel::Model
  include Virtus.model
  include Rails.application.routes.url_helpers

  attribute :date_request, Date
  attribute :date_event_i, Date
  attribute :date_event_f, Date
  attribute :time_event, Time
  attribute :event_code, Integer
  attribute :name_requesting, String
  attribute :phone_num, String
  attribute :place, String

  validates :event_code, presence: true

  attr_accessor :application

  def initialize(attrs = {}, application: nil)
    self.application = application || Application.new
    self.date_request = format_date(attrs, 'date_request')
    self.date_event_i = format_date(attrs, 'date_event_i')
    self.date_event_f = format_date(attrs, 'date_event_f')
    self.time_event = format_date(attrs, 'time_event')
    self.event_code = application.eventCode
    self.name_requesting = application.nameRequesting
    self.phone_num = application.phoneNum
    self.place = application.place
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
    return :put if application.persisted?
    :post
  end

  def action
    return application_path(application) if application.persisted?
    applications_path
  end

  def persist!
    self.application.dateRequest = date_request
    self.application.dateEventI = date_event_i
    self.application.dateEventF = date_event_f
    self.application.timeEvent = time_event
    self.application.eventCode = event_code
    self.application.nameRequesting = name_requesting
    self.application.phoneNum = phone_num
    self.application.place = place
    self.application.save!
  end

  def format_date(attrs, field)
    return if attrs["#{field}(1i)"].blank?
    Time.zone.parse "#{attrs["#{field}(1i)"]}/#{attrs["#{field}(2i)"]}/#{attrs["#{field}(3i)"]} #{attrs["#{field}(4i)"]}:#{attrs["#{field}(5i)"]}"
  end
end
