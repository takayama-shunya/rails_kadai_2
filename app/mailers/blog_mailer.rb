class BlogMailer < ApplicationMailer

  def blog_mail(blog)
    @post = blog
    mail to: "example@mail.com", subject: "ブログ投稿完了メール"
  end

end
