module LinkToHelper
  def ms_link_to(name = nil, options = nil, html_options = nil, &block)
    options ||= {}

    options[MicroSession.param] = micro_session.id

    link_to(name, options, html_options, &block)
  end
end
