class Entry < ActiveRecord::Base
  validates_presence_of :name, message: "Please enter a name"
  validates_presence_of :message, message: "Please enter a message"
end
