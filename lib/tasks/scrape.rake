# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
require 'rss'
require "parallel"

namespace :scrape do
  desc '各サイトからデータを取得'
  task :all => :environment do
    list = ['itsoku','sierblog','kancolle','nanjpride','nanjstu','hachima','hamusoku','oniyome','gossip']

    Parallel.each(list) do |site|
      Rake::Task["scrape:" + site].execute
    end
    
  end

  #IT・ガジェット
  task :itsoku => :environment do
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
      if ItemsIt.find_by(url: node.css('h1 > a').attribute('href').value) then
        next
      end
      @items_it = ItemsIt.new({
        title: node.css('h1').inner_text,
        url: node.css('h1 > a').attribute('href').value,
        img: node.css('img').attribute('src').value,
        site: 'IT速報'})
      @items_it.save
    end
  end

  task :sierblog => :environment do
    # スクレイピング先のURL
    url = 'http://sierblog.com/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsIt.find_by(url: item.link) then
        next
      end
      #content:encodedからimgを取得するためにparse
      doc = Nokogiri::HTML.parse(item.content_encoded, nil, "UTF-8")
      
      @items_it = ItemsIt.new({
        title: item.title,
        url: item.link,
        img: doc.at_css('img').attribute('src').value,
        site: 'SIerブログ',
        data:item.content_encoded})
      @items_it.save
    end
  end

  #ソーシャルゲーム
  task :kancolle => :environment do
    # スクレイピング先のURL
    url = 'http://kancolle.doorblog.jp/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsSocialgame.find_by(url: item.link) then
        next
      end
      @items_socialgame = ItemsSocialgame.new({
        title: item.title,
        url: item.link,
        img: '',
        site: '艦これ速報',
        data:item.content_encoded})
      @items_socialgame.save
    end
  end

  #スポーツ
  task :nanjpride => :environment do
    # スクレイピング先のURL
    url = 'http://blog.livedoor.jp/rock1963roll/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsSport.find_by(url: item.link) then
        next
      end

      
      #content:encodedからimgを取得するためにparse
      doc = Nokogiri::HTML.parse(item.content_encoded, nil, "UTF-8")
      
      @items_sports = ItemsSport.new({
        title: item.title,
        url: item.link,
        img: doc.at_css('img').attribute('src').value,
        site: 'なんJ PRIDE',
        data:'' #![CDATA[が２つに分かれているためエラーが起きているっぽいあとで対策する
      })
      @items_sports.save
    end
  end

  task :nanjstu => :environment do
    # スクレイピング先のURL
    url = 'http://blog.livedoor.jp/nanjstu/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsSport.find_by(url: item.link) then
        next
      end
      #content:encodedからimgを取得するためにparse
      doc = Nokogiri::HTML.parse(item.content_encoded, nil, "UTF-8")
      
      @items_sports = ItemsSport.new({
        title: item.title,
        url: item.link,
        img: doc.at_css('img').attribute('src').value,
        site: 'なんじぇいスタジアム',
        data:item.content_encoded})
      @items_sports.save
    end
  end

  #アニメ・ゲーム
  task :hachima => :environment do
    # スクレイピング先のURL
    url = 'http://blog.esuteru.com/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsAnimegame.find_by(url: item.link) then
        next
      end
      #content:encodedからimgを取得するためにparse
      doc = Nokogiri::HTML.parse(item.content_encoded, nil, "UTF-8")
      
      @items_animegame = ItemsAnimegame.new({
        title: item.title,
        url: item.link,
        img: doc.at_css('img').attribute('src').value,
        site: 'はちま起稿',
        data:item.content_encoded})
      @items_animegame.save
    end
  end

  #ニュース
  task :hamusoku => :environment do
    # スクレイピング先のURL
    url = 'http://hamusoku.com/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsNews.find_by(url: item.link) then
        next
      end
      #content:encodedからimgを取得するためにparse
      doc = Nokogiri::HTML.parse(item.content_encoded, nil, "UTF-8")
      
      @items_news = ItemsNews.new({
        title: item.title,
        url: item.link,
        img: doc.at_css('img').attribute('src').value,
        site: 'ハムスター速報',
        data:item.content_encoded})
      @items_news.save
    end
  end

  #生活
  task :oniyome => :environment do
    # スクレイピング先のURL
    url = 'http://oniyomech.livedoor.biz/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsLife.find_by(url: item.link) then
        next
      end
      #content:encodedからimgを取得するためにparse
      doc = Nokogiri::HTML.parse(item.content_encoded, nil, "UTF-8")
      
      @items_life = ItemsLife.new({
        title: item.title,
        url: item.link,
        img: doc.at_css('img').attribute('src').value,
        site: '鬼嫁ちゃんねる',
        data:item.content_encoded})
      @items_life.save
    end
  end

  #芸能
  task :gossip => :environment do
    # スクレイピング先のURL
    url = 'http://gossip1.net/index.rdf'
    rss = RSS::Parser.parse(url)
    rss.items.each do |item|
      if ItemsEntertainer.find_by(url: item.link) then
        next
      end
      #content:encodedからimgを取得するためにparse
      doc = Nokogiri::HTML.parse(item.content_encoded, nil, "UTF-8")
      
      @items_life = ItemsEntertainer.new({
        title: item.title,
        url: item.link,
        img: doc.at_css('img').attribute('src').value,
        site: 'GOSSIP速報',
        data:item.content_encoded})
      @items_life.save
    end
  end





end