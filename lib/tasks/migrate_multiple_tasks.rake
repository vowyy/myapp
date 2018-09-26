namespace :migrate_tasks do
  desc "rails db:migrate:reset + rails scrape_nations:scrape_nation"

  task :db_rebuild do
    # raise "Not allowed to run on production" if Rails.env.production?

    unless Rails.env.production?
      Rake::Task['db:drop'].execute
      Rake::Task['db:create'].execute
      Rake::Task['db:migrate'].execute
    end
    
    Rake::Task['set_prefecture:save_locations'].execute
    Rake::Task['set_languages:save_languages'].execute
    Rake::Task['scrape_nations:scrape_nation'].execute
  end
end
