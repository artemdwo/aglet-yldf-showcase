#!/bin/env ruby
# encoding: utf-8

Given /^I am on the home Google Doodle page$/ do
  @aglet = Model::Aglet.new
  @aglet.doodle_page.load
  @aglet_content ||= Model::Domain::SearchContent.new
end

When /^I search for Jubilee$/ do
  @aglet.doodle_page.header.search_fld.set @aglet_content.search_term
  @aglet.doodle_page.header.search_btn.click
end

Then /^The first result should contain '(.*)' doodle$/ do |expectation|
  @aglet.doodle_page.doodle.result(0).text.should include expectation
end
