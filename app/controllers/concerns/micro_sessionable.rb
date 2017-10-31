require "micro_session/store"

module MicroSessionable
  extend ActiveSupport::Concern

  included do
    helper LinkToHelper
    helper FormTagHelper

    helper_method :micro_session
  end

  def micro_session
    @micro_session ||= MicroSession::Store.new(self)
  end
end

