require 'json'
require './lib/iroha_sort.rb'

def lambda_handler(event:, context:)
  iroha= context['iroha']
  targets= context['targets']
  result= {
    iroha: iroha,
    targets: targets,
    sorted: IrohaSort.sort(iroha, targets)
  }

  { statusCode: 200, body: JSON.generate(result) }
end
