require 'byebug'
module PhoneNumberConverter

  @number_to_word_mapping = {
    2 => %w(a b c),
    3 => %w(d e f),
    4 => %w(g h i),
    5 => %w(j k l),
    6 => %w(m n o),
    7 => %w(p q r s),
    8 => %w(t u v),
    9 => %w(w x y z)
  }

  @dictionary_content = File.readlines('dictionary.txt').map{ |word| word.strip }

  # Checks word existence in the dictionary
  def self.word_exists? word
    upc_word = word.upcase
    search_word = @dictionary_content.bsearch{ |x| x >= upc_word }
    search_word == upc_word
  end

  # Convert phone number to array of words. The element will be a whole word.
  def self.phone_number_to_word phone_number
    word_combinations = nil
    phone_number.each_char do |character|
      codes = @number_to_word_mapping[character.to_i]
      raise "Invalid character #{character} in the phone number" if codes.nil?
      if word_combinations
        word_combinations = word_combinations.product(codes)
      else
        word_combinations = codes
      end
    end if phone_number
    test_words = word_combinations.map { |word| word.flatten().join } if word_combinations
    test_words.select! { |word| word_exists?(word) } if test_words
  end

  # Convert phone number to array of elements. The element can be one word or word pair.
  def self.phone_number_to_words phone_number
    last = phone_number.dup
    first = ''
    full_phone_number_words = phone_number_to_word(phone_number)
    all_words = full_phone_number_words

    while last.length > 3 do
      first += last.slice!(0)
      next if first.length < 3
      first_words = phone_number_to_word(first)
      last_words = phone_number_to_word(last)

      if first_words.length > 0 && last_words.length > 0
        combinations = first_words.product(last_words)
        all_words += combinations
      end if first_words && last_words

      # remove full phone number words from all words pairs
      all_words.select!{ |word| !full_phone_number_words.include?(word[0]+word[1]) } if all_words
    end if last
    all_words
  end
end
