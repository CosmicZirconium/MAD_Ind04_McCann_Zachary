<?php
  // Get the request path.
  $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
    // Inform the receiver of the response that this is JSON data.
  header('Content-Type: application/json');
  // Convert the result to JSON and return it.

$States = array("Alabama" , "Alaska" , "Arizona" , "Arkansas" , "California" , "Colorado" , "Connecticut" , "Delaware" , 
"Florida" , "Georgia" , "Hawaii" ,
 "Idaho" , "Illinois" , "Indiana" , "Iowa" , "Kansas" , "Kentucky" , "Louisiana" , "Maine" , "Maryland" , "Massachusetts" , 
"Michigan" , "Minnesota" , "Mississippi" , "Missouri" , "Montana" , "Nebraska" , "Nevada" , "New Hampshire" , "New Jersey" , 
"New Mexico" , "New York" , "North Carolina" , "North Dakota" , "Ohio" , "Oklahoma" , "Oregon" , " Pennsylvania" , "Rhode Island" ,
 "South Carolina" , "South Dakota" , "Tennessee" , "Texas" , "Utah" , "Vermont" , "Virginia" , "Washington" ,
 "WestVirginia" , "Wisconsin" , "Wyoming");

$Nicknames = array("Yellowhammer State" , "The Last Frontier" , "The Grand Canyon State" , "The Natural State" , "The Golden State" , 
"The Centennial State" , "The Constitution State", 
"The First State" , "The Sunshine State" ,  "The Peach State" , "The Aloha State" , "The Gem State" , "Praire State" , "The Hoosier State" , 
"The Hawkeye State" , "The Sunflower State" , "The Bluegrass State", "The Pelican State" , "The Pine Tree State" ,
 "The Old Line State" , "The Bay State" , "The Great Lakes State" , "The North Star State" , "The Magnolia State" ,
 "The Show Me State" , "The Treasure State" , "The Cornhusker State" , "The Silver State" , "The Granite State" , 
"The Garden State" , "The Land of Enchantment" , "The Empire State" , "The Tar Heel State" , "The Peace Garden State" , "The Buckeye State" ,
 "The Sooner State" , "The Beaver State" , "The Keystone State" , "The Ocean State" , "The Palmetto State" ,
 "Mount Rushmore State" , "The Volunteer State" , "The Lone Star State" , "The Beehive State" , "The Green Mountain State" ,
 "The Old Dominion State" , "The Evergreen State" , "The Mountain State" , "The Badger State" , "The Cowboy State");

$Miles = array ("50,744" , "571,951" ,"113,635", "52,068", "155,959", "103,718" , "4,845" , "1,954", "53,927" , "57,906" , "6,423" ,
 "82,747" , "55,584" , "35,867" ,
 "55,869" ,"81,815" , "39,728" , "43,562", "30,862", "9,774", "7,840", "56,804", "79,610" , "46,907" , "68,886" , "145,552",
 "76,872" , "109,826", "9,968" , "7,417" , "121,356", "47,214" , "48,711" , "68,976" , "40,948" , "68,667" , "95,997" , "44,817" ,
 "1,045" , "30,109" , "75,885" , "41,217" , "261,797" , "82,144" , "9,250", "39,594" , "66,544" , "24,078" , "54,310" , "97,100" );

