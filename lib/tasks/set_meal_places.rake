namespace :set_prefecture do
  desc "set_meal_places"

  task save_locations: :environment do
    # raise "Not allowed to run on production" if Rails.env.production?

    prefs    = { "東京": "Tokyo", "大阪": "Osaka", "北海道": "Hokkaido", "福岡": "Fukuoka", "神奈川": "Kanagawa", "兵庫": "Hyogo", "京都": "Kyoto", "沖縄": "Okinawa", "愛知": "Aichi", "千葉": "Chiba" }
    prefs.each {|ja, en| Prefecture.create(name_en: en, name_ja: ja)}


    tokyo    = { "秋葉原": "akihabara", "浅草": "asakusa", "銀座": "ginza", "原宿": "harajyuku", "お台場":  "odaiba", "六本木": "roppongi", "渋谷": "shibuya", "新宿": "shinjyuku", "上野": "ueno" }
    osaka    = { "ベイエリア": "bay area", "難波": "namba", "心斎橋": "shinnsaibashi", "境": "sakai", "梅田":  "umeda" }
    hokkaido = { "旭川": "asahikawa", "函館": "hakodate", "小樽": "otaru", "札幌": "sapporo" }
    fukuoka  = { "博多": "hakata"}
    kanagawa = { "箱根": "hakone", "鎌倉": "kamakura", "川崎": "kawasaki", "湘南": "syonan", "横浜":  "yokohama" }
    hyogo    = { "尼崎": "amagasaki", "淡路": "awaji", "姫路": "himeji", "神戸": "kobe" }
    kyoto    = { "京都東部": "east part", "京都西部": "west part", "京都南部": "south part", "京都北部": "north part" }
    okinawa  = { "那覇": "naha" }
    aichi    = { "名古屋": "nagoya" }
    chiba    = { "木更津": "kisarazu", "舞浜": "maihama" }

    tokyo.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 1)}
    osaka.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 2)}
    hokkaido.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 3)}
    fukuoka.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 4)}
    kanagawa.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 5)}
    hyogo.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 6)}
    kyoto.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 7)}
    okinawa.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 8)}
    aichi.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 9)}
    chiba.each {|ja, en| Location.create(name_en: en, name_ja: ja, prefecture_id: 10)}
  end
end
