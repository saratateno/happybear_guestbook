class Entry < ActiveRecord::Base
  validates_presence_of :name, message: 'is required.'
  validates_presence_of :message, message: 'is required.'

  default_scope { order(:created_at).reverse_order }
end
