class ContactsController < ApplicationController

  before_filter :require_user

  # GET /Contacts
  # GET /Contacts.json
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /Contacts/1
  # GET /Contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /Contacts/new
  # GET /Contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /Contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /Contacts
  # POST /Contacts.json
  def create
    @contact = Contact.new(params[:Contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Contacts/1
  # PUT /Contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:Contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Contacts/1
  # DELETE /Contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to Contacts_url }
      format.json { head :ok }
    end
  end
end