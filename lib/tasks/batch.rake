namespace :batch do

  desc '最新の20件を残してitemを削除する'
  task :delete => :environment do

   ItemsIt.where("updated_at < '#{Time.now - 3.day}'").destroy_all
   ItemsAnimegame.where("updated_at < '#{Time.now - 3.day}'").destroy_all
   ItemsEntertainer.where("updated_at < '#{Time.now - 3.day}'").destroy_all
   ItemsLife.where("updated_at < '#{Time.now - 3.day}'").destroy_all
   ItemsNews.where("updated_at < '#{Time.now - 3.day}'").destroy_all
   ItemsSocialgame.where("updated_at < '#{Time.now - 3.day}'").destroy_all
   ItemsSport.where("updated_at < '#{Time.now - 3.day}'").destroy_all

  end
end
