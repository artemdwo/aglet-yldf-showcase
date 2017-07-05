class Model::Page::Keep < SitePrism::Page
  set_url "#{Helpers::Config['site_root']}/"

  #Element  #ID,                                    locator
  #CSS

  #XPath
  element   :keep_hdr,          :xpath, ".//span[text()='Keep']"
  element   :note_empty_fld,    :xpath, ".//div[(attribute::role='textbox') and not(contains(attribute::style,'background-color:')) and (attribute::contenteditable='true') or (attribute::spellcheck='true')]"
  elements  :note_text_fld,     :xpath, ".//div[(attribute::role='textbox') and not(contains(attribute::style,'background-color:')) and (attribute::contenteditable='true') or (attribute::spellcheck='true')]"
  element   :done_btn,          :xpath, ".//div[text()='Done']"
  elements  :notes_title_list,  :xpath, ".//div[(attribute::role='textbox') and (contains(attribute::style,'background-color:')) and (attribute::contenteditable='false')]"
  elements  :notes_body_list,   :xpath, ".//div[(attribute::role='textbox') and not(contains(attribute::style,'background-color:')) and (attribute::contenteditable='false')]"
  elements  :add_reminder_btn,  :xpath, ".//div[not(contains(attribute::style,'display: none'))]/div/div[attribute::aria-label='Remind me']"
  elements  :collaborator_btn,  :xpath, ".//div[attribute::role='toolbar']/div[(attribute::role='button') and (attribute::aria-label='Collaborator')]"
  elements  :change_colour_btn, :xpath, ".//div[attribute::role='toolbar']/div[(attribute::role='button') and (attribute::aria-label='Change color')]"
  elements  :archive_btn,       :xpath, ".//div[attribute::role='toolbar']/div[(attribute::role='button') and (attribute::aria-label='Archive')]"
  elements  :unarchive_btn,     :xpath, ".//div[attribute::role='toolbar']/div[(attribute::role='button') and (attribute::aria-label='Unarchive')]"
  elements  :more_menu_btn,     :xpath, ".//div[attribute::role='toolbar']/div[(attribute::role='button') and (attribute::aria-label='More')]"
  element   :empty_trash_lnk,   :xpath, ".//div[(attribute::role='button') and (text()='Empty Trash now')]"
  element   :delete_confim_btn, :xpath, ".//div[(attribute::role='button') and (text()='Delete')]"
  elements  :select_note_btn,   :xpath, ".//div[(attribute::role='button') and (attribute::aria-label='Select note')]"
  element   :empty_confim_btn,  :xpath, ".//div[(attribute::role='button') and (text()='Empty Trash')]"

  #Top Navigation
  element   :list_view_btn,     :xpath, ".//div[(attribute::role='button') and (attribute::aria-label='List View')]"

  #Reminder menu
  element   :remind_tonight_itm,    :xpath, ".//div[(attribute::gaid='tonightselected') and (attribute::role='menuitem')]"
  element   :remind_tomorrow_itm,   :xpath, ".//div[(attribute::gaid='tomorrowmorningselected') and (attribute::role='menuitem')]"
  element   :remind_next_week_itm,  :xpath, ".//div[(attribute::gaid='nextweekselected') and (attribute::role='menuitem')]"
  element   :date_picker_item,      :xpath, ".//div[(attribute::role='menuitem')]/div/div[text()='Pick date & time']"
  element   :place_picker_item,     :xpath, ".//div[(attribute::role='menuitem')]/div/div[text()='Pick place']"

  #Left-side nav menu
  element   :notes_menu_item,   :xpath, "//li[@id='gbm:1']/a"
  element   :archive_menu_item, :xpath, "//li[@id='gbm:6']/a"
  element   :trash_menu_item,   :xpath, "//li[@id='gbm:7']/a"

  #More menu
  element   :delete_note,       :xpath, ".//div[(attribute::role='menuitem') and (@id=':2')]/div[text()='Delete note']"
  element   :delete_forever,    :xpath, ".//div[(attribute::role='menuitem') and (@id=':1')]/div[text()='Delete forever']"

  #First [0] element corresponds to empty Note title
  def note_title
    note_text_fld.first
  end

  #Second [1] element corresponds to empty Note content\body
  def note_content
    note_text_fld[1]
  end

  def date_time_finder datetime
    find(:xpath, ".//div[text()='#{datetime}']")
  end
end