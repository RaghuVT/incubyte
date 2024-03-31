class StringCalculator
	def add(numbers)
		added_numbers = []
		numbers.each do |num|
			delimiter = get_delimiter(num)
			num = num.gsub('\n', delimiter)
			added_num = 0
			num.split(delimiter).each do |split_num|
				added_num += split_num.to_i
			end
			added_numbers << added_num
		end

		return added_numbers
	end

	private

	def get_delimiter(num)
		num_chars = num.split('')

		if (num_chars.length > 5 && num_chars[0] == '/' && num_chars[1] == '/' && num_chars[3] == '\\' && num[4] == 'n')
			return num_chars[2]
		else
			return ","
		end
	end
end
