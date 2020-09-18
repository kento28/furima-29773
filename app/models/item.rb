class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates: name
    validates: text
    validates: category, numericality: { other_than: 1, message: 'Select' }
    validates: state,    numericality: { other_than: 1, message: 'Select' }
    validates: postage,  numericality: { other_than: 1, message: 'Select' }
    validates: region,   numericality: { other_than: 1, message: 'Select' }
    validates: shipping_days, numericality: { other_than: 1, message: 'Select' }
    validates: price,    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  end
end
