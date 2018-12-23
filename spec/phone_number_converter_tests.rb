require_relative '../lib/phone_number_converter'

RSpec.describe PhoneNumberConverter do
  it 'should return following combinations for 6686787825' do
    expect(PhoneNumberConverter.phone_number_to_words('6686787825')).to match_array([['motor', 'usual'],['noun', 'struck'], ['nouns', 'truck'], ['nouns', 'usual'], ['onto', 'struck'], 'motortruck'])
  end

  it 'should return following combinations for 2282668687' do
    expect(PhoneNumberConverter.phone_number_to_words('2282668687')).to match_array([['act', 'amounts'],['act', 'contour'], ['acta', 'mounts'], ['bat', 'amounts'], ['bat', 'contour'], ['cat', 'contour'], 'catamounts'])
  end

  it 'should raise runtime error for 2345678912' do
    expect(PhoneNumberConverter.phone_number_to_words('2345678912')).to raise_error(RuntimeError)
  end
end
