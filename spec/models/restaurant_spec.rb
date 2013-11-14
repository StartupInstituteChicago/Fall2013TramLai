require 'spec_helper'

describe Restaurant do
	it {should belong_to(:owner)} 
	it {should validate_presence_of(:name)}
	it {should validate_presence_of(:description)}
	it {should ensure_length_of(:description).is_at_least(10)}
	it {should validate_presence_of(:full_address)}
	it {should validate_presence_of(:phone_number)}
	it {should ensure_length_of(:phone_number).is_equal_to(10)}
	it {should validate_presence_of(:owner)}

end
