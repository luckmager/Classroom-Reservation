module ClassroomsHelper
	def buildings_for_select
		Building.all.collect { |building| [building.name, building.id] }
	end
	
	def generate_qr(text)
		require 'barby'
		require 'barby/barcode'
		require 'barby/barcode/qr_code'
		require 'barby/outputter/png_outputter'

		barcode = Barby::QrCode.new(text, level: :q, size: 5)
		base64_output = Base64.encode64(barcode.to_png({ xdim: 5 }))
		"data:image/png;base64,#{base64_output}"
	end

	def current_week
		date = Date.today.beginning_of_week
		return (date..date + 4.days).to_a
	end

	def next_week
		date = Date.today.beginning_of_week + 7.days
		return (date..date + 4.days).to_a
	end

	def get_hours(block)
		case block
		when 1
			return "8:30 - 9:20"
		when 2
			return "9:20 - 10:10"
		when 3
			return "10:30 - 11:20"
		when 4
			return "11:20 - 12:10"
		when 5
			return "12:10 - 13:00"
		when 6
			return "13:00 - 13:50"
		when 7
			return "13:50 - 14:40"
		when 8
			return "15:00 - 15:50"
		when 9
			return "15:50 - 16:40"
		when 10
			return "17:00 - 17:50"
		when 11
			return "17:50 - 18:40"
		when 12
			return "18:40 - 19:30"
		when 13
			return "19:30 - 20:20"
		when 14
			return "20:20 - 21:10"
		when 15
			return "21:10 - 22:00"
		else
			return "Out of range"
		end
	end

	def get_start_hours(block)
		case block
		when 1
			return "8:30"
		when 2
			return "9:20"
		when 3
			return "10:30"
		when 4
			return "11:20"
		when 5
			return "12:10"
		when 6
			return "13:00"
		when 7
			return "13:50"
		when 8
			return "15:00"
		when 9
			return "15:50"
		when 10
			return "17:00"
		when 11
			return "17:50"
		when 12
			return "18:40"
		when 13
			return "19:30"
		when 14
			return "20:20"
		when 15
			return "21:10"
		else
			return "Out of range"
		end
	end

	def get_end_hours(block)
		case block
		when 1
			return "9:20"
		when 2
			return "10:10"
		when 3
			return "11:20"
		when 4
			return "12:10"
		when 5
			return "13:00"
		when 6
			return "13:50"
		when 7
			return "14:40"
		when 8
			return "15:50"
		when 9
			return "16:40"
		when 10
			return "17:50"
		when 11
			return "18:40"
		when 12
			return "19:30"
		when 13
			return "20:20"
		when 14
			return "21:10"
		when 15
			return "22:00"
		else
			return "Out of range"
		end
	end

	def get_reservation(date, hour)
		reservations = Reservation.where(classroom_id: params[:id], date: date)
		if reservations.length == 0
			return no_reservation(date, hour)
		elsif check_reservation(reservations, hour) != ''
			return check_reservation(reservations, hour)
		else
			return no_reservation(date, hour)
		end
	end

	def no_reservation(date, hour)
		return "<div onclick='showReservationForm(this)' class='dayHour empty' data-date-type='#{date}' data-block-type='#{hour}'>None</div>"
	end

	def check_reservation(reservations, hour)
		reservationString = ''
		reservations.each do |reservation|
			if (hour..hour).overlaps?(reservation.from_block..reservation.to_block)
				if reservation.from_block == hour
					reservationString = "<div class='dayHour start #{is_my_reservation(reservation.user_id)}'>#{is_my_or_admin_reservation(reservation.user_id, reservation)} #{reservation.title}<br />#{reservation.description}<br />#{reservation.user.try(:email)}</div>"
				elsif reservation.to_block == hour
					reservationString = "<div class='dayHour end #{is_my_reservation(reservation.user_id)}'> <br /></div>"
				else
					reservationString = "<div class='dayHour busy #{is_my_reservation(reservation.user_id)}'> <br /></div>"
				end
			end
		end
		return reservationString
	end

	def is_my_or_admin_reservation(user_id, reservation)
			if current_user && (current_user.id == user_id || current_user.role == 2)
				return link_to reservation_path(reservation), method: :delete, data: { confirm: 'Are you sure?' } do
            image_tag "delete.png", class: "action"
				end
			end
	end

	def is_my_reservation(user_id)
		if current_user && current_user.id == user_id
			return 'myReservation'
		end
	end

	def get_availability(classroom)
		block = get_current_block
		reservation = Reservation.where("classroom_id = ? AND from_block <= ? AND to_block >= ? AND date = ?", classroom.id, block, block, Time.now.strftime("%Y-%m-%d"))
		if reservation.length == 0
			return '<div class="classroomFree">Currently free</div>'
		else
			return '<div class="classroomTaken">Currently taken</div>'
		end
	end

	def get_current_block
		hour = Time.now.hour
		minutes = Time.now.min
		time = hour*100 + minutes

		case time
		when 830..920
			return 1
		when 920..1010
			return 2
		when 1010..1120
			return 3
		when 1120..1210
			return 4
		when 1210..1300
			return 5
		when 1300..1350
			return 6
		when 1350..1440
			return 7
		when 1440..1550
			return 8
		when 1550..1640
			return 9
		when 1700..1750
			return 10
		when 1750..1840
			return 11
		when 1840..1930
			return 12
		when 1930..2020
			return 13
		when 2020..2110
			return 14
		when 2110..2200
			return 15
		else
			return 1
		end
	end

end
