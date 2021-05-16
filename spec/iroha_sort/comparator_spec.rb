RSpec.describe IrohaSort::Comparator do
  let(:iroha) { "いろはにほへと ちりぬるを わかよたれそ つねならむ うゐのおくやま けふこえて あさきゆめみし ゑひもせす".gsub(/\s/,'') }

  it { expect(IrohaSort::Comparator.new(iroha)).to be_an_instance_of(IrohaSort::Comparator) }

  describe "#compare" do
    let(:comparator){ IrohaSort::Comparator.new(iroha) }

    it "第1引数と第2引数が同じなら0" do
      expect(comparator.compare('い', 'い')).to eq(0)
    end

    it "第1引数が大きいなら1" do
      expect(comparator.compare('い', 'ろ')).to eq(-1)
    end

    it "第2引数が大きいなら-1" do
      expect(comparator.compare('ろ', 'い')).to eq(1)
    end
  end
end
