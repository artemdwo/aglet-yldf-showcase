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
  sleep(5)
  # Timeout.timeout(front_timeout) { sleep(5) until @aglet.account_login_page.my_account_hdr.present? }
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
end

And /^Fill in Note content with (.*?)$/ do |content|
  @aglet.keep_page.note_content.set content
end

Then /^I save the Note$/ do
  @aglet.keep_page.done_btn.click
end

And /^Verify created Note with Title:(.*?) and Content:(.*?)$/ do |title, content|

  i=0
  while (@aglet.keep_page.notes_title_list[i].text != title) && (@aglet.keep_page.notes_body_list[i].text != content) do
    i+=1
  end
end