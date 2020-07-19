class Taxon < ApplicationRecord
  belongs_to :taxonomy
  belongs_to :store
  belongs_to :parent, class_name: 'Taxon', foreign_key: 'parent_id', optional: true

  before_save :set_permalink

  private

  def set_permalink
    if parent
      self.permalink = "#{parent.permalink} -> #{self.name}"
    else
      self.permalink = self.name
    end
  end
end
