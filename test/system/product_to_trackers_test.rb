require "application_system_test_case"

class ProductToTrackersTest < ApplicationSystemTestCase
  setup do
    @product_to_tracker = product_to_trackers(:one)
  end

  test "visiting the index" do
    visit product_to_trackers_url
    assert_selector "h1", text: "Product To Trackers"
  end

  test "creating a Product to tracker" do
    visit product_to_trackers_url
    click_on "New Product To Tracker"

    fill_in "Product", with: @product_to_tracker.product_id
    fill_in "Tracker", with: @product_to_tracker.tracker_id
    click_on "Create Product to tracker"

    assert_text "Product to tracker was successfully created"
    click_on "Back"
  end

  test "updating a Product to tracker" do
    visit product_to_trackers_url
    click_on "Edit", match: :first

    fill_in "Product", with: @product_to_tracker.product_id
    fill_in "Tracker", with: @product_to_tracker.tracker_id
    click_on "Update Product to tracker"

    assert_text "Product to tracker was successfully updated"
    click_on "Back"
  end

  test "destroying a Product to tracker" do
    visit product_to_trackers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product to tracker was successfully destroyed"
  end
end
