require 'rails_helper'

RSpec.describe Match, type: :model do
  it "does not allow to be offered by identical japanese" do
    j1 = Japanese.create(
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

    j2 = Japanese.create(
      email: "ajadj2@gmail.com",
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
end
