RSpec.describe 'Cars management', type: :request do  
  let!(:user) { User.create(name: 'Bill') }
  let!(:car) { Car.create(name: 'Passat', brand: 'VW', user: user) }

  describe 'GET /api/v1/cars' do
    it 'is protected content' do
      get '/api/v1/cars'

      expect(response.status).to eq 401
    end

    it 'returns cars list for a user with access' do
      get '/api/v1/cars', headers: { access_token: user.token }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to eq [car.attributes.slice('id', 'name', 'brand').as_json]
    end

    it 'cannot use twice same token' do
      get '/api/v1/cars', headers: { access_token: user.token }

      expect(response.status).to eq 200

      last_valid_token = response.header['Access-Token']

      get '/api/v1/cars', headers: { access_token: user.token }

      expect(response.status).to eq 401
      expect(response.header['Access-Token']).to be_nil

      get '/api/v1/cars', headers: { access_token: last_valid_token }

      expect(response.status).to eq 200
    end
  end

  describe 'POST /api/v1/cars' do
    let(:car_params) { { 'brand' => 'Honda', 'name' => 'Civic' } }

    it 'is protected content' do
      get '/api/v1/cars', params: { car: car_params }

      expect(response.status).to eq 401
    end

    it 'creates a car' do
      post '/api/v1/cars', params: { car: car_params }, headers: { access_token: user.token }

      expect(response.status).to eq 201

      new_car = JSON.parse(response.body)

      expect(new_car.slice('id', 'name', 'brand')).to eq(car_params.merge({'id' => Car.last.id}))
      expect(user.cars.count).to eq 2
    end
  end
end  
