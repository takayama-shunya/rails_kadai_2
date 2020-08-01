class BlogMailer < ApplicationMailer

  def blog_mail(blog)
    @post = blog
    mail to: @post.user.email, subject: "ブログ投稿完了メール"
  end

end
