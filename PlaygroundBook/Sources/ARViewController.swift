//
//  ARViewController.swift
//  Book_Sources
//
//  Created by Alexander Zank on 19.03.19.
//

import UIKit
import ARKit
import SceneKit

@objc(Book_Sources_ARViewController)
class ARViewController: UIViewController, ARSCNViewDelegate {
  
  // MARK: - Properties
  
  // Outlets
  @IBOutlet weak var sceneView: ARSCNView!
  
  // User-input
  let cardImage: UIImage = #imageLiteral(resourceName: "Test.jpeg")
  
  
  // MARK - Controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Make this controller the delegate for scene view
    sceneView.delegate = self
    // Set up dynamic lighting
    sceneView.autoenablesDefaultLighting = true
    sceneView.automaticallyUpdatesLighting = true
    // Instantiate a new SCNScene
    let scene = SCNScene()
    // Pesent the scene
    sceneView.scene = scene
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Instantiate a session configuration
    let config = ARWorldTrackingConfiguration()
    config.planeDetection = .horizontal
    // Start the AR session
    sceneView.session.run(config, options: [])
  }
  
  
  // MARK: - ARSCNViewDelegate
  
  func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    // Ignore all anchors except for planes
    guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
    // Create the plane to visualize the node using its position and extent
    let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
    let planeNode = SCNNode(geometry: plane)
    planeNode.isHidden = true
    planeNode.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
    // Rotate the planeNode to a horizontal position
    planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
    // Add the planeNode to ARKit's root node
    node.addChildNode(planeNode)
  }
  
  func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
    // Ignore all anchors except for planes
    guard let planeAnchor = anchor as? ARPlaneAnchor,
      // Get the associated planeNode with its plane child
      let planeNode = node.childNodes.first,
      let plane = planeNode.geometry as? SCNPlane else { return }
    // Update planeNode's position
    planeNode.position = SCNVector3(
      CGFloat(planeAnchor.center.x), 0, CGFloat(planeAnchor.center.z)
    )
    // Update plane's size
    plane.width = CGFloat(planeAnchor.extent.x)
    plane.height = CGFloat(planeAnchor.extent.z)
  }
  
  
  // MARK: - Actions
  
  @IBAction func placeCard(_ sender: BottomButton) {
    // Do a hit test for the center of the viewport
    let hitTestResults = sceneView.hitTest(sceneView.center, types: .existingPlaneUsingExtent)
    // Check whether there was a hit
    guard let hitTestResult = hitTestResults.first else {
      return
    }
    // Compute the needed translation
    let transform = hitTestResult.worldTransform
    var translate: float3 {
      let delta = transform.columns.3
      return float3(delta.x, delta.y, delta.z)
    }
    // Create the cardNode
    let card = SCNPlane(width: 0.1, height: 0.15)
    card.materials.first?.diffuse.contents = cardImage
    let cardNode = SCNNode(geometry: card)
    cardNode.position = SCNVector3(translate.x, translate.y, translate.z)
    // Rotate the planeNode around x to a horizontal position and around y to face the camera
    guard let currentFrame = sceneView.session.currentFrame else { return }
    cardNode.eulerAngles = SCNVector3(-Float.pi / 2, currentFrame.camera.eulerAngles.y, 0)
    // Add it to the composition
    sceneView.scene.rootNode.addChildNode(cardNode)
  }
  
  
  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
  }
  
}
