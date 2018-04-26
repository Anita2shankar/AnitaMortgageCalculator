
Given(/^User is on the Mortgage Calculator page$/) do

  visit MortCalcHomePage

end


When(/^The user enters valid values in Loan Fields$/) do
  on(MortCalcHomePage).populatedata
end


Then(/^The Mortgage summary will be displayed$/) do
 on(MortCalcHomePage).read_display

  sleep 5
  p"lets see"
end

When(/^The  valid values are entered into Loan Fields$/) do
  on(MortCalcHomePage).get_data_from_YML

end