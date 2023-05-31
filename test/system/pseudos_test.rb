require "application_system_test_case"

class PseudosTest < ApplicationSystemTestCase
  setup do
    @pseudo = pseudos(:one)
  end

  test "visiting the index" do
    visit pseudos_url
    assert_selector "h1", text: "Pseudos"
  end

  test "should create pseudo" do
    visit pseudos_url
    click_on "New pseudo"

    fill_in "Description", with: @pseudo.description
    fill_in "Image", with: @pseudo.image
    fill_in "Name", with: @pseudo.name
    fill_in "User", with: @pseudo.user_id
    click_on "Create Pseudo"

    assert_text "Pseudo was successfully created"
    click_on "Back"
  end

  test "should update Pseudo" do
    visit pseudo_url(@pseudo)
    click_on "Edit this pseudo", match: :first

    fill_in "Description", with: @pseudo.description
    fill_in "Image", with: @pseudo.image
    fill_in "Name", with: @pseudo.name
    fill_in "User", with: @pseudo.user_id
    click_on "Update Pseudo"

    assert_text "Pseudo was successfully updated"
    click_on "Back"
  end

  test "should destroy Pseudo" do
    visit pseudo_url(@pseudo)
    click_on "Destroy this pseudo", match: :first

    assert_text "Pseudo was successfully destroyed"
  end
end
