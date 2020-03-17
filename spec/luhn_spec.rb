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
  it "becomes invalid if digits reversed." do
    luhn = Tools::Luhn.new('59')
    expect(luhn.valid?).to be true
  end

  it "is valid canadian sin num" do
    luhn = Tools::Luhn.new('055 444 285')
    expect(luhn.valid?).to be true
  end

  it "is invalid canadian sin num" do
    luhn = Tools::Luhn.new('055 444 286')
    expect(luhn.valid?).to be false
  end

  it "is invalid credit card" do
    luhn = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn.valid?).to be false
  end
  it "becomes invalid with a non digit included" do
    luhn = Tools::Luhn.new('055a 444 285')
    expect(luhn.valid?).to be false
  end

  it "becomes invalid with a non digit added at the end" do
    luhn = Tools::Luhn.new('059a')
    expect(luhn.valid?).to be false
  end
  it "becomes invalid with punctuation included" do
    luhn = Tools::Luhn.new('055-444-285')
    expect(luhn.valid?).to be false
  end

  it "becomes invalid with symbols included" do
    luhn = Tools::Luhn.new('055£ 444$ 285')
    expect(luhn.valid?).to be false
  end

  it "is invalid single zero with space" do
    luhn = Tools::Luhn.new(' 0')
    expect(luhn.valid?).to be false
  end

  it "is valid more than a single zero" do
    luhn = Tools::Luhn.new('0000 0')
    expect(luhn.valid?).to be true
  end

  it "input digit 9 is correctly converted to output digit 9" do
    luhn = Tools::Luhn.new('091')
    expect(luhn.valid?).to be true
  end

  it "is invalid with non digits" do
    luhn = Tools::Luhn.new(':9')
    expect(luhn.valid?).to be false
  end
end