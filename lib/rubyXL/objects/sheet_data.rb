require 'rubyXL/objects/ooxml_object'
require 'rubyXL/objects/simple_types'
require 'rubyXL/objects/text'
require 'rubyXL/objects/formula'

module RubyXL

  # http://www.schemacentral.com/sc/ooxml/e-ssml_v-1.html
  class CellValue < OOXMLObject
    define_attribute(:_, :string, :accessor => :value)
    define_element_name 'v'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_c-2.html
  class Cell < OOXMLObject
    define_attribute(:r,   :ref)
    define_attribute(:s,   :int,    :accessor => :style_index)
    define_attribute(:t,   RubyXL::ST_CellType, :accessor => :datatype, :default => 'n', )
    define_attribute(:cm,  :int)
    define_attribute(:vm,  :int)
    define_attribute(:ph,  :bool)
    define_child_node(RubyXL::Formula,   :accessor => :formula)
    define_child_node(RubyXL::CellValue, :accessor => :value_container) 
    define_child_node(RubyXL::RichText)    # is
    define_element_name 'c'

    def index_in_collection
      r.col_range.begin
    end

    def row
      r && r.first_row
    end

    def row=(v)
      self.r = RubyXL::Reference.new(v, column || 0)
    end

    def column
      r && r.first_col
    end

    def column=(v)
      self.r = RubyXL::Reference.new(row || 0, v)
    end

    def raw_value
      value_container && value_container.value
    end

    def raw_value=(v)
      self.value_container ||= RubyXL::CellValue.new
      value_container.value = v
    end

    def value(args = {})
      return raw_value if args[:raw]
      case datatype
      when RubyXL::Cell::SHARED_STRING then
        workbook.shared_strings_container[raw_value.to_i]
      else 
        if is_date? then workbook.num_to_date(raw_value.to_i)
        elsif raw_value.is_a?(String) && (raw_value =~ /^-?\d+(\.\d+(?:e[+-]\d+)?)?$/i) # Numeric
          if $1 then raw_value.to_f
          else raw_value.to_i
          end
        else raw_value
        end
      end
    end

    include LegacyCell
  end

#TODO#<row r="1" spans="1:1" x14ac:dyDescent="0.25">

  # http://www.schemacentral.com/sc/ooxml/e-ssml_row-1.html
  class Row < OOXMLObject
    define_attribute(:r,            :int)
    define_attribute(:spans,        :string)
    define_attribute(:s,            :int)
    define_attribute(:customFormat, :bool,  :default => false)
    define_attribute(:ht,           :float)
    define_attribute(:hidden,       :bool,  :default => false)
    define_attribute(:customHeight, :bool,  :default => false)
    define_attribute(:outlineLevel, :int,   :default => 0)
    define_attribute(:collapsed,    :bool,  :default => false)
    define_attribute(:thickTop,     :bool,  :default => false)
    define_attribute(:thickBot,     :bool,  :default => false)
    define_attribute(:ph,           :bool,  :default => false)
    define_child_node(RubyXL::Cell, :collection => true, :accessor => :cells)
    define_element_name 'row'

    attr_accessor :worksheet

    def index_in_collection
      r - 1
    end

    def [](ind)
      cells[ind]
    end

    def size
      cells.size
    end

    def insert_cell_shift_right(c, col_index)
      cells.insert(col_index, c)
      col_index.upto(cells.size) { |col|
        cell = cells[col]
        next if cell.nil?
        cell.column = col
      }
    end

    def delete_cell_shift_left(col_index)
      cells.delete_at(col_index)
      col_index.upto(cells.size) { |col|
        cell = cells[col]
        next if cell.nil?
        cell.column = col
      }
    end

    def xf
      @worksheet.workbook.cell_xfs[self.s || 0]
    end

    def get_fill_color
      @worksheet.workbook.get_fill_color(xf)
    end

    def get_font
      @worksheet.workbook.fonts[xf.font_id]
    end
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_sheetData-1.html
  class SheetData < OOXMLObject
    define_child_node(RubyXL::Row, :collection => true, :accessor => :rows)
    define_element_name 'sheetData'

    def [](ind)
      rows[ind]
    end

    def size
      rows.size
    end

  end

end
