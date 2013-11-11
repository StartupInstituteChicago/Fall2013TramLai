require 'spec_helper'

describe Reservation do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:requested_date_time)}
end
