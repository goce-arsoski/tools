RSpec.describe Tools::Raindrops do
  it "Plong is raindrop-speak for 28" do
    raindrops = Tools::Raindrops.new(28)
    expect(raindrops.check).to eq('Plong')
  end

  it "PlingPlang is raindrop-speak for 30" do
    raindrops = Tools::Raindrops.new(30)
    expect(raindrops.check).to eq('PlingPlang')
  end

  it "in raindrop-speak for 34" do
    raindrops = Tools::Raindrops.new(34)
    expect(raindrops.check).to eq('34')
  end

  it "in raindrop-speak for 0" do
    raindrops = Tools::Raindrops.new(0)
    expect(raindrops.check).to eq('0')
  end

  it "Plang is raindrop-speak for 10" do
    raindrops = Tools::Raindrops.new(10)
    expect(raindrops.check).to eq('Plang')
  end
end