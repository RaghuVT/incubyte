require 'rspec'
require_relative 'string_calculator'

describe StringCalculator do 
    context "When testing the StringCalculator class" do
        str_cal = StringCalculator.new
        it "add method parses empty string and provides output" do
            numbers_arr = ['']
            expect(str_cal.add(numbers_arr)).to eq [0]
        end

        it "add method parses string with only one number" do
            numbers_arr = ['1']
            expect(str_cal.add(numbers_arr)).to eq [1]
        end

        it "add method parses string with comma delimiter" do
            numbers_arr = ['', '1', '1,2,3']
            expect(str_cal.add(numbers_arr)).to eq [0, 1, 6]
        end

        it "add method parses string with \\n and comma delimiter" do
            numbers_arr = ['', '1', '1\n2,3']
            expect(str_cal.add(numbers_arr)).to eq [0, 1, 6]
        end

        it "add method parses string with delimiter 'a'" do
            numbers_arr = ['', '1', '//a\n10a2a3']
            expect(str_cal.add(numbers_arr)).to eq [0, 1, 15]
        end

        it "add method parses string with delimiter ';'" do
            numbers_arr = ['', '1', '//;\n10;2;3']
            expect(str_cal.add(numbers_arr)).to eq [0, 1, 15]
        end

        it "add method parses string with negative numbers and throws exception" do
            numbers_arr = ['', '-1', '//;\n-10;2;-3']
            expect { str_cal.add(numbers_arr) }.to raise_error("negative numbers not allowed -1, -10, -3")
        end

        it "add method ignores numbers greater than 1000" do
            numbers_arr = ['', '1001', '//;\n10000;2;30']
            expect(str_cal.add(numbers_arr)).to eq [0, 0, 32]
        end

        it "add method parses string with multiple characters delimiter" do
            numbers_arr = ['', '1', '//***\n10***3***2']
            expect(str_cal.add(numbers_arr)).to eq [0, 1, 15]
        end

        it "add method parses string with multiple single character delimiters" do
            numbers_arr = ['', '1', '//*%\n10%3*2']
            expect(str_cal.add(numbers_arr)).to eq [0, 1, 15]
        end

        it "add method parses string with multiple delimiters having multiple characters" do
            numbers_arr = ['', '1', '//**%%%\n10%%%2**3**1%%%2']
            expect(str_cal.add(numbers_arr)).to eq [0, 1, 18]
        end
    end
end
