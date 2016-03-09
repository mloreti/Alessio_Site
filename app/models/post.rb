class Post < ActiveRecord::Base
  has_attached_file :image,
    styles: { original: "100%",xlarge: "1000x1000>", large: "600x600>",
    medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def previous
    Post.where(["id < ?", id]).last
  end

  def next
    Post.where(["id > ?", id]).first
  end

  def to_param
    title
  end
end
