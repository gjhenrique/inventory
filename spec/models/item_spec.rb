require 'spec_helper'

describe Item do
  # pending "add some examples to (or delete) #{__FILE__}"
  	it 'user login' do
  		user = build :user
  		print user.class
  		expect(1).to eq(1)
		end
end