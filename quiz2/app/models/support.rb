class Support < ApplicationRecord
  def self.search(search)
    where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  private

  def set_default_undone
    self.undone ||= if rand(2).zero?
                        false
                      else
                        true
                      end
  end
end
