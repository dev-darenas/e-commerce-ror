class Taxon < ApplicationRecord
  belongs_to :taxonomy
  belongs_to :store
  belongs_to :taxon
end
