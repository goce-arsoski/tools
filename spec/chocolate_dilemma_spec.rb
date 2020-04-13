RSpec.describe Tools::ChocolateDilemma do
  it 'is the total area of chocolate same for each person' do
    nestle = Tools::ChocolateDilemma.new([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]])
    expect(nestle.fairness?).to be true
  end

  it 'is the total area of chocolate same for each person with one element' do
    nestle = Tools::ChocolateDilemma.new([[4]], [[4]])
    expect(nestle.fairness?).to be true
  end

  it 'is the total area of chocolate same for each person with more than 2 elements in array' do
    nestle = Tools::ChocolateDilemma.new([[4, 3, 2], [1, 2]], [[4, 2], [3, 1, 2], [1, 2, 2, 3]])
    expect(nestle.fairness?).to be true
  end
end
