RSpec.describe Tools::Antipodes do
  it 'return corect result' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4])
    expect(antipodes.division_by_two).to eq([2.5, 2.5])
  end

  it 'return corect result with odd number' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4, 5])
    expect(antipodes.division_by_two).to eq([3, 3])
  end

  it 'return corect result with negative numbers ' do
    antipodes = Tools::Antipodes.new([-1, -2])
    expect(antipodes.division_by_two).to eq([-1.5])
  end
end
