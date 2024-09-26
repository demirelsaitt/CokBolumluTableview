import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var bolumler = ["Meyveler","Renkler","Mevsimler"]
    
    var bolumVerileri = [["Ayva","Elma","Muz","Armut"],
                         ["Kırmızı","Mavi","Sarı","Yeşil"],
                         ["Yaz","Bahar","Kış"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return bolumler.count //bölüm adedini belirtik
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bolumVerileri[section].count
        //her bölümün veri adedine ulaştık
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Önce cell tanımlanmalı
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucre1", for: indexPath)
        //verileri cell'e yazma aşaması section satırı row ise sutunu veriyor
        cell.textLabel?.text = bolumVerileri[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Bölümlerin başlıklarını oluşturmak için oluşturacağız.
        return bolumler[section] //sırayla bölümleri yerleştirecek
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(bolumler[indexPath.section]) bölümünden \(bolumVerileri[indexPath.section][indexPath.row])")
        
    }
}
