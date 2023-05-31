require "test_helper"

class PseudosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pseudo = pseudos(:one)
  end

  test "should get index" do
    get pseudos_url
    assert_response :success
  end

  test "should get new" do
    get new_pseudo_url
    assert_response :success
  end

  test "should create pseudo" do
    assert_difference("Pseudo.count") do
      post pseudos_url, params: { pseudo: { description: @pseudo.description, image: @pseudo.image, name: @pseudo.name, user_id: @pseudo.user_id } }
    end

    assert_redirected_to pseudo_url(Pseudo.last)
  end

  test "should show pseudo" do
    get pseudo_url(@pseudo)
    assert_response :success
  end

  test "should get edit" do
    get edit_pseudo_url(@pseudo)
    assert_response :success
  end

  test "should update pseudo" do
    patch pseudo_url(@pseudo), params: { pseudo: { description: @pseudo.description, image: @pseudo.image, name: @pseudo.name, user_id: @pseudo.user_id } }
    assert_redirected_to pseudo_url(@pseudo)
  end

  test "should destroy pseudo" do
    assert_difference("Pseudo.count", -1) do
      delete pseudo_url(@pseudo)
    end

    assert_redirected_to pseudos_url
  end
end
