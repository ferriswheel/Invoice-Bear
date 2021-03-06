class InvoicesController < ApplicationController

  before_filter :require_user, :except => [:client_show]
 

  # GET /invoices
  # GET /invoices.json

  
  def index
    @invoices = Invoice.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    
    if @invoice.user_id != current_user.id
		flash[:error] = "you do not have access here"
		redirect_to(:action => 'index') and return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
      format.pdf { render :layout => false }
    end
  end
  
  def client_show
    @invoice = Invoice.find(params[:invoice_id])
    
    respond_to do |format|
      format.html { render :layout => false }#client_show.html.erb
      format.pdf { render :layout => false }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new

    1.times do
      item = @invoice.items.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def send_invoice_notification
    
    @i = Invoice.find(params[:invoice_id])
    

    # Tell the InvoiceMailer to send a notification email
      InvoiceMailer.invoice_notification(@i).deliver
      
    invoice = @i
    invoice.update_attributes(:status => "sent")
    invoice.save!
    
    
    respond_to do |format|
        format.html { redirect_to "/invoices", notice: "Invoice notification was successfully sent to your contact!" }
        format.json
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def dashboard
    @invoices = Invoice.where(:user_id => current_user.id)
    @owed = @invoices.outstanding.each.sum {|i| i.total }
    @billed = @invoices.each.sum {|i| i.total }
    @received = @billed - @owed
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :ok }
    end
  end
end
