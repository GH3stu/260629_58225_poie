module ApplicationHelper
  # URL を自動リンク化するメソッド
  def url_to_link(text)
    return "" if text.blank?

    text.gsub(URI.regexp(%w[http https])) do |url|
      # ここに追加
      link_to(url, url, target: "_blank", rel: "noopener")
    end.html_safe
  end
end
