require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  describe 'POST /sessions' do
    it 'renders new session object' do
      FactoryBot.create(:user, username: 'asdasdasd', password: 'asdasdasd')

      post :create, params: {
        user: {
          username: 'asdasdasd',
          password: 'asdasdasd'
        }
      }

      expect(response.body).to eq({
        success: true
      }.to_json)
    end
  end

  # spec/controllers/sessions_controller_spec.rb
describe 'GET /authenticated' do
  it 'renders authenticated user object' do
    user = FactoryBot.create(:user)
    session = Session.create!(user: user)

    # Mimic logged-in user by passing token
    request.headers['Authorization'] = session.token

    get :authenticated
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)['username']).to eq(user.username)
  end
end


  describe 'DELETE /sessions' do
    it 'renders success' do
      user = FactoryBot.create(:user)
      session = user.sessions.create
      @request.cookie_jar.signed['todolist_session_token'] = session.token

      
def destroy
  session = Session.find_by(token: params[:token])
  session&.destroy
  render json: { success: true }
end

      
    end
  end
end
