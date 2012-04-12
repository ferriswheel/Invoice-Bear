# Title
pdf.text "Invoice ##{@invoice.number.to_s}", :size => 25

# contact info
pdf.text @invoice.contact.fname + " " + @invoice.contact.lname
pdf.text @invoice.contact.bname
pdf.text @invoice.contact.address
pdf.text @invoice.contact.city + ", " + @invoice.contact.state + " " + @invoice.contact.zip.to_s


#pdf.draw_text "#{@invoice.created_at}", :at => [pdf.bounds.width / 2, pdf.bounds.height - 30]

# Our company info
pdf.float do
  pdf.bounding_box [0, pdf.bounds.top - 5], :width => pdf.bounds.width do
    pdf.text @invoice.created_at.to_s(:simple), :size => 20, :align => :right
  end
end

pdf.move_down 40

# Items
header = [('Description'),('Quantity'),('Unit Cost'),('Discount'),('Total')]
items = @invoice.items.collect do |item|
  [item.description, item.quantity, number_to_currency(item.unit_cost), item.discount.to_s + '%', number_to_currency(item.total_price)]
end

pdf.table items, :border_style => :grid, 
                 :headers => header, 
                 :width => pdf.bounds.width, 
                 :row_colors => %w{cccccc eeeeee},
                 :align => { 0 => :right, 1 => :left, 2 => :right, 3 => :right, 4 => :right }

pdf.move_down 10

# Total
pdf.text "Total: #{number_to_currency(@invoice.total)}", :style => :bold, :align => :right, :size => 20


# Terms
#if @invoice.terms != ''
 # pdf.move_down 20
  #pdf.text t('.terms'), :size => 18
  #pdf.text @invoice.terms
#end

# Notes
#if @invoice.notes != ''
 # pdf.move_down 20
  #pdf.text t('.notes'), :size => 18
  #pdf.text @invoice.notes
#end

# Footer
pdf.draw_text "Powered by InvoiceBear", :at => [0, 0]