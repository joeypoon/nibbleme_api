class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :store
  has_one :vendor, through: :store, autosave: false
  has_many :products

  scope :active, -> { where.not(status: "completed") }
  scope :completed, -> { where(status: "completed") }

  validates :user, :store, :pickup_time, :status, presence: true
  validate :valid_status

  def display_status
    "Order " + status
  end

  private

    def valid_status
      valid = ["placed", "received", "completed"]
      valid.include? status
    end
end