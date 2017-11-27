class BodyMass < ApplicationRecord
  before_save :get_bmi!

  belongs_to :user

  validates :weight, :height, presence: true
  validates :user, presence: true

  def get_bmi!
    actual_bmi = self.weight / self.height ** 2
    Bmi.all.each do |b|
      if (actual_bmi > b.from) && (actual_bmi <= b.to)
        self.bmi = b.category
        return
      end
    end
  end

end
