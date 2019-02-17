class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for({ scope: resource_name, recall: "blogs#index" })
      end
    else
      resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      respond_with resource, location: after_inactive_sign_up_path_for({ scope: resource_name, recall: "blogs#index" })
    end
  end

  # 認証が失敗した場合に呼び出されるアクション
  def failed
    # warden で出力されたエラーを保存する
    flash[:notice] = flash[:notice].to_a.concat [flash[:alert]]
    redirect_to root_path
  end

  protected
  def auth_options
    # 失敗時に recall に設定したパスのアクションが呼び出されるので変更
    # { scope: resource_name, recall: "#{controller_path}#new" } # デフォルト
    { scope: resource_name, recall: "blogs#index" }
  end
end

