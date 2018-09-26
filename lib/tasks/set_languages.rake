namespace :set_languages do
  desc "set_languages"

  task save_languages: :environment do
    # raise "Not allowed to run on production" if Rails.env.production?

    Language.create(lang_en: "English", lang_ja: "英語")
    Language.create(lang_en: "Spanish", lang_ja: "スペイン語")
    Language.create(lang_en: "Chainese", lang_ja: "中国語")
    Language.create(lang_en: "Korean", lang_ja: "韓国語")
    Language.create(lang_en: "Italian", lang_ja: "イタリア語")
    Language.create(lang_en: "Germany", lang_ja: "ドイツ語")
    Language.create(lang_en: "Russian", lang_ja: "ロシア語")
    Language.create(lang_en: "Portuguese", lang_ja: "ポルトガル語")
    Language.create(lang_en: "Serbian", lang_ja: "セルビア語")
    Language.create(lang_en: "Indian", lang_ja: "インド語")
    Language.create(lang_en: "Thai", lang_ja: "タイ語")
    Language.create(lang_en: "Indonesian", lang_ja: "インドネシア語")
  end
end
