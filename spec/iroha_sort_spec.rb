# frozen_string_literal: true

RSpec.describe IrohaSort do
  it "has a version number" do
    expect(IrohaSort::VERSION).not_to be nil
  end

  describe "IrohaSort.sort" do
    it "いろはソート" do
      iroha= "いろはにほへと ちりぬるを わかよたれそ つねならむ うゐのおくやま けふこえて あさきゆめみし ゑひもせす".gsub(/\s/,'')
      targets=  ["いさわ", "かわかみ", "かわむら", "すかい", "ふくら", "やまもと", "わたなへ"]
      expected= ["いさわ", "わたなへ", "かわかみ", "かわむら", "やまもと", "ふくら", "すかい"]
      expect(IrohaSort.sort(iroha, targets)).to eq expected
    end
  end
end
