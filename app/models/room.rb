class Room < ActiveRecord::Base
  attr_accessible :name, :public, :session_id
end
