namespace :first do
    desc "Demo running rake task"
    task run: :environment do
        puts "Hello rake"
    end
end