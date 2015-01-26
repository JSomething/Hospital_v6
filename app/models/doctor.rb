class Doctor < ActiveRecord::Base
  has_many :patients, dependent: :destroy
end
