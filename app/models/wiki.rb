class Wiki < ActiveRecord::Base

  has_many :pages, dependent: :destroy

  validates :name, presence: true
  validates :home_page,
    presence: true,
    format: { with: /\A([A-Z][a-z0-9]+){2,}\Z/, message: "is not a wiki name" }

  def self.active_wikis
    all.order("name")
  end
end
