require 'test_helper'

class DevicesControllerTest < ActionDispatch::IntegrationTest

  def setup
    Building.create(name: 'Wijnhaven')
    Classroom.create(building_id: 1, name: 'H4', max_persons: 3)
    Device.create(classroom_id: 1, auth: '123', name: 'Raspberry pi')
  end

  def teardown
    Building.destroy(1)
  end

  test "should not update device" do
    device = Device.find(1)
    put api_v2_device_url(device), params: { auth: '1234', temperature: '10C', humidity: 'None' }
    assert_response 401
  end

end