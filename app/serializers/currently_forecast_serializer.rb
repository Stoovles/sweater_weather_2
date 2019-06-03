class CurrentlyForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time,
             :summary,
             :icon,
             :temperature,
             :apparentTemperature,
             :humidity,
             :visibility,
             :uvIndex,
             :futureSummary,
             :temperatureHigh,
             :temperatureLow

     
end
