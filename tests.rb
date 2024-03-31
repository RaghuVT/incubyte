require 'rspec'
require_relative 'string_calculator'

# str_obj = StringCalculator.new

# numbers_arr = ["", "1", '//a\n10a2a3']
# # numbers_arr = ["", "1", '1\n2,3']
# puts str_obj.add(numbers_arr)


describe StringCalculator do 
    context "When testing the StringCalculator class" do 
        it "add method parses empty string and provides output" do 
            str_cal = StringCalculator.new
            numbers_arr = ['']
            message = str_cal.add(numbers_arr)
            expect(message).to eq [0]
        end

        it "add method parses string with only one number" do 
            str_cal = StringCalculator.new
            numbers_arr = ['1']
            message = str_cal.add(numbers_arr)
            expect(message).to eq [1]
        end

        it "add method parses string with comma delimiter" do 
            str_cal = StringCalculator.new
            numbers_arr = ['', '1', '1,2,3']
            message = str_cal.add(numbers_arr)
            expect(message).to eq [0, 1, 6]
        end

        it "add method parses string with \\n and comma delimiter" do 
            str_cal = StringCalculator.new
            numbers_arr = ['', '1', '1\n2,3']
            message = str_cal.add(numbers_arr)
            expect(message).to eq [0, 1, 6]
        end

        it "add method parses string with delimiter 'a'" do 
            str_cal = StringCalculator.new
            numbers_arr = ['', '1', '//a\n10a2a3']
            message = str_cal.add(numbers_arr)
            expect(message).to eq [0, 1, 15]
        end

        it "add method parses string with delimiter ';'" do 
            str_cal = StringCalculator.new
            numbers_arr = ['', '1', '//;\n10;2;3']
            message = str_cal.add(numbers_arr)
            expect(message).to eq [0, 1, 15]
        end

        it "add method parses string with negative numbers and throws exception" do 
            str_cal = StringCalculator.new
            numbers_arr = ['', '-1', '//;\n-10;2;-3']
            expect { str_cal.add(numbers_arr) }.to raise_error("negative numbers not allowed -1, -10, -3")
        end
    end
end
