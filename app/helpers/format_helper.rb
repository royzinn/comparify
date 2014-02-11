module FormatHelper
  def format(text)
    context = {
      asset_root: 'https://a248.e.akamai.net/assets.github.com/images/icons/',
      link_attr: 'target="_blank"',
      gfm: true
    }

    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::EmojiFilter,
      HTML::Pipeline::AutolinkFilter
    ], context

    pipeline.call(text)[:output].to_s
  end
end
