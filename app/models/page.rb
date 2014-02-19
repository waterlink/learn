class Page < ActiveRecord::Base
  belongs_to :presentation

  validates_presence_of :content, :number, :presentation_id

  default_scope -> { order number: :asc }

  def siblings
    Page.where presentation_id: presentation_id
  end

  def prev
    siblings.where('number < ?', number).last
  end

  def next
    siblings.where('number > ?', number).first
  end
end
