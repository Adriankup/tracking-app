FactoryBot.define do
  factory :package, class: Package do
    parcel { FFaker::Lorem.word }
    status { FFaker::Lorem.word }
    guide_number { FFaker::Code.ean }
    description { FFaker::Lorem.sentence }
  end
end
