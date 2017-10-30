require 'rails_helper'

RSpec.describe MutantsController do
  describe 'GET \'index\'' do
    it 'returns a MicroSession::Store instance' do
      get :index

      expect(subject.micro_session).to be_kind_of(MicroSession::Store)
    end

    context 'when there is no data stored in the session' do
      it 'returns an empty hash' do
        get :index

        expect(subject.micro_session.to_h).to be_empty
      end
    end

    context 'when there is data stored in the session' do
      before do
        subject.micro_session['test'] = 'test'
      end

      it 'returns stored data' do
        get :index

        expect(subject.micro_session.to_h).to eq(test: 'test')
      end
    end
  end
end
