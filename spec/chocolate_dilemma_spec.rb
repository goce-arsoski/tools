RSpec.describe Tools::ChocolateDilemma do
  it 'is same total area of chocolate for each person' do
    nestle = Tools::ChocolateDilemma.new([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]])
    expect(nestle.fairness?).to be true
  end

  it 'is same total area of chocolate for each person' do
    nestle = Tools::ChocolateDilemma.new([[4, 3], [2, 1]], [[1, 2], [3, 4]])
    expect(nestle.fairness?).to be true
  end
  
end
