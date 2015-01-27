class Nurse < ActiveRecord::Base
  belongs_to :nurseable, polymorphic: true
end
