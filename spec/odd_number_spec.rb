RSpec.describe Tools::OddNumber do
  it 'returns the first integer (5) who appears odd number of times' do
    odd = Tools::OddNumber.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expect(odd.first_odd_number).to eq 5
  end

  it 'returns all integers ([5, 1]) who appears odd number of times' do
    odd = Tools::OddNumber.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expect(odd.all_odd_numbers).to eq [5, -1]
  end

  it 'returns first integer (the only one) for array with one element' do
    odd = Tools::OddNumber.new([10])
    expect(odd.first_odd_number).to eq 10
  end

  it 'returns all integers (the only one) for array with one element' do
    odd = Tools::OddNumber.new([10])
    expect(odd.all_odd_numbers).to eq [10]
  end
end
