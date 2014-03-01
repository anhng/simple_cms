class PagesController < ApplicationController
  
  layout false
  
  # Add index definition
  def index
    @pages = Page.sorted
  end

  def show
    @pages = Page.find(params[:id])
  end

  def new
    @pages = Page.new({:name => "Page Title"})
  end

  def create
    @pages = Page.new(page_pagrams)
    if @page.save
        flash[:notice] = "Page created succesfully!"
        redirect_to(:action => 'index')
    else
      render('new')
  end

  def edit
    @pages = Page.find(params[:id])
  end

  def update
    @pages = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully!"
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id]).destroy
    flash[:notice] = "Page destroyed successfully!"
    redirect_to(:action => 'index')
  end
  
  private

      def page_params
        # same as using "params[:subject]", except that it:
        # - raises an error if :subject is not present
        # - allows listed attributes to be mass-assigned
        params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
      end
  
  
end