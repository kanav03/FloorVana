import SpriteKit

class D3FloorPlanScene: SKScene {
    private var floorPlanNode: SKSpriteNode?
    private var lastScale: CGFloat = 1.0
    private var initialScale: CGFloat = 1.0
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        // Set up the grid background
        createGridBackground()
        
        // Load the floor plan image (make sure "floorplan" exists in your assets)
        let floorPlan2 = SKSpriteNode(imageNamed: "b")
        floorPlan2.position = CGPoint(x: frame.midX, y: frame.midY)
        floorPlan2.setScale(1.0)  // Initial scale
        addChild(floorPlan2)
        self.floorPlanNode = floorPlan2  // Assign to the floorPlanNode property
        
        // Enable multiple touch for gestures
        view.isMultipleTouchEnabled = true
    }
    
    // Function to create a grid-like background
    private func createGridBackground() {
        let gridTexture = SKTexture(imageNamed: "grid") // Load grid texture from assets
        let backgroundNode = SKSpriteNode(texture: gridTexture)
        
        // Scale and position the background to cover the scene
        backgroundNode.size = self.size
        backgroundNode.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundNode.zPosition = -1  // Ensure the background is behind other nodes
        
        addChild(backgroundNode)
    }
    
    // Handle pinch gestures for zooming
    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let floorPlan2 = floorPlanNode else { return }
        
        if gesture.state == .began {
            initialScale = floorPlan2.xScale
            lastScale = gesture.scale
        }
        
        // Calculate the scale delta and apply it to the floor plan node
        let scale = gesture.scale
        let deltaScale = scale / lastScale
        lastScale = scale
        
        let newScale = floorPlan2.xScale * deltaScale
        // Limit zoom range to prevent over-zooming or excessive shrinking
        if newScale >= 0.5 && newScale <= 3.0 {
            floorPlan2.setScale(newScale)
        }
    }
    
    // Handle pan gestures for moving the floor plan
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let floorPlan2 = floorPlanNode else { return }
        
        // Translate the gesture movement to node position changes
        let translation = gesture.translation(in: gesture.view)
        let newPosition = CGPoint(
            x: floorPlan2.position.x + translation.x,
            y: floorPlan2.position.y - translation.y  // Invert Y axis for SKScene
        )
        
        floorPlan2.position = newPosition
        gesture.setTranslation(.zero, in: gesture.view)
    }
}
