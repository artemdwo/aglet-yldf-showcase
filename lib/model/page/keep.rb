class Model::Page::Keep < SitePrism::Page
  set_url "#{Helpers::Config['site_root']}/"

  #Element  #ID,                                    locator
  #CSS

  #XPath
  element   :keep_hdr,        :xpath, ".//span[text()='Keep']"
  element   :note_empty_fld,  :xpath, ".//div[(attribute::role='textbox') and not(contains(attribute::style,'background-color:')) and (attribute::contenteditable='true') or (attribute::spellcheck='true')]"
  elements  :note_text_fld,   :xpath, ".//div[(attribute::role='textbox') and not(contains(attribute::style,'background-color:')) and (attribute::contenteditable='true') or (attribute::spellcheck='true')]"
  element   :done_btn,        :xpath, ".//div[text()='Done']"
  elements  :notes_title_list,:xpath, ".//div[(attribute::role='textbox') and (contains(attribute::style,'background-color:')) and (attribute::contenteditable='false')]"
  elements  :notes_body_list, :xpath, ".//div[(attribute::role='textbox') and not(contains(attribute::style,'background-color:')) and (attribute::contenteditable='false')]"

  #First [0] element corresponds to empty Note title
  def note_title
    note_text_fld.first
  end

  #Second [1] element corresponds to empty Note content\body
  def note_content
    note_text_fld[1]
  end

end