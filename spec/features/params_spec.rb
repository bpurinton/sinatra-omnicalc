describe "/square/new" do
  it "has one form element", points: 1 do
    visit "/square/new"

    expect(page).to have_css("form", count: 1),
      "Expected to find one form element on the page but found 0 or more than 1."
  end
end

describe "/square/new" do
  it "has form element with an action attribute", points: 1 do
    visit "/square/new"

    expect(page).to have_css("form[action]"),
      "Expected page to have a form element with an 'action' attribute but didn't find one."
  end
end

describe "/square/new" do
  it "has a label with the text 'Enter a number'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/square/new"

    expect(page).to have_css("label", text: /Enter a number/i),
      "Expected to find a 'label' element with specified text, but didn't find one."
  end
end

describe "/square/new" do
  it "has one input element", points: 1 do
    visit "/square/new"

    expect(page).to have_css("input", count: 1)
  end
end

describe "/square/new" do
  it "has a button element with text 'Calculate square'", points: 1, hint: h("copy_must_match") do
    visit "/square/new"

    expect(page).to have_css("button", text: /Calculate square/i)
  end
end

describe "/square/new" do
  it "leads to another functional RCAV when submitted", points: 6, hint: h("button_type") do
    visit "/square/new"

    # click_button "Calculate square"
    find("button", :text => /Calculate square/i ).click

    expect(page).to_not have_current_path("/square/new", ignore_query: true),
      "Expected form to submit to a different Route, but didn't."
  end
end

describe "/square/new" do
  it "captures the user's input in the query string", points: 4, hint: h("names_for_inputs") do
    visit "/square/new"

    expect(page).to have_css("input[name]", count: 1),
      "Expected an input element to have a 'name' attribute but didn't."
  end
end

describe "/square/new" do
  it "has a label that is connected to an input", points: 0, hint: h("label_for_input") do
    visit "/square/new"

    number_label = find("label", :text => /Enter a number/i)
    for_attribute = number_label[:for]

    if for_attribute.empty?
      expect(for_attribute).to_not be_empty,
        "Expected label’s for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }.compact
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label’s for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."
    end
  end
end

describe "/square/new" do
  it "calculates the square correctly with an input of 5", points: 3, hint: h("label_for_input params_are_strings") do
    visit "/square/new"

    # fill_in "Enter a number", with: 5
    number_label = find("label", :text => /Enter a number/i)
    for_attribute = number_label[:for]
    begin
    number_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    number_input.set(5)
    find("button", :text => /Calculate square/i ).click

    expect(page).to have_content(/25/)
  end
end

describe "/square/new" do
  it "calculates the square correctly with an input of 42.42", points: 3, hint: h("label_for_input params_are_strings") do
    visit "/square/new"

    # fill_in "Enter a number", with: 42.42
    number_label = find("label", :text => /Enter a number/i)
    for_attribute = number_label[:for]
    begin
    number_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    number_input.set(42.42)

    find("button", :text => /Calculate square/i ).click

    expect(page).to have_content(1799.4564)
  end
end

describe "/square_root/new" do
  it "has a form element", points: 1 do
    visit "/square_root/new"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/square_root/new" do
  it "has a form with an action attribute", points: 1 do
    visit "/square_root/new"

    expect(page).to have_css("form[action]", count: 1),
      "Expected page to have a form element with an 'action' attribute but didn't find one."
  end
end

describe "/square_root/new" do
  it "has a label element with text 'Enter a number'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/square_root/new"

    expect(page).to have_css("label", text: /Enter a number/i),
    "Expected to find a 'label' element with specified text, but didn't find one."
  end
end

describe "/square_root/new" do
  it "has one input element", points: 1, hint: h("label_for_input") do
    visit "/square_root/new"

    expect(page).to have_css("input", count: 1)
  end
end

describe "/square_root/new" do
  it "has a button element with text 'Calculate square root'", points: 1, hint: h("copy_must_match") do
    visit "/square_root/new"

    expect(page).to have_css("button", text: /Calculate square root/i)
  end
end

describe "/square_root/new" do
  it "leads to another functional RCAV when submitted", points: 6, hint: h("button_type") do
    visit "/square_root/new"

    # click_button "Calculate square root"

    find("button", :text => /Calculate square root/i ).click
    

    expect(page).to_not have_current_path("/square_root/new", ignore_query: true),
      "Expected form to submit to a different Route, but didn't."
  end
end

describe "/square_root/new" do
  it "captures the user's input in the query string", points: 4, hint: h("names_for_inputs") do
    visit "/square_root/new"

    expect(page).to have_css("input[name]", count: 1)
  end
