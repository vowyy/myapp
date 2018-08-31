namespace :set_languages do
  desc "set_languages"

  task save_languages: :environment do
    raise "Not allowed to run on production" if Rails.env.production?

    Language.create(lang: "English")
    Language.create(lang: "Spanish")
    Language.create(lang: "Chainese")
    Language.create(lang: "Korean")
    Language.create(lang: "Italian")
    Language.create(lang: "Germany")
    Language.create(lang: "Russian")
    Language.create(lang: "Portuguese")
    Language.create(lang: "Serbian")
    Language.create(lang: "Indian")
    Language.create(lang: "Thai")
    Language.create(lang: "Indonesian")
  end
end
