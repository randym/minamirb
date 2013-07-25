# encoding: UTF-8
class Post < ActiveRecord::Base
  #attr_accessible :content, :name, :title
  validates :name,  :presence => true
  validates :title, :presence => true,
    :length => { :minimum => 5 }

  has_many :comments
  default_scope include: :comments

  acts_as_xlsx

  def self.xlsx_report
    package = Post.to_xlsx
    chart_color =  %w(88F700, 279CAC, B2A200, FD66A3, F20062, C8BA2B, 67E6F8, DFFDB9, FFE800, B6F0F8)
    header_style = { :bg_color => "00", :fg_color => "FF", :alignment => { :horizontal => :center }, :bold => true }
    bordered = package.workbook.styles.add_style(:border => Axlsx::STYLE_THIN_BORDER)
    header_xf = package.workbook.styles.add_style header_style
    package.workbook.worksheets.first.tap do |sheet|
      sheet.row_style 0, header_xf
      sheet.row_style (1..-1), bordered
      sheet.add_chart(Axlsx::Pie3DChart, :title => "コメント獲得") do |chart|
        chart.add_series :data => sheet.cols[3][(1..-1)], :labels => sheet.cols[0][(1..-1)], :colors => chart_color
        chart.start_at 2, sheet.rows.size
        chart.end_at 3, sheet.rows.size + 20 
      end
    end
    package.to_stream.read
  end
end
