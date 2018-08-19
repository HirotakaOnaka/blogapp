module BlogsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_blogs_path
    else action_name == 'edit'
      blog_path
    end
  end

  require "uri"
  def text_url_to_link text
    URI.extract(text, ['http','https']).uniq.each do |url|
    sub_text = ""
    sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
    text.gsub!(url, sub_text)
    end
    return text
  end
end
