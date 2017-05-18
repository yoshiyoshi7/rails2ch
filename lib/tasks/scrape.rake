# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
namespace :scrape do
  desc 'NaverまとめのTechページからタイトルを取得'
  task :test => :environment do
    # スクレイピング先のURL
    url = 'http://blog.livedoor.jp/itsoku/'
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
    # htmlをパース(解析)してオブジェクトを作成
    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.xpath('//article').each do |node|
      # タイトルの取得
      #puts node.css('h3').inner_text
      @items_it = ItemsIt.new({
        title: node.css('h1').inner_text,
        url: node.css('h1 > a').attribute('href').value,
        img: node.css('img').attribute('src').value,
        site: 'IT速報'})
      @items_it.save
    end
  end
end