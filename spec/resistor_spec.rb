RSpec.describe Tools::Resistor do
  it 'has 1 ohm resistance' do
    rs = Tools::Resistor.new(['black', 'brown', 'black', 'gold'])
    expect(rs.resistance).to eq(1)
  end

  it 'has 12 Kohms resistance' do
    rs = Tools::Resistor.new(['red', 'black', 'green', 'gold'])
    expect(rs.resistance).to eq(2_000_000)
  end

  it 'has 2 Mohms resistance' do
    rs = Tools::Resistor.new(['red', 'black', 'green', 'gold'])
    expect(rs.resistance).to eq(2_000_000)
  end

  it 'has +/-5 % tolerance' do
    rs = Tools::Resistor.new(['red', 'black', 'green', 'gold'])
    expect(rs.tolerance).to eq(5)
  end

  it 'has +/-20 % tolerance' do
    rs = Tools::Resistor.new(['red', 'black', 'green', ''])
    expect(rs.tolerance).to eq(20)
  end

  it 'has 15 ohms and +/-5% tolerance' do
    rs = Tools::Resistor.new(['brown', 'green'])
    expect(rs.resistance).to eq(15)
  end

  it 'has 12000 ohms and +/-20% tolerance' do
    rs = Tools::Resistor.new(['brown', 'red', 'orange'])
    expected = "12000 ohms +/-20%"

    expect(rs.info).to eq(expected)
  end

  it 'has 12000 ohms and +/-5% tolerance' do
    rs = Tools::Resistor.new(['brown', 'red', 'orange', 'gold'])
    expected = "12000 ohms +/-5%"

    expect(rs.info).to eq(expected)
  end
end
