class ImagesController <ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :same_user, only: [:edit, :update, :destroy]
  
  def show
    set_current_image
  end

  def index
    @images = Image.paginate(page: params[:page], per_page: 12)
  end

  def new
    if logged_in?
      @image = Image.new
    else
      redirect_to images_path
    end
  end

  def edit
  end

  def create
    if logged_in?
      @image = Image.new(params.require(:image).permit(:title, :source, :price, :public))
      if @image.public == '2'
        @image.public = false
      end
      if @image.save
        flash[:notice] = 'Image was uploaded successfully'
        redirect_to @image
      else
        render 'new'
      end
    else
      redirect_to images_path
    end
  end

  def update
    # Had to deal with checkbox because of false being treated as null
    checkbox = params.require(:image).permit(:public)
    if checkbox == { 'public' => '2' }
      @image.public = false
      @image.save

    elsif checkbox == { 'public' => '1' }
      @image.public = true
      @image.save
    end

    if @image.update(params.require(:image).permit(:title, :source, :price, :inventory))
      flash[:notice] = 'Image was updated successfully'
      redirect_to @image
    else
      render 'edit'
    end
  end

  def destroy
    @image.destroy
    redirect_to images_path
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end
end