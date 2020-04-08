RSpec.describe Tools::Antipodes do
  it 'returns correct result for array with even length' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4])
    expect(antipodes.antipodes_res).to eq [2.5, 2.5]
  end

  it 'returns correct result if array has odd length' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4, 5])
    expect(antipodes.antipodes_res).to eq [3, 3]
  end

  it 'returns correct result for array with negative numbers' do
    antipodes = Tools::Antipodes.new([-1, -2])
    expect(antipodes.antipodes_res).to eq [-1.5]
  end

  it 'returns input array if contain less then two elements' do
    antipodes = Tools::Antipodes.new([3])
    expect(antipodes.antipodes_res).to eq [3]
  end

  it 'returns correct result if array has 9 elements' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    expect(antipodes.antipodes_res).to eq [5, 5, 5, 5]
  end
end
