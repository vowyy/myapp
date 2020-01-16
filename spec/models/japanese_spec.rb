require 'rails_helper'

RSpec.describe Japanese, type: :model do
  before do
    @j1 = Japanese.create(
      email: "ajadj1@gmail.com",
      password: "abcdefg",
      first_name: "田中",
      last_name: "太郎",
      nickname: "tanaka",
      gender: "男性",
      age: 33,
      language_id: 1,
      lang_l: "初級"
    )
  end

  it "is invalid without an email address" do
    japanese = Japanese.new(email: nil)
    japanese.valid?
    expect(japanese.errors[:email]).to include("を入力してください", "は不正な値です")
  end

  it "is invalid if your nickname includes other than alphabet" do
    japanese = Japanese.new(nickname: "123")

    japanese.valid?
    expect(japanese.errors[:nickname]). to include("はローマ字のみで入力してください。")
  end

  describe "# there_lack_attributes?" do
    it "return true" do
      expect(@j1.there_lack_attributes?).to be_truthy
      # profileがないため、trueを返すので失敗。
    end

    it "return false" do
      expect(@j1.there_lack_attributes?).to be_truthy
      # profileがないため、trueを返すので失敗。
    end
  end
end
