require 'test_helper'

class EventControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get startDate:date" do
    get :startDate:date
    assert_response :success
  end

  test "should get endDate:date" do
    get :endDate:date
    assert_response :success
  end

  test "should get startTime:time" do
    get :startTime:time
    assert_response :success
  end

  test "should get endTime:time" do
    get :endTime:time
    assert_response :success
  end

  test "should get supporter_id:integer" do
    get :supporter_id:integer
    assert_response :success
  end

end
