class Animal < ApplicationRecord
  has_one_attached :cover_photo

  belongs_to :zoo
  validates :name, presence: true, length: { maximum: 120 }
  validates :description, presence: true

  def self.search(search)
    if search
      parameter = search.downcase
      @zoos = Animal.where("lower(name) LIKE ?", "%" + parameter + "%")
    else
      @zoos = Animal.all
    end
  end
end
