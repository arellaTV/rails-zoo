class Zoo < ApplicationRecord
  has_one_attached :cover_photo
  has_many :animals
  validates :name, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 512 }
  validates :address, length: { maximum: 120 }

  def self.search(search)
    if search
      parameter = search.downcase
      @zoos = Zoo.where("lower(name) LIKE ?", "%" + parameter + "%")
    else
      @zoos = Zoo.all
    end
  end
end
