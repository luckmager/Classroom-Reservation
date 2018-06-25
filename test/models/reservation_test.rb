require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  def setup
    Building.create(name: 'Wijnhaven')
    Classroom.create(building_id: 1, name: 'H4', max_persons: 3)
    User.create(email: '0861020@hr.nl', password: 'Test1324')
  end

  def teardown
    Building.destroy(1)
    User.destroy(1)
    @reservations = Reservation.all
    @reservations.each do |reservation|
      Reservation.destroy(reservation.id)
    end
  end

  test "should book reservation" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = Date.today.beginning_of_week.strftime("%Y-%m-%d")
    reservation.title = 'Test title'
    reservation.description = 'Test description'
    reservation.from_block = 1
    reservation.to_block = 3
    assert reservation.save
  end

  test "should not save reservation without title" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = Date.today.beginning_of_week.strftime("%Y-%m-%d")
    reservation.description = 'Test description'
    reservation.from_block = 1
    reservation.to_block = 3
    assert !reservation.save
  end

  test "should not save reservation without description" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = Date.today.beginning_of_week.strftime("%Y-%m-%d")
    reservation.title = 'Test title'
    reservation.from_block = 1
    reservation.to_block = 3
    assert !reservation.save
  end

  test "should not save reservation when to_block is before from_block" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = Date.today.beginning_of_week.strftime("%Y-%m-%d")
    reservation.title = 'Test title'
    reservation.description = 'Test description'
    reservation.from_block = 4
    reservation.to_block = 3
    assert !reservation.save
  end

  test "should not save reservation date is in the past" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = '02-04-2017'
    reservation.title = 'Test title'
    reservation.description = 'Test description'
    reservation.from_block = 1
    reservation.to_block = 3
    assert !reservation.save
  end

  test "should not save reservation date is too far in the future" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = '02-04-2019'
    reservation.title = 'Test title'
    reservation.description = 'Test description'
    reservation.from_block = 1
    reservation.to_block = 3
    assert !reservation.save
  end

  test "should book reservation not book when there is already an reservation on that date and block" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = Date.today.beginning_of_week.strftime("%Y-%m-%d")
    reservation.title = 'Test title'
    reservation.description = 'Test description'
    reservation.from_block = 1
    reservation.to_block = 3
    assert reservation.save

    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = Date.today.beginning_of_week.strftime("%Y-%m-%d")
    reservation.title = 'Test title'
    reservation.description = 'Test description'
    reservation.from_block = 1
    reservation.to_block = 3
    assert !reservation.save
  end

  test "should book reservation not book when the date is invalid" do
    reservation = Reservation.new
    reservation.user_id = 1
    reservation.classroom_id = 1
    reservation.date = 'Invalid date'
    reservation.title = 'Test title'
    reservation.description = 'Test description'
    reservation.from_block = 1
    reservation.to_block = 3
    assert !reservation.save
  end

end
