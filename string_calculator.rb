class StringCalculator
	def add(numbers)
		added_numbers = []
		negative_numbers = []
		numbers.each do |num|
			delimiters = get_delimiters(num)
			num = num.gsub('\n', delimiters[0])
			added_num = 0
			num.split(Regexp.union(delimiters)).each do |split_num|
				split_num_int = split_num.to_i

				next if split_num_int > 1000
				negative_numbers << split_num_int if split_num_int < 0
				added_num += split_num_int
			end
			added_numbers << added_num
		end

		raise "negative numbers not allowed #{negative_numbers.join(', ')}" if negative_numbers.any? 

		return added_numbers
	end

	private

	def get_delimiters(num)
		num_chars = num.split('')

		if (num_chars.length > 5 && num_chars[0] == '/' && num_chars[1] == '/')
			delimiters = []

			delimiter = ''
			num_chars[2..-1].each_with_index do |char, ind|
				delimiter += char

				if num_chars[ind+3] == '\\' && num_chars[ind+4] == 'n'
					delimiters << delimiter
					break
				elsif num_chars[ind+3] != char
					delimiters << delimiter
					delimiter = ''
				end
			end
			return delimiters
		else
			return [',']
		end
	end
end