RSpec.describe Tools::PokemonDamageCalculator do
  it "returns correct result for types 'fire' and 'water'" do
    pokemon = Tools::PokemonDamageCalculator.new("fire", "water", 100, 100)
    expect(pokemon.calculate_damage).to eq 25
  end

  it "returns correct result for types 'grass' and 'fire'" do
    pokemon = Tools::PokemonDamageCalculator.new("grass", "fire", 35, 5)
    expect(pokemon.calculate_damage).to eq 175
  end

  it "returns correct result for types 'electric' and 'fire'" do
    pokemon = Tools::PokemonDamageCalculator.new("electric", "fire", 100, 100)
    expect(pokemon.calculate_damage).to eq 50
  end

  it "is not very effective for type against itself 'electric' and 'electric'" do
    pokemon = Tools::PokemonDamageCalculator.new("electric", "electric", 100, 100)
    expect(pokemon.effectiveness).to eq 0.5
  end
end
