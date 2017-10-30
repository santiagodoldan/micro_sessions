require 'rails_helper'

RSpec.describe HumansController do
  describe 'GET \'index\'' do
    it 'does not respond to micro_session' do
      expect(subject.respond_to?(:micro_session)).to be_falsey
    end
  end
end
