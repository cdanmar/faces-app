class ProjectsController < ApplicationController

  def user_index
    @projects = Project.all
  end

  def new
  end
  
  def create
    project = Project.new(
                          user_id: params[:user_id],
                          completed: false, 
                          current: true
                          ) 
    project.save

    redirect_to "/users/#{project.user_id}/projects/#{project.id}" 
    
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    project.assign_attributes(    
                              title: params[:title],
                              face: params[:face],
                              face_color: params[:face_color],
                              eyes: params[:eyes],
                              nose: params[:nose],
                              mouth: params[:mouth]
                              )

    project.save

    redirect_to "/users/#{project.user_id}/projects/#{project.id}"  
  end

  def delete
    project = Project.find(params[:id])
    project.destroy
    
    redirect_to '/users/#{params[:user_id]}/projects' 
  end
end