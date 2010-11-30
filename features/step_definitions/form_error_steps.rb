Then /^the "([^"]*)" field should have the "([^"]*)" error$/ do |field_label, error_message|
  within('form li') do
    page.should have_css("label:contains('#{field_label}') ~ p.inline-errors", :text => error_message)
  end
end
