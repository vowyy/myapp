# # require 'open-uri' # urlにアクセスできるようにする
# require 'kconv' # 文字コード変換。文字化け対策
# # require 'nokogiri'


namespace :scrape_nations do
  desc "scrape-nations and save them in nations table"

  task :scrape_nation => :environment do

    html = open("https://www.countries-ofthe-world.com/flags-of-the-world.html") do |f|
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

    doc.xpath('//table[@class="two-column td-image"]/tbody/tr[not(contains(@class, "line"))]/td[2]').each do |node|
      name = node.inner_text
      flag = "https://www.countries-ofthe-world.com/flags-normal/flag-of-#{name}.png"
      nation = Nation.new(name: name, flag: flag)
      nation.save!
    end
    Nation.find_by(name: "Japan").destroy
  end
end
