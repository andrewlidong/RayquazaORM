require '00_attr_accessor_object'

describe AttrAccessorObject do
  before(:all) do
    class MyAttrAccessorObject < AttrAccessorObject
      my_attr_accessor :first, :second
    end
  end

  after(:all) do
    Object.send(:remove_const, :MyAttrAccessorObject)
  end

  subject(:object) { MyAttrAccessorObject.new }

  describe '#my_attr_accessor' do
    it 'defines getter methods' do
      expect(object).to respond_to(:first)
      expect(object).to respond_to(:second)
    end

    it 'defines setter methods' do
      expect(object).to respond_to(:first=)
      expect(object).to respond_to(:second=)
    end

    it 'getter methods get from associated instance variables' do
      first_val = 'value of @first'
      second_val = 'value of @second'
      object.instance_variable_set('@first', first_val)
      object.instance_variable_set('@second', second_val)

      expect(object.first).to eq(first_val)
      expect(object.second).to eq(second_val)
    end

    it 'setter methods set associated instance variables' do
      first_val = 'value of @first'
      second_val = 'value of @second'
      object.first = first_val
      object.second = second_val

      expect(object.instance_variable_get('@first')).to eq(first_val)
      expect(object.instance_variable_get('@second')).to eq(second_val)
    end
  end
end
