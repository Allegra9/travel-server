class Trip < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :country, presence: true

  validates :date_from, presence: true
  validates :date_to, presence: true
end

# t.string "name"
# t.string "country"
# t.string "location"
#
# t.string "things_did"    #optional
# t.string "notes"       #optional
#
# t.datetime "date_from"
# t.datetime "date_to"
#
# t.integer "user_id"
