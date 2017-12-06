import MapKit
import PlaygroundSupport

let delta = 5.0
let frame = CGRect( x:0, y:0, width:200, height:200 )
let mapView = MKMapView( frame: frame )
var region = MKCoordinateRegion()
region.center.latitude = -23.533773
region.center.longitude = -46.625290
region.span.latitudeDelta = delta
region.span.longitudeDelta = delta
mapView.setRegion( region, animated: true )

PlaygroundPage.current.liveView = mapView
