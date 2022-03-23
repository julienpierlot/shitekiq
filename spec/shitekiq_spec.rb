# frozen_string_literal: true

RSpec.describe Shitekiq do
  it "has a version number" do
    expect(Shitekiq::VERSION).not_to be nil
  end

  describe '.backend' do
    it 'returns an instance of Queue by default' do
      expect(described_class.backend).to be_a_kind_of(Queue)
    end
  end
end
