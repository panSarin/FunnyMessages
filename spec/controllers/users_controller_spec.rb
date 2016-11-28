require 'rails_helper'

describe UsersController do
  describe '#create' do
    subject { post :create, params: form_params }

    context 'valid data' do
      let(:form_params) { {user: { name: 'Joe', dialect: 'doe' } } }

      it 'create user' do
        expect{subject}.to change{User.count}.by(1)
      end

      it 'broadcast information about new user' do
        expect_any_instance_of(ActionCable::Server::Base).to receive(:broadcast).with('users', name: 'Joe')
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
