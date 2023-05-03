describe "/dice/number/sides" do
  it "is dynamic", points: 1 do
    number = 5
    sides = 20
    visit "/dice/#{number}/#{sides}"

    expect(page).to have_content("With this many sides: #{sides}"),
      "Expected /dice/#{number}/#{sides} to have content: 'With this many sides: #{sides}'"
  end
end
