RSpec.describe IrohaSort::Comparator do
  let(:iroha) { "いろはにほへと ちりぬるを わかよたれそ つねならむ うゐのおくやま けふこえて あさきゆめみし ゑひもせす".gsub(/\s/,'') }

  it { expect(IrohaSort::Comparator.new(iroha)).to be_an_instance_of(IrohaSort::Comparator) }

  describe "#compare" do
    let(:comparator){ IrohaSort::Comparator.new(iroha) }
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
  end
end
