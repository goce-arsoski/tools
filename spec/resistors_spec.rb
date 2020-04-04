RSpec.describe Tools::Resistors do
  it 'has 15 ohms without multiplier' do
    rs = Tools::Resistors.new(['brown', 'green'])
    expect(rs.resistance).to eq(15)
  end

  it 'has 15 ohms with multiplier' do
    rs = Tools::Resistors.new(['brown', 'green', 'black'])
    expect(rs.resistance).to eq(15)
  end

  it 'has 2700000 ohms resistance and +/- 1% tolerance' do
    rs = Tools::Resistors.new(['red', 'violet', 'green', 'brown'])
    expected = "2700000 ohms +/- 1%"

    expect(rs.specification).to eq expected
  end

  it 'has 12000 ohms and +/- 20% tolerance without tolerance' do
    rs = Tools::Resistors.new(['brown', 'red', 'orange'])
    expected = "12000 ohms +/- 20%"

    expect(rs.specification).to eq expected
  end

  it 'has 12000 ohms and +/- 5% tolerance' do
    rs = Tools::Resistors.new(['brown', 'red', 'orange', 'gold'])
    expected = "12000 ohms +/- 5%"

    expect(rs.specification).to eq expected
  end
end
