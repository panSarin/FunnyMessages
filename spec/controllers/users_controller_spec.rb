require 'rails_helper'

describe UsersController do
  describe '#create' do
    subject { post :create, params: form_params }

    context 'valid data' do
      let(:form_params) { {user: { name: 'Joe', dialect: 'doe' } } }

      it 'create user' do
        expect{subject}.to change{User.count}.by(1)
      end

      it 'call for SignInUser service' do
        expect_any_instance_of(SignInUser).to receive(:process)
        subject
      end

      it 'redirects to chat showpage' do
        subject
        expect(response).to redirect_to(chat_path)
      end
    end

    context 'invalida data' do
      let(:form_params) { {user: { name: '', dialect: '' } } }
      it 'renders new view again' do
        subject
        expect(response).to render_template(:new)
      end
    end

  end

end
