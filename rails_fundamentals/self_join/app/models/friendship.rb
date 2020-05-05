class Friendship < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend, class_name: "User"
    validates_uniqueness_of :user_id, scope: :friend_id
    
    after_create :add_back
    private
    def add_back
        self.class.create(user_id: self.friend.id, friend_id: self.user.id)
    end
end
