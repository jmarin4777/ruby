class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :state, presence: true
    validates :street, :city, length: { minimum: 2 }
    validates :state, length: { is: 2 }
    
    has_many :students, dependent: :destroy
end
