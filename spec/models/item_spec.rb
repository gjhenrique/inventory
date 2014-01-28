require 'spec_helper'

describe Item do

  it { should have_many(:line_items)}
  it { should have_many(:orders).through(:line_items)}
end
