require 'spec_helper'

describe Owner do
	it {should validate_presence_of(:email)}
	it {should validate_presence_of(:password)}
	it {should validate_presence_of(:name)}
end
