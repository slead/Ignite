require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should not save event without name" do
    event = Event.new
    assert_not event.save, "Saved the event without a name"
  end

  test "should not save event without city" do
    event = Event.new
    assert_not event.save, "Saved the event without a city"
  end

  test "should geocode city" do
    event = Event.new(city: "sydney", name: "Ignite Sydney")
    event.save
    assert_not_nil event.latitude, "Did not geocode event"
  end

end
