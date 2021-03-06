require 'rubygems'
require 'rubyXL'

describe RubyXL::NumberFormat do

  describe '.is_date_format?' do
    it 'should return true if number format = dd// yy// mm' do
      RubyXL::NumberFormat.new(:num_fmt_id => 1, :format_code => 'dd// yy// mm').is_date_format?().should == true
    end  

    it 'should return true if number format = DD// YY// MM (uppercase)' do
      RubyXL::NumberFormat.new(:num_fmt_id => 1, :format_code => 'DD// YY// MM').is_date_format?().should == true
    end  

    it 'should return false if number format = @' do
      RubyXL::NumberFormat.new(:num_fmt_id => 1, :format_code => '@').is_date_format?().should == false
      RubyXL::NumberFormat.new(:num_fmt_id => 1, :format_code => 'general').is_date_format?().should == false
      RubyXL::NumberFormat.new(:num_fmt_id => 1, :format_code => '0.00e+00').is_date_format?().should == false
    end  

    it 'should properly detect date formats amongst default ones' do
      all_formats = RubyXL::NumberFormatContainer::DEFAULT_NUMBER_FORMATS.number_formats
      id_list = all_formats.collect { |fmt| fmt.num_fmt_id if fmt.is_date_format? }.compact.sort
      id_list.should == [14, 15, 16, 17, 18, 19, 20, 21, 22, 45, 46, 47]
    end

  end

end
