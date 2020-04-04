RSpec.describe Tools::Antipodes do
  it 'returns correct result' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4])
    expect(antipodes.division_by_two).to eq [2.5, 2.5]
  end

  it 'returns correct result with odd number' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4, 5])
    expect(antipodes.division_by_two).to eq [3, 3]
  end

  it 'returns correct result with negative numbers' do
    antipodes = Tools::Antipodes.new([-1, -2])
    expect(antipodes.division_by_two).to eq [-1.5]
  end

  it 'returns input array if contain less then two elements' do
    antipodes = Tools::Antipodes.new([3])
    expect(antipodes.division_by_two).to eq [3]
  end
end
