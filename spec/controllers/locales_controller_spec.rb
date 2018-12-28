require 'rails_helper'

RSpec.describe LocalesController, type: :controller do
  describe 'PATCH #update' do
    describe 'change locale' do
      let(:back) { root_path }

      before do
        patch :update, params: { id: 'ua' }
        request.env['HTTP_REFERER'] = back
      end

      it { expect(@request.session['locale']).to eq 'ua' }
      it { expect(response).to redirect_to(back) }
    end
  end
end
