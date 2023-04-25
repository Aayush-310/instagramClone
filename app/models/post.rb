class Post < ApplicationRecord
    validates :title , presence: true, length:{minimum:1,maximum:18}
    validates :description , presence: true, length:{minimum:1,maximum:250}
    validates :keywords, presence: true, length:{minimum:1,maximum:30}
    validates :user, presence: true
    has_many_attached :images    
    belongs_to :user
    has_many :comments
    has_many :likes
    before_create :randomize_id
  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
  
end
end
