When /^I go to the root page$/ do
  visit root_path
end

Then /^I see Nietzsche quote$/ do
  page.should have_content 'He who fights with monsters should look to it that he himself does not become a monster.'
  page.should have_content 'And when you gaze long into an abyss the abyss also gazes into you.'
end
