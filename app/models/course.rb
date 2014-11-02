class Course < ActiveRecord::Base
  mount_uploader :image, CourseImageUploader

  validates :title, presence: true, length: { maximum: 100 }
  validates :source, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :url, presence: true, format: { with: URI.regexp },
    if: Proc.new { |a| a.url.present? }

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ? OR description LIKE ? OR source LIKE ?', search_condition, search_condition])
  end
end
