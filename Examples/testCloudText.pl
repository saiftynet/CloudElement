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
	 my  $newElement= new CloudElement(textbox=>[10*int(rand()*80)+10,10*int(rand()*80)+10,$wordList[$dino],10*int(rand()*3+1)],
	                             lineColour=>(qw/red brown purple green blue indigo violet/)[rand()*7],
	                             textColour=>(qw/red brown purple green blue indigo violet/)[rand()*7],
                               onmouseover=>"this.style.fontWeight=\"700\"",
                               onmouseout =>"this.style.fontWeight=\"200\"",
                               onclick    =>"alert(this.innerText)",
	                             radius=>int(rand()*10));
  $cloud->placeRandomly($newElement);
  $cloud->moveTowards($newElement,$cloud->center());
	$cloud->addElement( $newElement);	
};
                          
      
$cloud->save("test.htm");    
$cloud->save("test.svg");                         
                               





