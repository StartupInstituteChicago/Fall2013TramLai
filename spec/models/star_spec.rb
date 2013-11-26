require 'spec_helper'

describe Star do
  it {should belong_to :restaurant}
  it {should belong_to :user}
  

end
