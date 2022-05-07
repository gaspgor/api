class CrudModel
  def index(data, params)
    render json: data
  end

  def show(data)
    render json: data
  end

  def create(data)
    if data.save
      render json: data, status: :created, location: data
    else
      render json: data.errors, status: :unprocessable_entity
    end
  end

  def update(data, params)
    if data.update(params)
      render json: data
    else
      render json: data.errors, status: :unprocessable_entity
    end
  end

  def destroy(data)
    data.destroy
  end
end