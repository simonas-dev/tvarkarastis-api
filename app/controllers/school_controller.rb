class SchoolController < ApplicationController
  
  def index
    if !is_admin()
      render :status => :forbidden, :text => "Forbidden fruit"
    else
      @school = School.find(params[:id])
    end
  end

  def save
    if !is_admin()
      render :status => :forbidden, :text => "Forbidden fruit"
    else
      school = School.find(school_params[:id])
      if school.update(school_params)
        flash[:notice] = 'Saved!'
      else
        flash[:notice] = 'Error!'
      end
      redirect_to action: "index", id: school.id
    end
  end

  def hide
    if !is_admin()
      render :status => :forbidden, :text => "Forbidden fruit"
    else
      school = School.find(params[:id])
      school.is_hidden = !school.is_hidden
      school.save!
      redirect_back fallback_location: root_path
    end
  end
  
  def delete
    if !is_admin()
      render :status => :forbidden, :text => "Forbidden fruit"
    else
      School.delete(params[:id])
      redirect_back fallback_location: root_path
    end
  end

  private

  def school_params
    params.require(:school).permit(
      :id,
      :name,
      :code,
      :address,
      :web,
      :g_place_id,
      :g_lat_lng,
      :school_type,
      :contacts,
      :is_hidden
    )
  end

end
