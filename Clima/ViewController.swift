//
//  ViewController.swift
//  Clima
//
//  Created by Caio on 04/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    var city: String?
    var response: Response?
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minmaxLabel: UILabel!
    @IBOutlet weak var feelslikeLabel: UILabel!
    @IBOutlet weak var idImage: UIImageView!
    @IBOutlet weak var backgroundLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundLabel.layer.masksToBounds = true
        self.backgroundLabel.layer.cornerRadius = 30
        
        let response: () = JSONdownload(){ (response) in
          DispatchQueue.main.async { [self] in
              
              cityLabel.text = response.name
              
              // temperatureLabel
              var temperatura = String(format: "%.0f",response.main.temp - 273.15)
              temperatureLabel.text = "\(temperatura)°C"
              
              // minmaxLabel
              var min = String(format: "%.0f",response.main.temp_min - 273.15)
              var max = String(format: "%.0f",response.main.temp_max - 273.15)
              minmaxLabel.text = "Minimal: \(min)°C Maximal: \(max)°C"
              
              // feelslikeLabel
              var feelslike = String(format: "%.0f",response.main.feels_like - 273.15)
              feelslikeLabel.text = "feels like: \(feelslike)°C"
              
              // descriptionLabel
              descriptionLabel.text = "\(response.weather![0].main), \(response.weather![0].description)"
              
              //idImage
              var id = response.weather![0].id
              if id >= 200 && id <= 232{
                  idImage.image = UIImage(named: "thunderstorm")
              }
              else if id >= 300 && id <= 321{
                  idImage.image = UIImage(named: "showerrain")
              }
              else if id >= 520 && id <= 531{
                  idImage.image = UIImage(named: "showerrain")
              }
              else if id >= 500 && id <= 504{
                  idImage.image = UIImage(named: "rain")
              }
              else if id == 511{
                  idImage.image = UIImage(named: "snow")
              }
              else if id >= 600 && id <= 622{
                  idImage.image = UIImage(named: "snow")
              }
              else if id >= 701 && id <= 781{
                  idImage.image = UIImage(named: "snow")
              }
              else if id == 800{
                  idImage.image = UIImage(named: "sun")
              }
              else if id == 802{
                  idImage.image = UIImage(named: "cloudstwo")
              }
              else if id == 803{
                  idImage.image = UIImage(named: "cloudsthree")
              }
              else if id == 804{
                  idImage.image = UIImage(named: "cloudsthree")
              }
              else{
                  idImage.image = UIImage(named: "clouds")
              }
          }
          
            
        }
      }
        
        // Do any additional setup after loading the view.
    
    
      
    func JSONdownload(completion: @escaping(Response) -> Void) {
        
        guard let url = URL(string: ("https://api.openweathermap.org/data/2.5/weather?appid=b8809c1e58fc1eb37467250b3f34742d&q=" + city!).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
          if let error = error {
            print("Error fetching movies: \(error.localizedDescription)")
          }
          
          guard let jsonData = data else { return }
          
          let decoder = JSONDecoder()
          
          do {
            let decodedData = try decoder.decode(Response.self, from: jsonData)
            completion(decodedData)
          } catch {
            print("Error decoding data.")
          }
          
        }
        
        dataTask.resume()
      }
      
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


