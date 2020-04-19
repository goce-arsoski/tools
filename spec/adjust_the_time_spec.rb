RSpec.describe Tools::AdjustTheTime do
  it 'returns correct adjusted time for normal addition' do
    time = Tools::AdjustTheTime.new("01:00:00", 1, 30, 10)
    expect(time.adjust).to eq "02:30:10"
  end

  it 'returns correct adjusted time for hrs/min/sec in range' do
    time = Tools::AdjustTheTime.new("18:22:30", 4, 60, 30)
    expect(time.adjust).to eq "23:23:00"
  end
  it 'returns correct adjusted time for hrs/min/sec out of range' do
    time = Tools::AdjustTheTime.new("00:00:00", 72, 120, 120)
    expect(time.adjust).to eq "02:02:00"
  end
end
