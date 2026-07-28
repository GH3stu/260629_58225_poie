module ApplicationHelper
  def url_to_link(text)
    return "" if text.blank?

    # URL をリンク化（target="_blank" 付き）
    linked = text.gsub(%r{(https?://[^\s]+)}) do |url|
      "<a href='#{url}' target='_blank' rel='noopener'>#{url}</a>"
    end

    # simple_format の sanitize を OFF にする
    simple_format(linked, {}, sanitize: false)
  end
end
