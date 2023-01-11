require 'roo'

book = Roo::Spreadsheet.open('./file_example_XLS_10.xls')

book.each(id: 'ID', name: 'FULL_NAME') do |hash|
    puts hash.inspect
    # => { id: 1, name: 'John Smith' }
  end
 