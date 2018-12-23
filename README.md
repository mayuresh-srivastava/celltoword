# README

1. git clone https://github.com/mayureshmayur/celltoword
2. cd celltoword
3. bundle
4. gem install bundler(if getting: can't find gem bundler (>= 0.a) (Gem::GemNotFoundException))
5. ruby phone_number_to_words.rb <ten_digit_phone_number_excluding_zero_and_one>
6. To run tests:
	a. rspec spec/phone_number_converter_tests.rb (to run all tests)
	b. rspec spec/phone_number_converter_tests.rb:8 (to run a test at a particular line, e.g. line number 8)
