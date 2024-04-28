class DirectorsController < ApplicationController

  def index
    render({ :template => "director_templates/list" })
  end 

  def show

    the_id = params.fetch("the_id")
    matching_records = Director.where({ :id => the_id })
    @the_director = matching_records.at(0)
    render({ :template => "director_templates/details" })
  end
  
 
  def junior
    youngest_date = Director.where.not({ :dob => nil }).maximum(:dob)
    @youngest_name = Director.where.not({ :dob => nil }).where({:dob => youngest_date}).all.at(0).name
    @youngest_id = Director.where.not({ :dob => nil }).where({:dob => youngest_date}).all.at(0).id

    parsed_date = Date.parse(youngest_date.to_s)
    @formatted_date = parsed_date.strftime('%B %d, %Y')

    render({ :template => "director_templates/youngest" })
  end


  def senior
    eldest_date = Director.where.not({ :dob => nil }).minimum(:dob)
    @eldest_name = Director.where.not({ :dob => nil }).where({:dob => eldest_date}).all.at(0).name
    @eldest_id = Director.where.not({ :dob => nil }).where({:dob => eldest_date}).all.at(0).id

    parsed_date = Date.parse(eldest_date.to_s)
    @formatted_date = parsed_date.strftime('%B %d, %Y')

    render({ :template => "director_templates/eldest"})
  end

end  
