class ReferenceRelation < ApplicationRecord
  belongs_to :quoter, polymorphic: true
  belongs_to :reference, polymorphic: true
end
