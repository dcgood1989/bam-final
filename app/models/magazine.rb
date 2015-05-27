class Magazine < ActiveRecord::Base

  validates :title, presence: true
  validates :edition, presence: true
  validates :issue, presence: true
  validates :language, presence: true

  def full_title
    "#{self.title} Edition #{self.edition}. Published #{self.issue.strftime("%m/%d/%Y")} in #{self.language}"
  end



end
