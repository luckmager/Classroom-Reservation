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

	def get_start_hours
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

	def get_end_hours
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

	def get_reservation_date_hours(date, hour)
		reservations = Reservation.where(classroom_id: params[:id], date: date)
		if reservations.length == 0
			return "None"
		else
			reservations.each do |reservation|
				if (hour..hour).overlaps?(reservation.from..reservation.to)
					if reservation.from == hour
						return reservation.title + " start, " + reservation.user.email + ", "
					elsif reservation.to == hour
						return reservation.title + " end, " + reservation.user.email + ""
					else
						return reservation.title + " busy, " + reservation.user.email + ""
					end
				else
					return "none"
				end
			end
		end
	end
end
