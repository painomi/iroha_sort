RSpec.describe IrohaSort::Comparator do
  let(:iroha) { "いろはにほへと ちりぬるを わかよたれそ つねならむ うゐのおくやま けふこえて あさきゆめみし ゑひもせす".gsub(/\s/,'') }

  it { expect(IrohaSort::Comparator.new(iroha)).to be_an_instance_of(IrohaSort::Comparator) }

  let(:comparator){ IrohaSort::Comparator.new(iroha) }
  describe "#compare" do
    subject { comparator.compare(a, b) }

    context "1文字" do
      context "第1引数と第2引数が同じなら" do
        let(:a){'い'}; let(:b){'い'}
        it { is_expected.to eq 0 }
      end

      context "第1引数が大きいなら" do
        let(:a){'ろ'}; let(:b){'い'}
        it { is_expected.to eq 1 }
      end

      context "第2引数が大きいなら" do
        let(:a){'い'}; let(:b){'ろ'}
        it { is_expected.to eq -1 }
      end
    end

    context "2文字以上" do
      context "同じ文字列" do
        let(:a){'いろはにおへと'}
        let(:b){'いろはにおへと'}
        it { is_expected.to eq 0 }
      end

      context "先頭部分一致は長い方が大きい" do
        let(:a){'いろは'}
        let(:b){'いろはにおへと'}
        it { is_expected.to eq -1 }
      end

      context "長さが違っても先頭から比較" do
        let(:a){'ろいは'}
        let(:b){'いろはにおへと'}
        it { is_expected.to eq 1 }
      end
    end

    context "空文字列は一番小さい" do
      let(:a){''}; let(:b){'す'}
      it { is_expected.to eq -1 }
    end

    context "いろはにない文字があるなら" do
      let(:a){'ん'}; let(:b){''}
      it { is_expected.to eq nil }
    end
  end

  describe "#comparable?" do
    subject { comparator.comparable?(str) }

    context "いろはにある文字だけなら" do
      let(:str){ 'いろは' }
      it { is_expected.to be_truthy }
    end

    context "いろはにない文字があったら" do
      let(:str){ 'ABC' }
      it { is_expected.to be_falsy }
    end
  end
end