$Outlines = array([#imageLiteral(resourceName: "Alabama.jpg") , #imageLiteral(resourceName: "Alaska.jpg"), #imageLiteral(resourceName: "Arizona.jpg") ,  #imageLiteral(resourceName: "Arkansas.jpg") ,
 #imageLiteral(resourceName: "California.jpg") , #imageLiteral(resourceName: "Colorado.jpg") ,
 #imageLiteral(resourceName: "connecticut.jpg") , #imageLiteral(resourceName: "Delaware.jpg") ,
 #imageLiteral(resourceName: "Florida.jpg") , #imageLiteral(resourceName: "Georgia.jpg") 
, #imageLiteral(resourceName: "Hawaii.jpg") , #imageLiteral(resourceName: "Idaho.jpg"),
 #imageLiteral(resourceName: "IL.jpg") , #imageLiteral(resourceName: "Indiana.jpg") ,
 #imageLiteral(resourceName: "Iowa.jpg") , #imageLiteral(resourceName: "Kansas.jpg") ,
 #imageLiteral(resourceName: "Kentucky.jpg") , #imageLiteral(resourceName: "Louisiana.jpg") ,
 #imageLiteral(resourceName: "Maine.jpg") , #imageLiteral(resourceName: "Maryland.jpg") ,
 #imageLiteral(resourceName: "Mass.jpg") , #imageLiteral(resourceName: "Michigan.jpg") ,
 #imageLiteral(resourceName: "Minnesota.jpg") , #imageLiteral(resourceName: "Miss.jpg") ,
 #imageLiteral(resourceName: "Missouri.jpg") , #imageLiteral(resourceName: "Montana.jpg") ,
 #imageLiteral(resourceName: "NC.jpg") , #imageLiteral(resourceName: "ND.jpg") , #imageLiteral(resourceName: "Nebraska.jpg") ,
 #imageLiteral(resourceName: "Nevada.jpg") , #imageLiteral(resourceName: "NewHamp.jpg") ,
 #imageLiteral(resourceName: "NewJersey.jpg") , #imageLiteral(resourceName: "NewMexico.jpg"),
 #imageLiteral(resourceName: "Newyork.jpg"), #imageLiteral(resourceName: "Ohio.jpg") , #imageLiteral(resourceName: "OKL.jpg") ,
 #imageLiteral(resourceName: "Oregon.jpg") , #imageLiteral(resourceName: "Penn.jpg") , #imageLiteral(resourceName: "Rhode.jpg") ,
 #imageLiteral(resourceName: "SC.jpg") , #imageLiteral(resourceName: "SD.jpg") , #imageLiteral(resourceName: "Tennessee.jpg") ,
 #imageLiteral(resourceName: "Texas.jpg") , #imageLiteral(resourceName: "Utah.jpg") , #imageLiteral(resourceName: "Vermont.jpg") , #imageLiteral(resourceName: "Virginia.jpg") ,
 #imageLiteral(resourceName: "Washington.jpg"), #imageLiteral(resourceName: "WestVirginia.jpg"),
 #imageLiteral(resourceName: "Wisconsin.jpg"), #imageLiteral(resourceName: "Wyoming.jpg"));

$Flags = array( #imageLiteral(resourceName: "1024px-Flag_of_Alabama.svg_-360x240.png") , #imageLiteral(resourceName: "nunst003-360x240") ,  #imageLiteral(resourceName: "nunst004-360x240") , #imageLiteral(resourceName: "nunst005r-360x240 2") , #imageLiteral(resourceName: "nunst0006-360x240") ,  #imageLiteral(resourceName: "colorado-flag-360x240-1") , #imageLiteral(resourceName: "Connecticut-state-flag-360x278") , #imageLiteral(resourceName: "de-largeflag-360x240") , #imageLiteral(resourceName: "nunst012-360x240")   ,
 #imageLiteral(resourceName: "nunst090")  ,  #imageLiteral(resourceName: "Hawaii-1") ,   #imageLiteral(resourceName: "Idaho-1") ,  #imageLiteral(resourceName: "illnois-1")  ,   #imageLiteral(resourceName: "nunst021")  ,  #imageLiteral(resourceName: "flagofIowa-360x240-1")  , #imageLiteral(resourceName: "800px-Flag_of_Kansas-360x216"),   #imageLiteral(resourceName: "LouisianaStateFlagRGBLarge-1-360x233")  , 
 #imageLiteral(resourceName: "nunst030")  ,  #imageLiteral(resourceName: "nunst032-360x240")  ,  #imageLiteral(resourceName: "nunst033-360x216")   ,  #imageLiteral(resourceName: "nunst035-360x240")  ,   #imageLiteral(resourceName: "nunst037-360x232")  ,   #imageLiteral(resourceName: "missed")  , #imageLiteral(resourceName: "Missouri-state-flag-flat-360x216")  ,  #imageLiteral(resourceName: "nunst042-360x240")  , #imageLiteral(resourceName: "nunst044-360x216"), #imageLiteral(resourceName: "nunst046-360x240-1"), #imageLiteral(resourceName: "hamp") , #imageLiteral(resourceName: "state-flag-new-jersey_800-360x240"), #imageLiteral(resourceName: "nunst052-360x240"), #imageLiteral(resourceName: "nunst053-360x180"), #imageLiteral(resourceName: "nunst055"), #imageLiteral(resourceName: "nunst056"), #imageLiteral(resourceName: "ohio-flag-large-360x221-1"), #imageLiteral(resourceName: "nunst059-360x240"), #imageLiteral(resourceName: "nunst061-360x216"),
 #imageLiteral(resourceName: "nunst063"), #imageLiteral(resourceName: "road"), #imageLiteral(resourceName: "nunst066-360x240"), #imageLiteral(resourceName: "nunst067-360x216"), #imageLiteral(resourceName: "nunst069-360x216"), #imageLiteral(resourceName: "texas-1"), #imageLiteral(resourceName: "utah-1"), 
 #imageLiteral(resourceName: "nunst073-360x216")  ,   #imageLiteral(resourceName: "nunst075-360x232") , #imageLiteral(resourceName: "nunst077-360x240")  ,   #imageLiteral(resourceName: "nunst080") ,
  #imageLiteral(resourceName: "nunst081-360x240"),  #imageLiteral(resourceName: "nunst083-360x252") );

$StatesString = implode(" ", $States);
$MilesString = implode(" ", $Miles);

  echo $StatesString, $MilesString;
?>