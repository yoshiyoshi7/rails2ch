namespace :batch do

  desc '最新の20件を残してitemを削除する'
  task :delete => :environment do
  
   ItemsIt.limit(20).order('updated_at').destroy_all
   ItemsAnimegame.limit(20).order('updated_at').destroy_all
   ItemsEntertainer.limit(20).order('updated_at').destroy_all
   ItemsLife.limit(20).order('updated_at').destroy_all
   ItemsNews.limit(20).order('updated_at').destroy_all
   ItemsSocialgame.limit(20).order('updated_at').destroy_all
   ItemsSport.limit(20).order('updated_at').destroy_all
  
  end

end
