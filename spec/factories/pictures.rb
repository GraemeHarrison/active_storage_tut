FactoryBot.define do
  factory :picture do
    created_at { DateTime.now }
    updated_at { DateTime.now }

    trait :with_attachment do
      after :build do |picture|
        file_name = 'rails-logo.png'
        file_path = Rails.root.join('spec', 'fixtures', 'files', file_name)
        picture.attachment.attach(io: File.open(file_path), filename: file_name, content_type: 'image/png')
      end
    end
  end
end
