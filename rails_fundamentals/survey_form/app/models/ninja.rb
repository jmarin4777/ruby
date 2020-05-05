class Ninja < ActiveRecord::Base
    validates :name, :dojo, :lang, presence: true
end
