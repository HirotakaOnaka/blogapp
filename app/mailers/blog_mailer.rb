class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
    mail to: "hiro.onaka0510@gmail.com", subject:"Noteを投稿しました！"
  end
end