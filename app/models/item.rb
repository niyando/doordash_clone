class Item < ApplicationRecord
  validates_presence_of :name, :amount

  cattr_accessor(:paginates_per) { 10 }

  def self.paginate(offset)
    offset(offset).limit(self.paginates_per)
  end

  def self.search(keywords)
    return self if keywords.blank?
    where('lower(name) like :keywords OR lower(description) like :keywords', :keywords => "%#{keywords.downcase}%")
  end

  def abbr_description
    self.description.truncate(180)
  end
  
end
