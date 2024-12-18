require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup    
    @order = orders(:one)
    @doctor = users(:one) 
    @user = users(:two)   
  end

  test "should create message when user is a doctor" do
    sign_in @doctor
    assert_difference 'Message.count', 1 do
      post order_messages_path(@order), params: {
        message: { message: "Hello from doctor", order_id: @order.id }
      }
    end
    assert_response :success
    message = Message.last
    assert_equal @doctor, message.doctor
    assert_nil message.user
  end

  test "should create message when user is not a doctor" do
    sign_in @user
    assert_difference 'Message.count', 1 do
      post order_messages_path(@order), params: {
        message: { message: "Hello from user", order_id: @order.id }
      }
    end
    assert_response :success
    message = Message.last
    assert_equal @user, message.user
    assert_nil message.doctor
  end

  test "should not create message with invalid parameters" do
    sign_in @user
    assert_no_difference 'Message.count' do
      post order_messages_path(@order), params: {
        message: { message: "", order_id: @order.id }
      }
    end
    assert_response :success
  end
end
