namespace :set_prefecture do
  desc "set_meal_places"

  task save_locations: :environment do
    raise "Not allowed to run on production" if Rails.env.production?

    prefs = [ "Tokyo", "Osaka", "Hokkaido", "Fukuoka", "Kanagawa", "Hyogo", "Kyoto", "Okinawa", "Aichi", "Chiba" ]
    prefs.each {|pref| Prefecture.create(name: pref)}


    tokyo    = [ "akihabara", "asakusa", "ginza", "harajyuku", "odaiba", "roppongi", "shibuya", "shinjyuku","ueno" ]
    osaka    = [ "bay area", "namba", "shinnsaibashi", "sakai", "umeda" ]
    hokkaido = [ "asahikawa", "hakodate", "otaru", "sapporo" ]
    fukuoka  = [ "hakata" ]
    kanagawa = [ "hakone", "kamakura", "kawasaki", "syonan", "yokohama" ]
    hyogo    = [ "amagasaki", "awaji", "himeji", "kobe" ]
    kyoto    = [ "east part", "west part", "south part", "north part" ]
    okinawa  = [ "naha" ]
    aichi    = [ "nagoya" ]
    chiba    = [ "kisarazu", "maihama" ]

    tokyo.each {|city| Location.create(name: city, prefecture_id: 1)}
    osaka.each {|city| Location.create(name: city, prefecture_id: 2)}
    hokkaido.each {|city| Location.create(name: city, prefecture_id: 3)}
    fukuoka.each {|city| Location.create(name: city, prefecture_id: 4)}
    kanagawa.each {|city| Location.create(name: city, prefecture_id: 5)}
    hyogo.each {|city| Location.create(name: city, prefecture_id: 6)}
    kyoto.each {|city| Location.create(name: city, prefecture_id: 7)}
    okinawa.each {|city| Location.create(name: city, prefecture_id: 8)}
    aichi.each {|city| Location.create(name: city, prefecture_id: 9)}
    chiba.each {|city| Location.create(name: city, prefecture_id: 10)}
  end
end
