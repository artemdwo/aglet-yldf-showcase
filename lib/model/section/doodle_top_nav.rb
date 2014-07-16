class Model::Section::DoodleTopNav < SitePrism::Section
            
  #Element  #ID,                  locator
  element   :logo,                '#logo'
  element   :archive_lnk,         '#archive-link a'
  element   :about_lnk,           'a[href*="about"]'
  element   :search_fld,          '#searchinput'
  element   :search_btn,          '#searchbtn'

end