end

describe "/square_root/new" do
  it "has a label that is connected to an input", points: 0, hint: h("label_for_input") do
    visit "/square/new"

    number_label = find("label", :text => /Enter a number/i)
    for_attribute = number_label[:for]

    if for_attribute.empty?
      expect(for_attribute).to_not be_empty,
        "Expected label’s for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }.compact
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label’s for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."
    end
  end
end

describe "/square_root/new" do
  it "calculates the square root correctly with an input of 5", points: 3, hint: h("label_for_input params_are_strings") do
    visit "/square_root/new"

    # fill_in "Enter a number", with: 5
    number_label = find("label", :text => /Enter a number/i)
    for_attribute = number_label[:for]
    begin
    number_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    number_input.set(5)
    # click_button "Calculate square root"
    find("button", :text => /Calculate square root/i ).click

    expect(page).to have_content(2.236)
  end
end

describe "/square_root/new" do
  it "calculates the square root correctly with an input of 42.42", points: 3, hint: h("label_for_input params_are_strings") do
    visit "/square_root/new"

    # fill_in "Enter a number", with: 42.42

    # click_button "Calculate square root"
    number_label = find("label", :text => /Enter a number/i)
    for_attribute = number_label[:for]
    begin
    number_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    number_input.set(42.42)
    find("button", :text => /Calculate square root/i ).click

    expect(page).to have_content(6.513)
  end
end

describe "/payment/new" do
  it "has a form element", points: 1 do
    visit "/payment/new"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/payment/new" do
  it "has a form with an action attribute", points: 2 do
    visit "/payment/new"

    expect(page).to have_css("form[action]"),
      "Expected page to have a form element with an 'action' attribute but didn't find one."
  end
end

describe "/payment/new" do
  it "has a label for APR", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/payment/new"

    expect(page).to have_css("label", text: /APR/i)
  end
end

describe "/payment/new" do
  it "has a label for number of years", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/payment/new"

    expect(page).to have_css("label", text: /Number of years/i)
  end
end

describe "/payment/new" do
  it "has a label for principal", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/payment/new"

    expect(page).to have_css("label", text: /Principal/i)
  end
end

describe "/payment/new" do
  it "has three inputs", points: 1, hint: h("label_for_input") do
    visit "/payment/new"

    expect(page).to have_css("input", count: 3)
  end
end

describe "/payment/new" do
  it "has a button with the text 'Calculate monthly payment'", points: 1, hint: h("copy_must_match") do
    visit "/payment/new"

    expect(page).to have_css("button", text: /Calculate monthly payment/i)
  end
end

describe "/payment/new" do
  it "leads to another functional RCAV when submitted ", points: 6, hint: h("button_type") do
    visit "/payment/new"

    # click_button "Calculate monthly payment"
    find("button", :text => /Calculate monthly payment/i ).click

    expect(page).to_not have_current_path("/payment/new", ignore_query: true),
      "Expected form to submit to a different Route, but didn't."
  end
end

describe "/payment/new" do
  it "captures the user's input in the query string", points: 4, hint: h("names_for_inputs") do
    visit "/payment/new"

    expect(page).to have_css("input[name]", count: 3)
  end
end

describe "/payment/new" do
  it "correctly processes inputs when the form is submitted", points: 3, hint: h("label_for_input params_are_strings") do
    visit "/payment/new"

    # fill_in "APR", with: 3.24
    apr_label = find("label", :text => /APR/i)
    for_attribute = apr_label[:for]
    begin
    apr_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the APR <label> but didn't find one."
    end
    apr_input.set(3.24)
    # fill_in "Number of years", with: 5
    years_label = find("label", :text => /Number of years/i)
    for_attribute = years_label[:for]
    begin
    years_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the 'Number of years' <label> but didn't find one."
    end
    years_input.set(5)
    # fill_in "Principal", with: 14_600
    principal_label = find("label", :text => /Principal/i)
    for_attribute = principal_label[:for]
    begin
    principal_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    principal_input.set(14_600)

    # click_button "Calculate monthly payment"
    find("button", :text => /Calculate monthly payment/i ).click

    expect(page).to have_content(263.90)
  end
end

