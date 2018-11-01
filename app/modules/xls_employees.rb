class XlsEmployees < ActiveRecord::Base

  def self.create_xls_employees departments
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "Телефонный справочник"
    sheet1.pagesetup[:orientation] = :portrait
    sheet1.pagesetup[:adjust_to] = 92
    sheet1.margins[:top] = 0.1
    sheet1.margins[:left] = 0.2
    sheet1.margins[:right] = 0.2
    sheet1.margins[:bottom] = 0.1

    # sheet1.row(1).push "№ кабинета", "Отдел/ФИО", "Телефон"

    format_title_table_1 = Spreadsheet::Format.new :horizontal_align => :center, :text_wrap => true, :vertical_align => :center, :pattern => 1, :size => 16, :weight => :bold, color: :black, :pattern_fg_color => :white
    format_title_table_2 = Spreadsheet::Format.new :horizontal_align => :center, :text_wrap => true, :vertical_align => :center,  :color => :black, :pattern => 1, :border => :thin, :size => 13, :weight => :bold, :pattern_fg_color => :white

    format_body_table_1 = Spreadsheet::Format.new :horizontal_align => :center, :text_wrap => true, :vertical_align => :center, :border => :thin, :size => 13, :weight => :bold
    format_body_dep_table_1 = Spreadsheet::Format.new :horizontal_align => :left, :text_wrap => true, :vertical_align => :center, :border => :thin, :size => 12

    sheet1.column(0).width = 15
    sheet1.column(1).width = 70
    sheet1.column(2).width = 30
    sheet1.column(3).width = 22
    sheet1.row(0).height = 50
    # sheet1.row(1).height = 50
    # row_number = 1
    # column_number = 1

    sheet1.merge_cells(0, 0, 0, 2)
    sheet1[0,0] =  'Телефоны ГБУЗ КО "МИАЦ Калужской области"'
    for i in  0..2 do
      sheet1.row(0).set_format(i,format_title_table_1)
    end
    # for i in  0..2 do
    #   sheet1.row(1).set_format(i, format_title_table_2)
    # end


    row_number = 1

    departments.each do |dep|
      if dep.employees.count>0
        cabinet = dep.cabinet_number
        otdel = dep.name
        sheet1.row(row_number).push cabinet, otdel
        if otdel.length > 70
          sheet1.row(row_number).height = 30
        else
          sheet1.row(row_number).height = 20
        end
        merge_number = row_number
        sheet1.merge_cells(row_number, 1, row_number, 2)
        row_number+=1
        # sheet1.row(merge_number).height = 30

        dep.employees.each do |emp|
          sheet1.row(row_number).height = 16
          for i in  0..2 do
            sheet1.row(row_number).set_format(i, format_body_dep_table_1)
          end

          name = emp.fio
          phone_number = emp.phone_number
          sheet1.row(row_number).push '', name, phone_number
          row_number += 1
          # merge_number += 1

          sheet1.merge_cells(merge_number, 0, row_number-1, 0)
          sheet1.merge_cells(merge_number, 0, row_number-1, 0)

          for i in 0..2 do
            sheet1.row(merge_number).set_format(i, format_body_table_1)
          end



        end
      end
    end

    sheet1.row(row_number+1).push 'Для набора добавочного номера переведите телефон в режим тонального набора "*"'




    # sheet1.merge_cells(1, 0, count, 0)
    # sheet1.merge_cells(1, 1, count, 1)





    FileUtils.mkdir_p("#{Rails.root}/public/docs") unless File.directory?("#{Rails.root}/public/docs")

    export_file_path = [Rails.root, "public", "docs", "Телефонный справочник миац.xls"].join("/")
    book.write export_file_path

    folder = "public/docs"
    file_name = 'Телефонный справочник миац.xls'
    #   Dir.glob("*.xls").each do |file_name|
        # filename = File.basename(file_name.original_filename)
        # content_type = file_name.content_type
        # file_contents = file_name.read
    # Тип файла
      xls_type = File.ftype(Rails.root.join(folder,file_name))
    # Имя файла
      xls_name = File.basename(Rails.root.join(folder,file_name))
    # Открытие файла
      xls_file_open = File.open(Rails.root.join(folder,file_name))
    # Чтение файла
      xls_read = xls_file_open.read

      puts xls_read
      puts file_name
      puts xls_name
      puts xls_type
      if Document.where('lower(filename) like lower (?)', "%телефонный справочник миац.xls%").present?
        tel = Document.where('lower(filename) like lower (?)', "%телефонный справочник миац.xls%").first
        tel.update_attributes(filename: xls_name, content_type: xls_type, file_contents: xls_read, user_id: 10, document_stage_id: 11)
      else
        Document.create(filename: xls_name, content_type: xls_type, file_contents: xls_read, user_id: 10, document_stage_id: 11)
      end
      


  end

end
