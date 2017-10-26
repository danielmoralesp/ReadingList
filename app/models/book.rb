class Book < ApplicationRecord

  scope :finished, ->{ where.not(finished_on: nil) }
  scope :recent, ->{ where('finished_on > ?', 2.days.ago) }
  #scope :search, ->(keyword){ where(title: keyword) if keyword.present? }
  scope :search, ->(keyword){ where('keywords LIKE ?', "%#{keyword.downcase}%" ) if keyword.present? }
  # en el scope no hay necesidad de retornar else all, porque lo hace el scope

  before_save :set_keywords

  # def self.recent
  #   where('finished_on > ?', 2.days.ago)
  # end

  # def self.search(keyword)
  #   if keyword.present?
  #     where(title: keyword)
  #   else
  #     all
  #   end
  # end

  def finished?
    finished_on.present?
  end

  protected
    def set_keywords
      self.keywords = [title, author, description].map(&:downcase).join(' ')
    end
end
