
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

When(/^the user choses the Extra payments tab$/) do

  #on(MortCalcHomePage).ulsubmenu_element.fire_event('onmouseover')
  on(MortCalcHomePage).ulsubmenu_element.hover
   p 'hi'
  on(MortCalcHomePage).aextrapayment
end

Then(/^the user lands on the Save Money\/Extra Payments page$/) do
  vtitle = on(ExtraPayCalcHomePage).hExtraPayTitle_element.text
  p vtitle =~/extra mortgage/i
  expect vtitle.eql?'extra mortgage payment calculator'
end