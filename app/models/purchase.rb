class Purchase < ApplicationRecord
belongs_to :article
belongs_to :user
has_one :shipping_address


end
