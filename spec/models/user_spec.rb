require 'spec_helper'
require "cancan/matchers"

describe User do

	let(:ability) { Ability.new(user) }

	context "when admin" do
		let(:user) { build :admin }

		it "should let manage new users" do
			expect(ability).to be_able_to(:manage, User.new)
		end
	end

	context "when not exists" do
		let(:user) { nil }

		it "should not let manage new users" do
			expect(ability).to_not be_able_to(:manage, User.new)
		end
	end
end
