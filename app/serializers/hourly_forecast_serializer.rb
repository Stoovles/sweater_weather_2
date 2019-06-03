class HourlyForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time,
             :temperature
             
end
