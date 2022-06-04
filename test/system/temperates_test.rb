require "application_system_test_case"

class TemperatesTest < ApplicationSystemTestCase
  setup do
    @temperate = temperates(:one)
  end

  test "visiting the index" do
    visit temperates_url
    assert_selector "h1", text: "Temperates"
  end

  test "creating a Temperate" do
    visit temperates_url
    click_on "New Temperate"

    click_on "Create Temperate"

    assert_text "Temperate was successfully created"
    click_on "Back"
  end

  test "updating a Temperate" do
    visit temperates_url
    click_on "Edit", match: :first

    click_on "Update Temperate"

    assert_text "Temperate was successfully updated"
    click_on "Back"
  end

  test "destroying a Temperate" do
    visit temperates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Temperate was successfully destroyed"
  end
end
