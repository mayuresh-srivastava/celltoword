require_relative 'lib/phone_number_converter'
require 'benchmark'
puts PhoneNumberConverter.phone_number_to_words(ARGV[0])
puts Benchmark.measure { PhoneNumberConverter.phone_number_to_words(ARGV[0]) }
