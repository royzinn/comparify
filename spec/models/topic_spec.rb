require 'spec_helper'

describe Topic do
  it { should belong_to(:user) }
  it { should validate_presence_of(:first_subject) }
  it { should validate_presence_of(:second_subject) }
  it { should validate_presence_of(:question) }
end
