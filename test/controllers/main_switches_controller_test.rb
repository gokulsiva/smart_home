require 'test_helper'

class MainSwitchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_switch = main_switches(:one)
  end

  test "should get index" do
    get main_switches_url
    assert_response :success
  end

  test "should get new" do
    get new_main_switch_url
    assert_response :success
  end

  test "should create main_switch" do
    assert_difference('MainSwitch.count') do
      post main_switches_url, params: { main_switch: { control: @main_switch.control } }
    end

    assert_redirected_to main_switch_url(MainSwitch.last)
  end

  test "should show main_switch" do
    get main_switch_url(@main_switch)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_switch_url(@main_switch)
    assert_response :success
  end

  test "should update main_switch" do
    patch main_switch_url(@main_switch), params: { main_switch: { control: @main_switch.control } }
    assert_redirected_to main_switch_url(@main_switch)
  end

  test "should destroy main_switch" do
    assert_difference('MainSwitch.count', -1) do
      delete main_switch_url(@main_switch)
    end

    assert_redirected_to main_switches_url
  end
end
