use strict;use warnings;
use lib "../lib/";
use Cloud::Cloud;
use Data::Dumper;

my @wordList=qw/ Abelisaurus Acrocanthosaurus
 Albertosaurus Allosaurus Amargasaurus Ankylosaurus Apatosaurus Archaeopteryx
 Argentinosaurus Baryonyx Brachiosaurus Brontosaurus Carnotaurus Ceratosaurus
 Chasmosaurus Coelophysis Compsognathus Deinonychus Dilophosaurus Diplodocus
 Edmontosaurus Gallimimus Giganotosaurus Gorgosaurus Iguanodon Leaellynasaura
 Megalosaurus Minmi Ornithomimus Parasaurolophus Protoceratops Spinosaurus 
 Stegoceras Stegosaurus Suchomimus Tarbosaurus Triceratops Troodon Tyrannosaurus
 Utahraptor Velocirapto/; 
 
my $cloud    = new Cloud([3000,3000]);
my $firstElement= new CloudElement(textbox=>[100,110,$wordList[0],20],
	                             lineColour=>(qw/red orange yellow green blue indigo violet/)[rand()*7],
                               textColour=>"red",
	                             radius=>int(rand()*10));
my $secondElement= new CloudElement(textbox=>[100,255,$wordList[2],20],
	                             lineColour=>(qw/red orange yellow green blue indigo violet/)[rand()*7],
                               textColour=>"red",
	                             radius=>int(rand()*10));                               

#$cloud->addElement( $firstElement);
#$cloud->moveTowards( $secondElement,$firstElement->center());
#$cloud->addElement( $secondElement);
#$cloud->save("test.svg");
 #die Dumper($firstElement->proximity(  $secondElement )); 
  
                               
for my $dino(0..30){
  my $newElement=undef;
  while (!$newElement || ($cloud->checkOverlap($newElement))){
	   $newElement= new CloudElement(textbox=>[10*int(rand()*280)+10,10*int(rand()*250)+10,$wordList[$dino],30*int(rand()*3+1)],
	                             textColour=>(qw/red brown purple green blue indigo violet/)[rand()*7],
	                             radius=>int(rand()*10));
  };
  $cloud->moveTowards($newElement,$cloud->center());
 # die if $cloud->checkOverlap($newElement);
	$cloud->addElement( $newElement);	
};
                          
      
$cloud->save("test.svg");                         
                               





