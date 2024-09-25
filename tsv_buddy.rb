# frozen_string_literal: true

require 'csv'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    @data = []
    CSV.parse(tsv, col_sep: "\t", headers: true) do |row|
      @data << row.to_h
    end
  end

  # Converts @data into a string in TSV format
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    return '' unless @data

    CSV.generate(col_sep: "\t") do |csv|
      csv << @data.first.keys
      @data.each do |row|
        csv << row.values
      end
    end
  end
end
