//
//  ViewController.swift
//  MapsPins
//
//  Created by Cleís Aurora Pereira on 06/11/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var localArray = [Location]()

    @IBOutlet weak var tableView: UITableView!


    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        localArray.append(Location(name: "Churrascaria Fogo de Chão", type: "Restaurante", point: CLLocation(latitude: -23.540582, longitude: -46.621647)))
        localArray.append(Location(name: "Supermercado São Paulo", type: "Supermercado", point: CLLocation(latitude: -20.531806, longitude: -47.395917)))
//        localArray.append(Location(name: "Cantina e Pizzaria Castelões", type: "Restaurante", point: CLLocation(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)))
        localArray.append(Location(name: "Méqui 1000", type: "Restaurante", point: CLLocation(latitude: -23.560454, longitude: -46.658089)))
        localArray.append(Location(name: "Mercado Municipal de São Paulo", type: "Supermercado", point: CLLocation(latitude: -23.541446, longitude: -46.629869)))
        localArray.append(Location(name: "Vaca Verde", type: "Restaurante", point: CLLocation(latitude: -23.603459, longitude: -46.679395)))
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = localArray[indexPath.row]

        centerMapOnLocation(location: location.point.coordinate, title: location.name)
    }

    func centerMapOnLocation(location: CLLocationCoordinate2D, title: String) {
        let coordinateRegion = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(coordinateRegion, animated: false)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        self.mapView.addAnnotation(annotation)
      }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationViewCell", for: indexPath) as! LocationViewCell

        cell.setup(location: localArray[indexPath.row])
        return cell
    }


}
