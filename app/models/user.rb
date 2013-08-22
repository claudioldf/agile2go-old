class User < ActiveRecord::Base
  before_save :gravatar_url
  before_validation :generate_slug

  rolify
  belongs_to :project
  belongs_to :task

  attr_accessible :role_ids, :as => :master
  attr_accessible :user_ids, :as => :master
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :avatar_url, :project_id, :task_id

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :slug, uniqueness: true, presence: true, exclusion: {in: %w[signup login]}

  scope :ordered, order(:name)

  def generate_slug
    self.slug ||= name.parameterize
  end

  def self.export(options = {})
    UserExport.new(self, options).to_csv
  end

  def gravatar_url
    Gravatar.new(email).url
  end

  def to_param
    slug
  end

  def is_scrum_master
    self.has_role? :master
  end

  def is_dev_team
    self.has_role? :team
  end

  def has_role
    self.roles.first.nil?
  end

  def name_and_email
    "#{self.name} #{self.email}"
  end
end