describe "/payment/new" do
  it "formats large dollar amounts on the results page", points: 1, hint: h("to_s_currency") do
    visit "/payment/new"

    # fill_in "APR", with: 4.10
    # fill_in "Number of years", with: 30
    # fill_in "Principal", with: 250_000
    apr_label = find("label", :text => /APR/i)
    for_attribute = apr_label[:for]
    begin
    apr_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the APR <label> but didn't find one."
    end
    apr_input.set(4.10)
    # fill_in "Number of years", with: 5
    years_label = find("label", :text => /Number of years/i)
    for_attribute = years_label[:for]
    begin
    years_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the 'Number of years' <label> but didn't find one."
    end
    years_input.set(30)
    # fill_in "Principal", with: 14_503
    principal_label = find("label", :text => /Principal/i)
    for_attribute = principal_label[:for]
    begin
    principal_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    principal_input.set(250_000)

    # click_button "Calculate monthly payment"
    find("button", :text => /Calculate monthly payment/i ).click

    # expect(page).to have_content("$1,208.00")
    expect(page).to have_content(/\$\d+,?\d*?\.\d\d/)
  end
end

describe "/payment/new" do
  it "calculates the monthly payment to correctly when the form is submitted", points: 1, hint: h("round") do
    visit "/payment/new"

    # fill_in "APR", with: 3.24
    # fill_in "Number of years", with: 5
    # fill_in "Principal", with: 14_503
    apr_label = find("label", :text => /APR/i)
    for_attribute = apr_label[:for]
    begin
    apr_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the APR <label> but didn't find one."
    end
    apr_input.set(3.24)
    # fill_in "Number of years", with: 5
    years_label = find("label", :text => /Number of years/i)
    for_attribute = years_label[:for]
    begin
    years_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the 'Number of years' <label> but didn't find one."
    end
    years_input.set(5)
    # fill_in "Principal", with: 14_503
    principal_label = find("label", :text => /Principal/i)
    for_attribute = principal_label[:for]
    begin
    principal_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    principal_input.set(14_503)

    # click_button "Calculate monthly payment"
    find("button", :text => /Calculate monthly payment/i ).click

    expect(page).to have_content("$262.15")
  end
end

describe "/payment/new" do
  it "calculates the monthly payment correctly", points: 1, hint: h("to_s_currency") do
    visit "/payment/new"

    # fill_in "APR", with: 4.10
    # fill_in "Number of years", with: 30
    # fill_in "Principal", with: 250_000
    apr_label = find("label", :text => /APR/i)
    for_attribute = apr_label[:for]
    begin
    apr_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the APR <label> but didn't find one."
    end
    apr_input.set(4.10)
    # fill_in "Number of years", with: 5
    years_label = find("label", :text => /Number of years/i)
    for_attribute = years_label[:for]
    begin
    years_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the 'Number of years' <label> but didn't find one."
    end
    years_input.set(30)
    # fill_in "Principal", with: 14_503
    principal_label = find("label", :text => /Principal/i)
    for_attribute = principal_label[:for]
    begin
    principal_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    principal_input.set(250_000)

    # click_button "Calculate monthly payment"
    find("button", :text => /Calculate monthly payment/i ).click

    expect(page).to have_content("$1,208.00")
  end
end

describe "/payment/new" do
  it "rounds the interest rate to four digits on the results page", points: 0, hint: h("round") do
    visit "/payment/new"

    # fill_in "APR", with: 4.12345
    # fill_in "Number of years", with: 30
    # fill_in "Principal", with: 250_000
    apr_label = find("label", :text => /APR/i)
    for_attribute = apr_label[:for]
    begin
    apr_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the APR <label> but didn't find one."
    end
    apr_input.set(4.12345)
    years_label = find("label", :text => /Number of years/i)
    for_attribute = years_label[:for]
    begin
    years_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the 'Number of years' <label> but didn't find one."
    end
    years_input.set(30)
    principal_label = find("label", :text => /Principal/i)
    for_attribute = principal_label[:for]
    begin
    principal_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    principal_input.set(250_000)


    # click_button "Calculate monthly payment"
    find("button", :text => /Calculate monthly payment/i ).click

    # expect(page).to have_content(4.1235)
    expect(page).to have_content(/\d+\.\d{4}/)
  end
end

describe "/payment/new" do
  it "formats the rate as a percentage on the results page", points: 1, hint: h("to_s_percentage") do
    visit "/payment/new"

    apr_label = find("label", :text => /APR/i)
    for_attribute = apr_label[:for]
    begin
    apr_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the APR <label> but didn't find one."
    end
    apr_input.set(4.12345)
    years_label = find("label", :text => /Number of years/i)
    for_attribute = years_label[:for]
    begin
    years_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of the 'Number of years' <label> but didn't find one."
    end
    years_input.set(30)
    principal_label = find("label", :text => /Principal/i)
    for_attribute = principal_label[:for]
    begin
    principal_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    principal_input.set(250_000)

    # click_button "Calculate monthly payment"
    find("button", :text => /Calculate monthly payment/i ).click

    # expect(page).to have_content("4.1235%")
    expect(page).to have_content(/\d+\.\d{4}%/)
  end
