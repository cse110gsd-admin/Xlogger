class UsersController < ApplicationController
<<<<<<< HEAD
  before_filter :authenticate, :only => [:edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update, :destroy]
  # "Edit" and "Account Management" are the same.


=======
>>>>>>> 26757e2a401091b80e8352c264b191333628db9b
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
    @title = @user.name
=======
>>>>>>> 26757e2a401091b80e8352c264b191333628db9b

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
<<<<<<< HEAD
    @title = "Sign up"
    @user = User.new

  #  respond_to do |format|
   #   format.html # new.html.erb
   #   format.xml  { render :xml => @user }
   # end
=======
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
>>>>>>> 26757e2a401091b80e8352c264b191333628db9b
  end

  # GET /users/1/edit
  def edit
<<<<<<< HEAD
    @title = "Edit user"
=======
    @user = User.find(params[:id])
>>>>>>> 26757e2a401091b80e8352c264b191333628db9b
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
<<<<<<< HEAD
    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to(@user, :notice => 'Registration successful!') }
=======

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
>>>>>>> 26757e2a401091b80e8352c264b191333628db9b
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
<<<<<<< HEAD
        format.html { redirect_to(@user, :notice => 'Account info updated.') }
        format.xml  { head :ok }
      else
        @title = "Edit user"
=======
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
>>>>>>> 26757e2a401091b80e8352c264b191333628db9b
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
<<<<<<< HEAD
      format.html { redirect_to(root_path, :notice => 'Account deleted.') }
      format.xml  { head :ok }
    end
  end


  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end


=======
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
>>>>>>> 26757e2a401091b80e8352c264b191333628db9b
end
