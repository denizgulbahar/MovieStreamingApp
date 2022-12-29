import Foundation

public class WebServices {
    

    
     public func fetchUpComingMovies() {
         let helper = Helpers(apiKey: "2b643c1d6283f863eb41ab72877a3da4", baseURL: "https://api.themoviedb.org/3/discover/movie", type:"now_playing")
       
          let url = URL(string: "\(helper.baseURL)\(helper.type)?api_key=\(helper.apiKey)")
        
        guard let url = url else {
            return
        }
            
        URLSession.shared.dataTask(with: url) {  data,response,error in
            
            if error != nil || data == nil {
                print("Hata")
                return
            }
            do {
            /*
            let cevap = try JSONDecoder().decode(Kategorilercevap.self, from: data!)
            
            if let gelenKategoriler = cevap.kategoriler {
                
                self.filmKategoriler = gelenKategoriler
            }
            
            DispatchQueue.main.async {
                self.TableViewKategoriler.reloadData()
            }
            
            */
                
            } catch {
                print(error.localizedDescription)
            }
            
        } .resume()
    }
    
}
