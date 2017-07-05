#!/bin/env ruby
# encoding: utf-8

Given /^I am on the Account Login page$/ do
  @aglet = Model::Aglet.new
  @aglet.account_login_page.load
  @login_details ||= Model::Domain::LoginDetails.new
end

When /^Enter login$/ do
  @aglet.account_login_page.email_fld.set @login_details.login
  @aglet.account_login_page.next_btn.click
end

Then /^Enter password$/ do
  @aglet.account_login_page.password_fld.set @login_details.password
end

When /^Submit login details$/ do
  @aglet.account_login_page.submit_btn.click
end

Given /^I open Google Keep web app$/ do
  @aglet.keep_page.load
  @keep_details ||= Model::Domain::KeepDetails.new
  Timeout.timeout(front_timeout) { sleep(0.1) until @aglet.keep_page.keep_hdr.present? }
end

Then /^I am on Main Google Keep page$/ do
  expect(@aglet.keep_page.current_url).to include @keep_details.host_to_match
end

When /^I select Note template$/ do
  @aglet.keep_page.note_empty_fld.click
end

And /^Fill in Title with (.*?)$/ do |title|
  @aglet.keep_page.note_title.set title
  sleep 1
end

And /^Fill in Note content with (.*?)$/ do |content|
  @aglet.keep_page.note_content.set content
  sleep 1
end

Then /^I save the (Note|Reminder)$/ do |type|
  @aglet.keep_page.done_btn.click
  sleep 1
end

And /^Verify (created|present) Note with Title:(.*?) and Content:(.*?)$/ do |state, title, content|

  results = find_note(title, content)

  # If not found (results[0] == FALSE) display error message and fail the scenario
  unless results[0]
    raise "Could not find a Note with Title:#{title} and Content:#{content}"
  end
end

And /^Set reminder to (.*?)$/ do |time|
  @aglet.keep_page.add_reminder_btn.first.click
  @aglet.keep_page.remind_tonight_itm.click
end

And /^Verify that date-time is (.*?)$/ do |datetime|
  @aglet.keep_page.date_time_finder(datetime).present?
end

And /^I find a Note with Title:(.*?) and Content:(.*?)$/ do |title, content|
  # class variable to pass index of found Note to other step
  @search_index = nil

  results = find_note(title, content)

  #
  # If requested Note is found (results[0] == TRUE)
  # then save its index (results[1]) as @search_index
  # Otherwise, display error message and fail scenario
  #
  if results[0]
    @search_index = results[1]
  else
    raise "Could not find a Note with Title:#{title} and Content:#{content}"
  end
end

And /^I (archive|unarchive|delete|evaporate|delete all) the Note$/ do |action|

  case action
    when "archive"
      # To skip 0 index that corresponds to Note form
      i = @search_index + 1
      @aglet.keep_page.archive_btn[i].click
    when "unarchive"
      # To skip 0 index that corresponds to Note form
      i = @search_index + 1
      @aglet.keep_page.unarchive_btn[i].click
    when "delete"
      # To skip 0,1 indexes that corresponds to Note form and top nav menu
      i = @search_index + 2
      @aglet.keep_page.more_menu_btn[i].click
      @aglet.keep_page.delete_note.click
    when "evaporate"
      # To skip 0,1 indexes that corresponds to Note form and top nav menu
      i = @search_index + 2
      @aglet.keep_page.more_menu_btn[i].click
      @aglet.keep_page.delete_forever.click
      @aglet.keep_page.delete_confim_btn.click
    when "delete all"
      @aglet.keep_page.more_menu_btn[0].click
      @aglet.keep_page.delete_note.click
  end

  sleep 1
end

And /^The Note with Title:(.*?) and Content:(.*) should appear in (Archive|Trash) tab$/ do |title, content, location|

  case location
    when 'Archive'
      step 'I go to Archived tab'
    when 'Trash'
      step 'I go to Trash tab'
  end

  results = find_note(title, content)

  # If not found (results[0] == FALSE) display error message and fail the scenario
  unless results[0]
    raise "Could not find a Note with Title:#{title} and Content:#{content}"
  end
end

And /^I go to (.*?) tab$/ do |location|

  case location
    when 'Archived'
      @aglet.keep_page.archive_menu_item.click
    when 'Trash'
      @aglet.keep_page.trash_menu_item.click
    when 'Notes'
      @aglet.keep_page.notes_menu_item.click
    else
      raise "You asked to go to #{location}. Seems I do not know where is it."
  end
  sleep 1
end

Then /^I select all available Notes$/ do
  count = @aglet.keep_page.notes_title_list.length-1
  for i in 1..count
    @aglet.keep_page.select_note_btn[i].hover
    @aglet.keep_page.select_note_btn[i].click
  end
end

Then /^Empty the Trash$/ do
  @aglet.keep_page.empty_trash_lnk.click
  @aglet.keep_page.empty_confim_btn.click
end

Then /^Empty Trash link should disappear$/ do
  if @aglet.keep_page.empty_trash_lnk.visible?
    raise "Hmmm... There is something left in the Trash!"
  end
end

### Helper Methods ###

#
# Finds a Note with specified :title and :content
# Returns :found    boolean   found = TRUE | found = FALSE
#         :found_index  integer   index of found Note
#
# :title   string  note's title
# :content string  note's content
#
def find_note title, content

  # iteration index
  i = 0

  # boolean flag to catch when the Notes is found
  found = false

  #
  # To store the index of found Note
  #   integer if Note is found
  #   nil     if Note is not found
  #
  found_index = nil

  while @aglet.keep_page.notes_title_list[i] && @aglet.keep_page.notes_body_list[i] do
    if (@aglet.keep_page.notes_title_list[i].text === title) && (@aglet.keep_page.notes_body_list[i].text === content)
      found = true
      break
    else
      i += 1
    end
  end

  # If the Note is found then pass index to :found_index
  if found
    found_index = i
  end

  return found, found_index

end