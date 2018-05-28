module ClassroomsHelper
	def buildings_for_select
		Building.all.collect { |b| [b.name, b.id] }
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
end
