require 'uri'

module LinkToHelper
  def ms_link_to(name, url, html_options = nil, &block)
    uri = URI(url)
    params = URI.decode_www_form(uri.query || '') << [MicroSession.param, micro_session.id]
    uri.query = URI.encode_www_form(params)

    link_to(name, uri.to_s, html_options, &block)
  end
end
