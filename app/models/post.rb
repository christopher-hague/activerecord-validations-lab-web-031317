class MyValidator < ActiveModel::Validator
  def validate(post)
    # unless post.title.include buzz words...
    unless post.title =~ /Won't Believe|Secret|Guess|Top \d/
      # errors[:title] << text
      post.errors[:title] << "This title isn't clickbait-y enough!"
    end
  end
end


class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
