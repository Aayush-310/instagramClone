class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         followability


         #associations
         has_many :posts
         has_many :comments
         has_many :likes
         has_one_attached :avatar
         before_create :randomize_id
         def self.ransackable_attributes(auth_object = nil)
          %w[id email username created_at updated_at]
        end
         def unfollow(user_id)
          followerable_relationships.where(followable_id: user_id).destroy_all 
        end
         private
         def randomize_id
          begin
            self.id= SecureRandom.random_number (1_000_000_000)            
          end while User.where(id: self.id).exists?
         end
         enum role: [:user,:admin]
         after_initialize :set_default_role, :if => :new_record?
         def set_default_role 
          self.role ||= :admin 
         end
end
