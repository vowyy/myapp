require 'rails_helper'

RSpec.describe Japanese, type: :model do
  it "has a valid factory" do
    jap = build(:japanese)
    expect(jap.save).to be_valid
  end
end
