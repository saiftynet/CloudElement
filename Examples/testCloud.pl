use strict;use warnings;
use lib "../lib/";
use Cloud::Cloud;

my $cloud    = new Cloud();
my ($targetX,$targetY)=@{$cloud->center()};
my $firstElement= new CloudElement(rectangle=>[$targetX-20,$targetY-10,40,20],
	                             lineColour=>(qw/red orange yellow green blue indigo violet/)[rand()*7],
                               bgColour=>"red",
	                             radius=>int(rand()*10));
#$cloud->addElement( $firstElement);
my $testElement= new CloudElement(rectangle=>[$targetX+35,$targetY+25,40,20],
	                             lineColour=>(qw/red orange yellow green blue indigo violet/)[rand()*7],
	                             radius=>int(rand()*10));
$testElement->move([-20,-20]);
$cloud->save("test.svg");

	#die $cloud->checkOverlap( $testElement);
for (0..50){
  my $newElement=undef;
  while (!$newElement || ($cloud->checkOverlap($newElement))){
	   $newElement= new CloudElement(rectangle=>[10*int(rand()*60)+10,10*int(rand()*40)+10,10*int(rand()*13+1),10*int(rand()*3+1)],
	                             lineColour=>(qw/red orange yellow green blue indigo violet/)[rand()*7],
	                             radius=>int(rand()*10));
  };
  
  $cloud->moveTowards($newElement,$cloud->center());
	$cloud->addElement( $newElement);	
};

$cloud->save("test.svg");


