class SearchCounter < ApplicationRecord
  belongs_to :countable, polymorphic: true
end
