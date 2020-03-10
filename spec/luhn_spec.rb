RSpec.describe Tools::Luhn do
  it "doesn't allow single digit strings." do
    luhn = Tools::Luhn.new('3')
    expect(luhn.valid?).to be false
  end

  it "doesn't allow empty strings." do
    luhn = Tools::Luhn.new(' ')
    expect(luhn.valid?).to be false
  end

  it "doesn't allow single zero input." do
    luhn = Tools::Luhn.new('0')
    expect(luhn.valid?).to be false
  end

  it "remains valid if digits reversed." do
    luhn = Tools::Luhn.new('059')
    expect(luhn.valid?).to be true
  end
end