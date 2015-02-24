FactoryGirl.define do
  factory :image do
    item
    attachment File.open(File.join(Rails.root, "/spec/fixtures/files/image.jpg"))
  end
end
