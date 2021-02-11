require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  test 'Message can contain characters from different languages' do
    message = Message.new(content: '新しいメッセージ or ਨਵਾਂ ਸੁਨੇਹਾ or Нова порука')

    assert message.valid?
  end

  test "Message cannot contain HTML characters" do
    message = Message.new(content: '<h1>New Message</h1>')

    assert_not message.valid?
  end

  test "Message cannot be longer than 255 characters" do
    message = Message.new(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

    assert_not message.valid?
  end

  test "Message can contain email and url links" do
    message = Message.new(content: 'test@test.com and https://www.test.com')
    
    assert message.valid?
  end

end
