RSpec.describe Tools::Allergies do
  describe "determine whether or not they're allergic to a given item" do
    it 'matches the allergen with the score' do
      allergies = Tools::Allergies.new(1)
      expect(allergies.allergic_to?('eggs')).to be true
    end

    it 'does not match the allergen with the score' do
      allergies = Tools::Allergies.new(1)
      expect(allergies.allergic_to?('peanuts')).to be false
    end

    it 'matches multiple allergens with one score' do
      allergies = Tools::Allergies.new(3)
      expect(allergies.allergic_to?('eggs')).to be true
      expect(allergies.allergic_to?('peanuts')).to be true
    end
  end

  it 'is allergic to peanuts and chocolate' do
    allergies = Tools::Allergies.new(34)
    expect(allergies.allergic_to?('peanuts')).to be true
    expect(allergies.allergic_to?('chocolate')).to be true
  end

  it 'is invalid score for allergens (i.e. 256, 512, 1024, etc.)' do
    allergies = Tools::Allergies.new(1024)
    expect(allergies.overscore).to be false
  end

  it 'is valid score for allergens' do
    allergies = Tools::Allergies.new(257)
    expect(allergies.allergic_to?('eggs')).to be true
  end

  it 'is allergic to all allergens' do
    allergies = Tools::Allergies.new(255)
    expect(allergies.allergic_to?('eggs')).to be true
    expect(allergies.allergic_to?('peanuts')).to be true
    expect(allergies.allergic_to?('shellfish')).to be true
    expect(allergies.allergic_to?('strawberries')).to be true
    expect(allergies.allergic_to?('tomatoes')).to be true
    expect(allergies.allergic_to?('chocolate')).to be true
    expect(allergies.allergic_to?('pollen')).to be true
    expect(allergies.allergic_to?('cats')).to be true
  end
end