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
    luhn = Tools::Luhn.new('3')
    expect(luhn.valid?).to be false
  end

  it "doesn't allow letter input." do
    luhn = Tools::Luhn.new('-No')
    expect(luhn.valid?).to be false
  end

  it "remains valid if digits reversed." do
    luhn = Tools::Luhn.new('059')
    expect(luhn.valid?).to be true
  end

  it "becomes invalid if digits reversed." do
    luhn = Tools::Luhn.new('59')
    expect(luhn.valid?).to be false
  end

  it "is a valid canadian sin." do
  luhn = Tools::Luhn.new('055 444 285')
  expect(luhn.valid?).to be true
  end

  it "is an invalid canadian sin." do
    luhn = Tools::Luhn.new('055 444 286')
    expect(luhn.valid?).to be false
  end

  it "is an invalid credit card." do
    luhn = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn.valid?).to be false
  end

  it "is a valid strings with a non digit included become invalid." do
    luhn = Tools::Luhn.new('055a 444 285')
    expect(luhn.valid?).to be false
  end

  it "is a valid strings with a non digit added at the end become invalid." do
    luhn = Tools::Luhn.new('059a')
    expect(luhn.valid?).to be false
  end

  it "is a valid strings with punctuation included become invalid." do
    luhn = Tools::Luhn.new('055-444-285')
    expect(luhn.valid?).to be false
  end

  it "is a valid strings with symbols included become invalid." do
    luhn = Tools::Luhn.new('055£ 444$ 285')
    expect(luhn.valid?).to be false
  end
  
  it "is a single zero with space is invalid." do
    luhn = Tools::Luhn.new(' 0')
    expect(luhn.valid?).to be false
  end

  it "is valid with more than a single zero." do
    luhn = Tools::Luhn.new('0000 0')
    expect(luhn.valid?).to be true
  end

  it "is on input digit 9 correctly converted to output digit 9." do
    luhn = Tools::Luhn.new('091')
    expect(luhn.valid?).to be true
  end

  it "strings with non digits is invalid." do
    luhn = Tools::Luhn.new(':9')
    expect(luhn.valid?).to be false
  end
end