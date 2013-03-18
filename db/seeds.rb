require 'faker'

ActiveRecord::Base.logger = nil

User.delete_all
KarmaPoint.delete_all

Rails.logger.info "Generating users..."

now = Time.now

fields = [:first_name, :last_name, :email, :username, :created_at, :updated_at]
100000.times.each_slice(1000) do |ids|
  data = ids.map do |i|
    [Faker::Name.first_name, Faker::Name.last_name, "email_#{i}@example.com", "user_#{i}", now, now]
  end
  Rails.logger.info "Importing users..."
  User.import(fields, data, :validate => false, :timestamps => false)  
end

user_ids = User.pluck(:id)
fields = [:user_id, :value, :label, :created_at, :updated_at]

1500000.times.each_slice(20000) do |ids|
  data = ids.map do
    user_id = user_ids.sample
    [user_id, rand(1..user_id), Faker::Lorem.word, now, now]
  end

  KarmaPoint.import(fields, data, :validate => false, :timestamps => false)
end
