require 'test_helper'

class AdmeafitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admeafit = admeafits(:one)
  end

  test "should get index" do
    get admeafits_url
    assert_response :success
  end

  test "should get new" do
    get new_admeafit_url
    assert_response :success
  end

  test "should create admeafit" do
    assert_difference('Admeafit.count') do
      post admeafits_url, params: { admeafit: { code: @admeafit.code, name: @admeafit.name } }
    end

    assert_redirected_to admeafit_url(Admeafit.last)
  end

  test "should show admeafit" do
    get admeafit_url(@admeafit)
    assert_response :success
  end

  test "should get edit" do
    get edit_admeafit_url(@admeafit)
    assert_response :success
  end

  test "should update admeafit" do
    patch admeafit_url(@admeafit), params: { admeafit: { code: @admeafit.code, name: @admeafit.name } }
    assert_redirected_to admeafit_url(@admeafit)
  end

  test "should destroy admeafit" do
    assert_difference('Admeafit.count', -1) do
      delete admeafit_url(@admeafit)
    end

    assert_redirected_to admeafits_url
  end
end
