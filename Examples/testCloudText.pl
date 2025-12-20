use strict;use warnings;
use lib "../lib/";
use Cloud::Cloud;

my @wordList=qw/ Abelisaurus Acrocanthosaurus
 Albertosaurus Allosaurus Amargasaurus Ankylosaurus Apatosaurus Archaeopteryx
 Argentinosaurus Baryonyx Brachiosaurus Brontosaurus Carnotaurus Ceratosaurus
 Chasmosaurus Coelophysis Compsognathus Deinonychus Dilophosaurus Diplodocus
 Edmontosaurus Gallimimus Giganotosaurus Gorgosaurus Iguanodon Leaellynasaura
 Megalosaurus Minmi Ornithomimus Parasaurolophus Protoceratops Spinosaurus 
 Stegoceras Stegosaurus Suchomimus Tarbosaurus Triceratops Troodon Tyrannosaurus
 Utahraptor Velociraptor/; 
 
my $cloud    = new Cloud([1000,1000]);
                               
for my $dino(0..$#wordList){
	  my  $newElement= new CloudElement({textbox=>[10*int(rand()*80)+10,10*int(rand()*80)+10,$wordList[$dino],10*int(rand()*3+1)],
	                             lineColour=>(qw/red brown purple green blue indigo violet/)[rand()*7],
	                             textColour=>(qw/red brown purple green blue indigo violet/)[rand()*7],
                               onmouseover=>"this.style.fontWeight=\"700\"",
                               onmouseout =>"this.style.fontWeight=\"200\"",
                               onclick    =>"alert(this.innerText)",
	                             radius=>int(rand()*10)});
								 
# Old method 1...place element randomly in the cloud window 
# then move the element towards the center before adding it
#  $cloud->placeRandomly($newElement);
#  $cloud->moveTowards($newElement,$cloud->center());
#  $cloud->addElement( $newElement);	

# Method 2, place element at center and move it in a 
# expanding spiral until it no longer overlaps,
# then move the element towards the center before adding it
#  $cloud->placeAtCenter($newElement);
#  $cloud->placeArchimedian($newElement);
#  $cloud->moveTowards($newElement,$cloud->center());
#  $cloud->addElement( $newElement);	
   
# Version 0.003 adds a Compact Add Method, which is essentially
# the Method 2 in one function
   $cloud->compactAdd( $newElement);

};
                          
      
$cloud->save("test.htm");   
$cloud->save("test.svg");                         
                               





