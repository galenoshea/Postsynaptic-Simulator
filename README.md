# Postsynaptic-Simulator Level Tutorial

## TableViewController
* Navigate to tableViewController Class. Append the level number and level name to the end of level array.

  , ("Level #", "Level Name")
  
*Notice the comma to separate the new element.

<img width="1087" alt="screen shot 2018-10-22 at 2 56 01 pm" src="https://user-images.githubusercontent.com/23369633/47312546-a4efdc00-d60a-11e8-8d62-0bb908ed7d60.png">


## LevelViewController
* In the ViewDidLoad method add a path to your level by following how the other levels are instantiated. Change only the numbers that apply to your level class.

<img width="583" alt="screen shot 2018-10-22 at 3 00 51 pm" src="https://user-images.githubusercontent.com/23369633/47312794-4e36d200-d60b-11e8-8daf-facab246f97f.png">


## Level Class
* Create new Scene Class by going File > New > File > Swift File.
* Copy the code from the image below. Change and add attributes as you see fit.

<img width="1139" alt="screen shot 2018-10-22 at 3 02 33 pm" src="https://user-images.githubusercontent.com/23369633/47312885-89390580-d60b-11e8-94b2-6617ce469b1d.png">

## Level Scene
* Create new Scene Class by going File > New > File > Spritekit Scene.
* add Nodes by clicking the library button (circle with a square inside on top right of screen) and adding empty nodes along the path (these will be invisible) 
and colour nodes for the visible nodes that will be clicked on.
* Change texture by choosing an image from the right of screen to distinguish inhibitory excitatory.
* Give each node the naming convention Node followed by a unique number by changing the name attribute on the right of screen.

<img width="1398" alt="screen shot 2018-10-22 at 3 06 16 pm" src="https://user-images.githubusercontent.com/23369633/47313098-0cf2f200-d60c-11e8-938d-3b05529b45fe.png">
