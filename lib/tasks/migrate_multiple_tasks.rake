namespace :migrate_tasks do
  desc "rails db:migrate:reset + rails scrape_nations:scrape_nation"

  task db_rebuild: :environment do
    raise "Not allowed to run on production" if Rails.env.production?

    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['scrape_nations:scrape_nation'].execute
  end
end
