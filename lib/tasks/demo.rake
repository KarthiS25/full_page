# namespace :first do
#     desc "Demo running rake task"
#     task run: :environment do
#         puts "Hello rake"
#     end
# end
namespace :batch do
    desc 'Send out batch messages'
    task send_messages: :environment do
        puts "hello"
    end
  end