class Course < ActiveRecord::Base
  mount_uploader :image, CourseImageUploader

  validates :title, presence: true, length: { maximum: 100 }
  validates :source, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :url, presence: true, format: { with: URI.regexp },
    if: Proc.new { |a| a.url.present? }

  def self.search(search)
      search_term = "%" + search + "%"
      where(['title ILIKE ? OR description ILIKE ? OR source ILIKE ?', search_term, search_term, search_term])
  end
end
