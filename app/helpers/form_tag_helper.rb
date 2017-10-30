module FormTagHelper
  def micro_session_hidden_field
    hidden_field_tag MicroSession.param, micro_session.id
  end
end

