# Postsynaptic-Simulator Level Tutorial

### TableViewController
-At the end of the level array add a new element which contains level #, and the name of your level in brackets.
Example: 
  , ("Level 7", "Spatial Summation vs Decay") 
*Notice the comma to seperate the new element.

### LevelViewController
In the ViewDidLoad method add a path to your level by copying how the other levels are instantiated.
Example:

if(self.name == "Level #"){
                if let scene = Level#(fileNamed: self.name) {
                    scene.scaleMode = .aspectFill
                    levelView.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
*Replace # with your level number.            

### Level Class
-Create new Scene Class by going File > New > File > Swift File.


### Level Scene
-Create new Scene Class by going File > New > File > Spritekit Scene.
add Nodes by clicking the library button and adding empty nodes along the path (these will be invisible) 
and color nodes for the visible nodes that will be clicked on. On the right panel you can select the texture
to distuinguish inhibitory and excitatory. Give each node the naming convention Node followed by a unqiue number.
