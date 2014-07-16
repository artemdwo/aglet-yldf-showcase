class Model::Page::DoodlePage < SitePrism::Page
  set_url "#{Helpers::Config['site_root']}/doodles"

  #Element  #ID,                                    locator
  section   :header, Model::Section::DoodleTopNav,  '#nav'
  section   :doodle, Model::Section::DoodleBlock,   '#archive-list'

  element   :loader_on,     '#loading[class=""]'
  element   :loader_off,    '#loading[class="off"]'

end