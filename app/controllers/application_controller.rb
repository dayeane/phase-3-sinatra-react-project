class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Trips
  get "/trips" do
    Trip.all.to_json
  end

  get "/trips/:id" do
    Trip.find(params[:id]).to_json(include: { hotels: { include: { cost: {} }},
                                              providers: { include: {cost: {} }},
                                              costs: {}})
  end

  post "/trips" do
    trip = Trip.create(params[:trip])
    if trip
      trip.to_json(include: { hotels: { include: { cost: {} }},
        providers: { include: {cost: {} }},
        costs: {}})
    end
  end

  put "/trips/:id" do
    Trip.find(params[:id]).update(params[:trip])
    Trip.find(params[:id]).to_json(include: { costs: {}})
  end

  delete "/trips/:id" do
    Trip.find(params[:id]).delete().to_json
  end

  #hotels
  get "/trips/:trip_id/hotels" do
    Trip.find(params[:trip_id]).hotels.to_json(include: :cost)
  end

  get "/trips/:trip_id/hotels/:id" do
    Trip.find(params[:trip_id]).hotels.find(params[:id]).to_json(include: :cost)
  end

  post "/trips/:trip_id/hotels" do
    # { trip_id: "1",
    #   hotel: { check_in: Date.today, check_out: Date.tomorrow, location: "tampa"}
    #   cost: "100"
    # }
    trip = Trip.find(params[:trip_id])
    hotel = trip.hotels.create(params[:hotel])
    if hotel
      hotel.create_cost(amount: params[:cost], trip: trip)
      trip.hotels.to_json(include: :cost)
    end
  end

  put "/trips/:trip_id/hotels/:id" do
    # { trip_id: "1",
    #   id: "1"
    #   hotel: { check_in: Date.today, check_out: Date.tomorrow, location: "tampa"}
    # }
    Trip.find(params[:trip_id]).hotels.find(params[:id]).update(params[:hotel]).to_json
  end

  delete "/trips/:trip_id/hotels/:id" do
    # { trip_id: "1",
    #   id: "1" }
    if Trip.find(params[:trip_id]).hotels.find(params[:id]).delete()
      Trip.find(params[:trip_id]).hotels.to_json(include: :cost)
    end
  end

  #providers
  get "/trips/:trip_id/providers" do
    Trip.find(params[:trip_id]).providers.all.to_json(include: :cost)
  end

  get "/trips/:trip_id/providers/:id" do
    Trip.find(params[:trip_id]).providers.find(params[:id]).to_json(include: :cost)
  end

  post "/trips/:trip_id/providers" do
    trip = Trip.find(params[:trip_id])

    provider = trip.providers.create(params[:provider])
    if provider
      provider.create_cost(amount: params[:cost], trip: trip)
      trip.providers.to_json(include: :cost)
    end
  end

  put "/trips/:trip_id/providers/:id" do
    Trip.find(params[:trip_id]).providers.find(params[:id]).update(params[:provider]).to_json
  end

  delete "/trips/:trip_id/providers/:id" do
    if Trip.find(params[:trip_id]).providers.find(params[:id]).delete()
      Trip.find(params[:trip_id]).providers.to_json(include: :cost)
    end
  end
  
  #stops
  get "/trips/:trip_id/stops" do
    Trip.find(params[:trip_id]).stops.to_json(include: :cost)
  end

  get "/trips/:trip_id/stops/:id" do
    Trip.find(params[:trip_id]).stops.find(params[:id]).to_json(include: :cost)
  end

  post "/trips/:trip_id/stops" do
    trip = Trip.find(params[:trip_id])
    stop = trip.stops.create(params[:stop])
    if stop
      stop.create_cost(amount: params[:cost], trip: trip)
      trip.stops.to_json(include: :cost)
    end
  end

  put "/trips/:trip_id/stops/:id" do
    Trip.find(params[:trip_id]).stops.find(params[:id]).update(params[:stop]).to_json
  end

  delete "/trips/:trip_id/stops/:id" do
    if Trip.find(params[:trip_id]).stops.find(params[:id]).delete()
      Trip.find(params[:trip_id]).stops.to_json(include: :cost)
    end
  end
end
