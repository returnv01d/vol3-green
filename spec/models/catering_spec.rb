require 'rails_helper'

# RSpec.describe Catering, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Catering, type: :model do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:city) }
	# it { should validate_presence_of(:description) }
end