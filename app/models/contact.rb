class Contact < ApplicationRecord
  belongs_to :record, class_name: 'User'
  belongs_to :user, class_name: 'User'
end
