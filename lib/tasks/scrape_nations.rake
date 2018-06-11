namespace :scrape_nations do
  desc "scrape-nations and save them in nations table"

  task scrape_nation: :environment do
    html = open("https://www.countries-ofthe-world.com/flags-of-the-world.html", &:read)

    doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

    doc.xpath('//table[@class="two-column td-image"]/tbody/tr[not(contains(@class, "line"))]').each do |node|
      url =  node.at("td[1]").css('img').attribute("src").value
      full_url = "https://www.countries-ofthe-world.com/#{url}"
      name =  node.at("td[2]").inner_text

      nation = Nation.new(name: name)
      nation.remote_flag_url = full_url
      nation.save!
    end
    Nation.find_by(name: "Japan").destroy
  end
end
