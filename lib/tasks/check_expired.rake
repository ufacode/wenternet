namespace :items do
  desc "Marks as expired if item was created more than two weeks ago"
  task check_expired: :environment do
    Item.find_each do |item|
      item.expire! if item.created_at < 2.weeks.ago
    end
  end
end
