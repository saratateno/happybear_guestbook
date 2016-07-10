class Entry < ActiveRecord::Base  
  validates_presence_of :name, message: 'is required.'
  validates_presence_of :message, message: 'is required.'
end
