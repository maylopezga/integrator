class WelcomeController < ApplicationController
  def index
    @tutor = 'Efrain, Mayerli & Santiago'
    @limite = 5
    @mensaje = 'rails'
    @nombre = params[:nombre_user]
    @pass = params[:pas]
    @nombres = Tool.all
    @ejemplo = Tool.create({nombre: @nombre})

  end
end
