namespace :scrape_nations do
  desc "scrape-nations and save them in nations table"

  task scrape_nation: :environment do
    html = open("https://www.countries-ofthe-world.com/flags-of-the-world.html", &:read)

    doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

    doc.xpath('//table[@class="two-column td-image"]/tbody/tr[not(contains(@class, "line"))]').each do |node|
      url      =  node.at("td[1]").css('img').attribute("src").value
      full_url =  "https://www.countries-ofthe-world.com/#{url}"
      name_en  =  node.at("td[2]").inner_text
      name_ja = %w( アフガニスタン アルバニア アルジェリア アンドラ アンゴラ アンティグア・バーブーダ アルゼンチン アルメニア オーストラリア オーストリア
                    アゼルバイジャン バハマ バーレーン バングラディッシュ バルバドス ベラルーシ ベルギー ベリーズ ベナン ブータン
                    ボリビア ボスニア・ヘルツェゴビナ ボツワナ ブラジル ブルネイ ブルガリア ブルキナファソ ブルンジ カーボベルデ カンボジア
                    カメルーン カナダ 中央アフリカ共和国 チャド チリ 中国 コロンビア コモロ コンゴ民主共和国 コンゴ共和国
                    コスタリカ コートジボワール クロアチア キューバ キプロス チェコ デンマーク ジブチ ドミニカ国 ドミニカ共和国
                    エクアドル エジプト エルサルバドル 赤道ギニア エリトリア エストニア エスワニティ エチオピア フィジー フィンランド
                    フランス ガボン ガンビア ジョージア ドイツ ガーナ ギリシャ グレナダ グアテマラ ギニア
                    ギニアビサウ ガイアナ ハイチ ホンジュラス ハンガリー アイスランド インド インドネシア イラン イラク
                    アイルランド イスラエル イタリア ジャマイカ ヨルダン カザフスタン ケニア キリバス コソボ クウェート
                    キルギス ラオス ラトビア レバノン レソト リベリア リビア リヒテンシュタイン リトアニア ルクセンブルク
                    マケドニア マダガスカル マラウイ マレーシア モルディブ マリ マルタ マーシャル諸島 モーリタニア モーリシャス
                    メキシコ ミクロネシア モルドバ モナコ モンゴル モンテネグロ モロッコ モザンビーク ミャンマー ナミビア
                    ナウル ネパール オランダ ニュージーランド ニカラグア ニジェール ナイジェリア 北朝鮮 ノルウェイ オマーン
                    パキスタン パラオ パレスチナ パナマ パプアニューギニア パラグアイ ペルー フィリピン ポーランド ポルトガル
                    カタール ルーマニア ロシア ルワンダ セントクリストファー・ネイビス セントルシア セントビンセント・グレナディーン サモア サンマリノ サントメ・プリンシペ
                    サウジアラビア セネガル セルビア セーシェル シエラレオネ シンガポール スロバキア スロベニア ソロモン諸島 ソマリア
                    南アフリカ 韓国 南スーダン スペイン スリランカ スーダン スリナム スウェーデン スイス シリア
                    台湾 タジキスタン タンザニア タイ 東ティモール トーゴ トンガ トリニダード・トバゴ チュニジア トルコ
                    トルクメニスタン ツバル ウガンダ ウクライナ アラブ首長国連邦 イギリス アメリカ ウルグアイ ウズベキスタン バヌアツ
                    バチカン ベネズエラ ベトナム イエメン ザンビア ジンバブエ )

      nation = Nation.new(name_en: name_en)
      nation.remote_flag_url = full_url
      nation.save! if nation.name_en != "Japan"
      Nation.all.each.with_index { |n, i| n.update!(name_ja: name_ja[i]) }
    end
  end
end