end

describe "/random/new" do
  it "has a form element", points: 1 do
    visit "/random/new"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/random/new" do
  it "has a form with an action attribute", points: 1 do
    visit "/random/new"

    expect(page).to have_css("form[action]")
  end
end

describe "/random/new" do
  it "has a label with text 'Minimum'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/random/new"

    expect(page).to have_css("label", text: /Minimum/i)
  end
end

describe "/random/new" do
  it "has a label with text 'Maximum'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/random/new"

    expect(page).to have_css("label", text: /Maximum/i)
  end
end

describe "/random/new" do
  it "has two input elements", points: 1, hint: h("label_for_input") do
    visit "/random/new"

    expect(page).to have_css("input", count: 2)
  end
end

describe "/random/new" do
  it "has a button element with text 'Pick random number'", points: 1, hint: h("copy_must_match") do
    visit "/random/new"

    expect(page).to have_css("button", text: /Pick random number/i)
  end
end

describe "/random/new" do
  it "leads to another functional RCAV when submitted", points: 6, hint: h("button_type label_for_input copy_must_match") do
    visit "/random/new"

    # fill_in "Minimum", with: 1.0
    # fill_in "Maximum", with: 10.0
    min_label = find("label", :text => /Minimum/i)
    for_attribute = min_label[:for]
    begin
    min_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    min_input.set(1.0)
    max_label = find("label", :text => /Maximum/i)
    for_attribute = max_label[:for]
    begin
    max_input = find("##{for_attribute}")
    rescue Capybara::ElementNotFound
      expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
    end
    max_input.set(10.0)

    # click_button "Pick random number"
    find("button", :text => /Pick random number/i ).click

    expect(page).to_not have_current_path("/random/new", ignore_query: true),
      "Expected form to submit to a route different than '/random/new' but current route was still '/random/new'"
  end
end

describe "/random/new" do
  it "captures the user's input in the query string", points: 4, hint: h("names_for_inputs") do
    visit "/random/new"

    expect(page).to have_css("input[name]", count: 2)
  end
end

describe "/random/new" do
  it "has a label for 'Minimum' that is connected to an input", points: 0, hint: h("label_for_input") do
    visit "/random/new"

    minimum_label = find("label", :text => /Minimum/i)
    for_attribute = minimum_label[:for]

    if for_attribute.empty?
      expect(for_attribute).to_not be_empty,
        "Expected label’s for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }.compact
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected Minimum label’s for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."
    end
  end
end

describe "/random/new" do
  it "has a label for 'Maximum' that is connected to an input", points: 0, hint: h("label_for_input") do
    visit "/random/new"

    maximum_label = find("label", :text => /Maximum/i)
    for_attribute = maximum_label[:for]

    if for_attribute.empty?
      expect(for_attribute).to_not be_empty,
        "Expected label’s for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }.compact
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected Maximum label’s for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."
    end
  end
end

describe "/random/new" do
  it "outputs a random number when the form is filled out and submitted", points: 10, hint: h("structure_must_match label_for_input copy_must_match") do
    random_numbers = []
    5.times do
      visit "/random/new"
      # fill_in "Minimum", with: 1.0
      # fill_in "Maximum", with: 10.0
      min_label = find("label", :text => /Minimum/i)
      for_attribute = min_label[:for]
      begin
      min_input = find("##{for_attribute}")
      rescue Capybara::ElementNotFound
        expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
      end
      min_input.set(1.0)
      max_label = find("label", :text => /Maximum/i)
      for_attribute = max_label[:for]
      begin
      max_input = find("##{for_attribute}")
      rescue Capybara::ElementNotFound
        expect(false). to be(true), "Expected to find an <input> with an id attribute that matched the for attribute of a <label> but didn't find one."
      end
      max_input.set(10.0)
      # click_button "Pick random number"
      find("button", :text => /Pick random number/i ).click
      # Array containing each number rendered on the random/results page
      numbers_on_page = page.text.scan(/\d+\.\d*/).map(&:to_f)
      numbers_on_page.each do |num|
        if num != 1 && num != 10
          random_numbers.push(num)
        end
      end
    end
    expect(random_numbers.uniq.length).to be > 1,
      "Expected to find at least on number between 1 and 10 but didn't find any."
  end
end
