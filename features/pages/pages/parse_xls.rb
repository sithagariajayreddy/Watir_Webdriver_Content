class ParseXls
  def initialize
    (ENV_VER =='2') ?
        @work_sheet = Spreadsheet.open(File.join(File.absolute_path('../../..', File.dirname(__FILE__)),"resource","Expected_content_3.0.xls")):
        @work_sheet = Spreadsheet.open(File.join(File.absolute_path('../../..', File.dirname(__FILE__)),"resource","Expected_content_2.0.xls"))
  end

  def   get_sheet_by_name(sheet_name)
    @work_sheet.worksheets.each do |sheet|
      if sheet.name == sheet_name
        return sheet
      end
    end
  end

  def read_sheet(sheet_name)
    sheet_array=Array.new
    sheet_name.each do |row|
        row.each do |cell|
          sheet_array << cell
        end
    end
    sheet_array
  end

  def get_sheet(sheet_name)
    sheet_name_obj = self.get_sheet_by_name(sheet_name)
    self.read_sheet(sheet_name_obj)
  end
end
