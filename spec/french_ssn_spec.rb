require_relative '../french_ssn'
# signature -> name, args, returns
# signature -> french_ssn_info(ssn), return a desc string

describe '#french_ssn_info' do
  it 'should return "The number is invalid" when given an empty string' do
    actual = french_ssn_info("")
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it 'should return "The number is invalid" when given an invalid number' do
    actual = french_ssn_info("123")
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it 'should convert a valid number to a descriptive string' do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end

  it 'should convert a valid number to a descriptive string' do
    actual = french_ssn_info("299017645108946")
    expected = "a woman, born in January, 1999 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end

