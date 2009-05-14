class SingleFieldInlineEditController < ApplicationController

  def index
    @items = Item.find(:all)
  end
  
  def edit
    @item = Item.find(params[:id])
    
    render :update do |page|
      page.replace_html "inline-editing-#{@item.id}", :partial => 'edit', :locals => { :item => @item }
    end
  end
  
  
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    
    render :update do |page|
      page.replace_html "inline-editing-#{@item.id}", :partial => 'show', :locals => { :item => @item }
      page.visual_effect :highlight, "inline-editing-#{@item.id}"
    end
    
  end
  
end
