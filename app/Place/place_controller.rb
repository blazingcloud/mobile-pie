require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'lib/pie'
require 'lib/script'

class PlaceController < Rho::RhoController
  include BrowserHelper


  def go
    name = @params['id']

    pie = $pie
    puts "pie = #{pie.inspect}"
    puts "id = #{name}"
    if pie
      pie.current_place(name) unless name.nil?
      puts "current place name is #{pie.current_place.name}"
      puts "current place is #{pie.current_place.description}"
      if pie.current_place.nil?
         puts "--- skip out"; return
      end
      puts "current links are #{pie.current_place.paths.inspect}"
      puts "displaying template: #{pie.template.inspect}"
      #erb pie.template, {}, {:pie => pie}
      @pie = pie
    else
      puts "NO PIE! AAAAAH!"
    end
  end
  
  #GET /Place
  def index
    @places = Place.find(:all)
    render
  end

  # GET /Place/{1}
  def show
    @place = Place.find(@params['id'])
    if @place
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Place/new
  def new
    @place = Place.new
    render :action => :new
  end

  # GET /Place/{1}/edit
  def edit
    @place = Place.find(@params['id'])
    if @place
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Place/create
  def create
    @place = Place.create(@params['place'])
    redirect :action => :index
  end

  # POST /Place/{1}/update
  def update
    @place = Place.find(@params['id'])
    @place.update_attributes(@params['place']) if @place
    redirect :action => :index
  end

  # POST /Place/{1}/delete
  def delete
    @place = Place.find(@params['id'])
    @place.destroy if @place
    redirect :action => :index
  end
end
