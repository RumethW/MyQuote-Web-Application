class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :author

  validates :qu_text, presence: true
  validates :user, presence: true
  validates :author, presence: true
  validate :at_least_one_category

  has_many :quote_categories, dependent: :destroy
  has_many :categories, through: :quote_categories

  accepts_nested_attributes_for :quote_categories, allow_destroy: true

  def at_least_one_category
    if category_ids.empty?
      errors.add(:category_ids, "You must include at least one category")
    end
  end
end
