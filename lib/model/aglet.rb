class Model::Aglet

  def account_login_page
    Model::Page::AccountLogin.new
  end

  def keep_page
    Model::Page::Keep.new
  end
end