class Role < ActiveRecord::Base
  before_validation :set_uniquable_name

  # Validate attributes
  validates :name, presence: true, length: { maximum: 50 }
  validates :uniquable_name, uniqueness: true

  private

  def set_uniquable_name
    self.uniquable_name = Normalizer.new(text: name).call if name_changed?
  end
end
