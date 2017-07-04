class Model::Page::AccountLogin < SitePrism::Page
  set_url "https://accounts.google.com/signin/v2/identifier"

  #Element  #ID,                                    locator
  #CSS
  element   :email_fld,       '#identifierId'
  element   :next_btn,        '#identifierNext'
  element   :password_fld,    'input[name="password"]'
  element   :submit_btn,      '#passwordNext'

  #XPath
  element   :my_account_hdr,  :xpath, ".//h1[text()='My Account']"

end