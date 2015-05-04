

public class WeatherHelper {
    
    func getWeather(cityAndState: String) -> WeatherData {
        
        let query = "select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"\(cityAndState)\")"
        
        var result = JSON(YQL.query(query))
        
        let response = result["query"]["results"]["channel"]
        let temperate = response["item"]["condition"]["temp"].stringValue
        let condition = response["item"]["condition"]["text"].stringValue
        
        var data = WeatherData()
        data.condition = condition
        data.temperature = temperate
        data.location = cityAndState
        
        return data
    }
    
}