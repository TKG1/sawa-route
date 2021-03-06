class OauthsController < ApplicationController
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    @user = login_from(provider)
    if @user
      redirect_to root_path, success: t('.success', provider: provider.titleize)
    else
      begin
        @user = create_from(provider)

        reset_session
        auto_login(@user)
        redirect_to root_path, success: t('.success', provider: provider.titleize)
      rescue StandardError
        redirect_to root_path, danger: t('.fail', provider: provider.titleize)
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
