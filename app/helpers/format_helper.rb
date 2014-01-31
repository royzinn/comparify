module FormatHelper
  def format(text)
    context = {
      asset_root: 'https://a248.e.akamai.net/assets.github.com/images/icons/'
    }

    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::AutolinkFilter,
      HTML::Pipeline::EmojiFilter
    ], context, Hash

    pipeline.call(text)[:output].to_s
  end
end
