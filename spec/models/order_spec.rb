require 'spec_helper'

describe Order do

  it { should have_many(:line_items)}
  it { should have_many(:items)}

  it { should accept_nested_attributes_for(:line_items) }

end
