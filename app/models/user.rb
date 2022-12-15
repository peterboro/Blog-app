class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :recoverable
  validates :name, presence: true, length: { maximum: 250 }
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true },
                            allow_nil: true

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  ROLES = %i[admin moderator author banned].freeze

  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def admin?
    role?(:admin)
  end

  def moderator?
    role?(:moderator)
  end

  def author?
    role?(:author)
  end

  def banned?
    role?(:banned)
  end

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
