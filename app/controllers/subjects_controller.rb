class SubjectsController < ApplicationController
  
  layout "admin"
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count + 1
    
  end
  
  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    
    # Save the object
    if @subject.save
      
      flash[:notice] = "Subject created successfully."
      
      # If save succeeds, redirect to the index action
      redirect_to(:action => 'index')
      
      # If save fails, redispaly the form so the user can fix problems
    else
      @subject_count = Subject.count + 1
      render('new')
    end
    
      
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
  
  def update
     # Find an existing object using form parameters
     @subject = Subject.find(params[:id])
     
     # Update the object
     if @subject.update_attributes(subject_params)
       
       flash[:notice] = "Subject updated successfully."

       # If save succeeds, redirect to the index action
       redirect_to(:action => 'show', :id => @subject.id)

       # If save fails, redispaly the form so the user can fix problems
     else
       @subject_count = Subject.count
       render('edit')
     end

   end

  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    subject = Subject.find(params[:id]).destroy
    
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully."
    
    redirect_to(:action => 'index')
  end
  
  private

     def subject_params
       # same as using "params[:subject]", except that it:
       # - raises an error if :subject is not present
       # - allows listed attributes to be mass-assigned
       params.require(:subject).permit(:name, :position, :visible)
     end

  
end

  
