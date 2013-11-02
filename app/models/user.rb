class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  before_save :gravatar_url
  before_validation :generate_slug

  rolify
  belongs_to :project
  belongs_to :task

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :slug, uniqueness: true, presence: true, exclusion: {in: %w[signup login]}

  scope :ordered, order(:name)

  def generate_slug
    self.slug ||= param_name
  end

  def self.export(options = {})
    UserExport.new(self, options).to_csv
  end

  def gravatar_url
    Gravatar.new(email).url
  end

  def param_name
    self.name.parameterize if self.name
  end

  def to_param
    slug
  end

  def master?
    self.has_role? :master
  end

  def team?
    self.has_role? :team
  end

  def has_role
    self.roles.first.nil?
  end

  def role_name
    self.roles.first.name.titleize
  end

  def name_and_email
    "#{self.name} #{self.email}"
  end
end
