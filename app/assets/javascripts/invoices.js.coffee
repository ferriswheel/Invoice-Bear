# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


update_price = (elem) ->
  context = (if $(elem).parent().parent()[0].tagName is "TD" then $(elem).parent().parent().parent() else $(elem).parent().parent())
  quantity = $(".invoice_quantity", context).val()
  unit_cost = $(".invoice_unit_cost", context).val()
  discount = $(".invoice_discount", context).val()
  quantity = (if isNaN(quantity) then 0 else quantity)
  unit_cost = (if isNaN(unit_cost) then 0 else unit_cost)
  discount = (if isNaN(discount) then 0 else discount)
  $(".invoice_item_total", context).html "$ " + (quantity * unit_cost * (1 - (discount / 100.0)))
$(".invoice_quantity").live "keyup", ->
  update_price this

$(".invoice_unit_cost").live "keyup", ->
  update_price this

$(".invoice_discount").live "keyup", ->
  update_price this