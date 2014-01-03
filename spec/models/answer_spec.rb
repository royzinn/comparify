require 'spec_helper'

describe Answer do
  it { should belong_to(:user) }
  it { should belong_to(:topic) }
  it { should validate_presence_of(:body) }
end
