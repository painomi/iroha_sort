# frozen_string_literal: true

require_relative "iroha_sort/version"
require_relative "iroha_sort/comparator"

module IrohaSort
  class Error < StandardError; end

  def sort(iroha, targets)
    iroha_comparator= IrohaSort::Comparator.new(iroha)
    targets.sort{|a, b| iroha_comparator.compare(a, b)}
  end
  module_function :sort
end
