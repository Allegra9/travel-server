class Trip < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :country, presence: true

  #validates :things_did, presence: true

end

# t.string "name"
# t.string "country"
# t.string "location"
#
# t.string "things_did"    #optional
# t.string "notes"       #optional
#
# t.datetime "date_from"   # month and year required, exact date optional
# t.datetime "date_to"
#
# t.integer "user_id"
