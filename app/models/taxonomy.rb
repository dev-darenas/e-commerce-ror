class Taxonomy < ApplicationRecord
  belongs_to :store
  has_many :taxons, inverse_of: :taxonomy
  accepts_nested_attributes_for :taxons,
    reject_if: lambda { |attributes| attributes['name'].blank? },
    allow_destroy: true

  has_one :root, -> { where parent_id: nil }, class_name: 'Taxon', dependent: :destroy

  after_create :set_root
  after_save :set_root_taxon_name

  private

  def set_root
    self.root ||= Taxon.create!(taxonomy_id: id, name: name, store: store)
  end

  def set_root_taxon_name
    root.update(name: name)
  end
end
