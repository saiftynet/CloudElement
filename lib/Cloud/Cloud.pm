package CloudElement;

our $VERSION = "0.001";

	sub new{
	   my $class=shift;
	   my %params;
	   my $self={};
	   if (ref $_[0]){
		   if (ref $_[0] eq "CloudElement"){  # element object passed to clone
			   for my $key (qw/x y width height lineColour bgColour radius text size textColour type/){
				   $self->{$key}=$_[0]->{$key};
			   }
			   bless $self,$class;
			   return $self;		   
		   }
		   else { %params=%$_[0] };         # object passed as hashref
	   }
	   else {                               # a hash passed as list of key values
		 %params=@_;
	   }
	   
	   
	   if ($params{rectangle}){ # rectangle objects made to test 
		   $self->{type}="rectangle";
		   if (ref $params{rectangle} eq "ARRAY"){
			   ($self->{x},$self->{y},$self->{width},$self->{height})=@{$params{rectangle}}
		   };
	   }
	   elsif ($params{text}||$params{textbox}){ # text objects with or without box
		   $self->{type}=$params{text}?"text":"textbox";
		  ($self->{x},$self->{y},$self->{text},$self->{size})=@{$params{$self->{type}}};
		   $self->{height}=$self->{size}*1.5;
		   $self->{width}=$self->{size}*length($self->{text})*0.8;
		   
		   
	   }
	   elsif ($params{image}){ # TODO Image objects
		   $self->{type}="image";
		   
		   
	   }
	   
	   my %default=("lineThickness"=>1,"lineColour"=>"black","bgColour"=>"white","radius"=>2,"textColour"=>"black");
	   foreach (qw/lineThickness lineColour bgColour radius textColour/){
		   $self->{$_}=$params{$_}//$default{$_};
	   }
	   bless $self,$class;
	   return $self;
	}
	
	sub svg{
		my $self=shift;
		if ($self->{type} eq "rectangle"){
			return "\n <rect width='$self->{width}' height='$self->{height}' ".
		       "x='$self->{x}' y='$self->{y}' rx='$self->{radius}' ry='$self->{radius}' ".
		       "\n  style='fill:".$self->{"bgColour"}.";".
		       "stroke-width:".$self->{lineThickness}.";".
		       "stroke:".$self->{lineColour}."' />";
		}
		elsif($self->{type} eq "text"){
			return "\n<text y='".($self->{y}+2+$self->{height}/2)."' x='".($self->{x}+$self->{width}/2)."' font-size='$self->{size}px' ".
		       "font-family='sans-serif' fill:'$self->{textColour}' dominant-baseline='middle' text-anchor='middle'>$self->{text}</text>";
        }
        elsif($self->{type} eq "textbox"){
			return "\n <rect width='$self->{width}' height='$self->{height}' ".
		       "x='$self->{x}' y='$self->{y}' rx='$self->{radius}' ry='$self->{radius}' ".
		       "\n  style='fill:".$self->{"bgColour"}.";".
		       "stroke-width:".$self->{lineThickness}.";".
		       "stroke:".$self->{lineColour}."' />".
		       "\n <text y='".($self->{y}+2+$self->{height}/2)."' x='".($self->{x}+$self->{width}/2)."' font-size='$self->{size}px'\n".
		       "  font-family='sans-serif' fill='$self->{textColour}' dominant-baseline='middle' text-anchor='middle'>$self->{text}</text>";
        }
	}
	
   sub center{
	   my $self=shift;
	   return [$self->{x}+$self->{width}/2,$self->{y}+$self->{height}/2];
   }
	
	sub move{
		my ($self,$delta)=@_;
		return unless ref $delta;
		$self->{x}+=$delta->[0];
		$self->{y}+=$delta->[1];
	}
	
	sub moveTo{
		my ($self,$pos)=@_;
		return unless $pos;
		$self->{x}=$pos->[0];
		$self->{y}=$pos->[1];
	}
		
	sub proximity{
	  my ($self,$element)=@_;
	  my $rel="";my $prox={};
	  if ($self->{x}+$self->{width}<$element->{x})     {  $rel.="r"; $prox->{r}=$element->{x}-($self->{x} + $self->{width} )  }
	  elsif ($element->{x}+$element->{width}<$self->{x}) {  $rel.="l"; $prox->{l}=$self->{x}- ($element->{x}+ $element->{width})  };
      if ($self->{y}+$self->{height}<$element->{y})    {  $rel.="b"; $prox->{b}=$element->{y}-($self->{y} + $self->{height})  }
      elsif ($element->{y}+$element->{height}<$self->{y}){  $rel.="a"; $prox->{a}=$self->{y}- ($element->{y}+ $element->{height}) };
      return undef unless (%{$prox});
      return $prox;
	}

    sub delta{  # how far to move self to touch another element;
      my($self,$element,$space)=@_;	
      $space//=[5,5];
      my $ol=$self->proximity($element);
      return undef unless ($ol);
      my $delta=[0,0];
      if   ($ol->{r})   {$delta->[0]= $ol->{r}-$space->[0]   }
      elsif($ol->{l})   {$delta->[0]=-$ol->{l}+$space->[0]   };
      if   ($ol->{b})   {$delta->[1]= $ol->{b}-$space->[1]   }
      elsif($ol->{a})   {$delta->[1]=-$ol->{a}+$space->[1]   };
      return $delta;
    }
    
    sub inside{
		my($self,$coords)=@_;
		return  (($coords->[0]>=$self->{x}) and
		        ($coords->[0]<=($self->{x}+$self->{width})) and
		        ($coords->[1]>=$self->{y}) and
		        ($coords->[0]<=($self->{x}+$self->{height})))?1:0;
		
	}

    sub gamma{
	  my($self,$element,$space)=@_;	
      $space//=[5,5];
      my $ol=$self->proximity($element);
      return undef if ($ol);
      my $gamma=
         [ [    $element->{width}-($self->{x}-$element->{x})+$space->[0],0], # how far right
           [  -($self->{x}-$element->{x})-$self->{width}-$space->[0]  ,0], # how far left
           [0,  $element->{height}-($self->{y}-$element->{y})+$space->[1] ], # how far down
           [0,-($self->{y}-$element->{y})-$self->{height}-$space->[1]   ], # how far up
          ];
      return $gamma;
      
	}
	
	sub match{
	  my($self,$element)=@_;	
	  return (($self->{x}==$element->{x}) and
	         ($self->{y}==$element->{y}) and
	         ($self->{width}==$element->{width}) and
	         ($self->{height}==$element->{height}))?1:0;
	}
	
	sub clone{
	   my($self)=@_;	
	   return new CloudElement($self);
	}
	
	sub addContent{
	   my($self,$content)=@_;	
	   $self->{content}=$content;
	}
	

package Cloud;

    sub new{
	    my $class=shift;
		my %params;
		if (ref $_[0] eq "ARRAY"){
			$params{size}=$_[0] ;
		}
		else {
			%params=@_;
		}	
		my $self={};
		$self->{size}=$params{size}//[640,480];
		$self->{elements}=[];
		
	   bless $self,$class;
	   return $self;
   }
		
   sub addElement{
     my ($self,@elements)=@_;
     push @{$self->{elements}},@elements;
   }
   
   sub checkOverlap{
	   my ($self,$elementIndex,$highlight)=@_;
	   my $overlaps=[];
	   my $test=(ref $elementIndex eq "CloudElement")?$elementIndex:$self->{elements}->[$elementIndex];
	   foreach my $ch(0..$#{$self->{elements}}){
		  next if (($ch==$elementIndex)||((ref $elementIndex eq "CloudElement") && $elementIndex->match($self->{elements}->[$ch])));
		  my $ol=$test->proximity($self->{elements}->[$ch]);
		  if (!%$ol){
			 push @$overlaps, $ch;
			 $self->{elements}->[$ch]->{bgColour}=$highlight if ($highlight);
		  }
	   }

	   return (@$overlaps)?$overlaps:0;
   }
   
   sub center{
	   my $self=shift;
	   return [$self->{size}->[0]/2,$self->{size}->[1]/2]
   }
   
   sub svg{
	   my $self=shift;
	   my $svg=	"<svg width='". $self->{size}->[0].
	   	"' height='".   $self->{size}->[1].
	   	"' xmlns='http://www.w3.org/2000/svg'>\n";
	   	$svg.=$_->svg() foreach (@{$self->{elements}});
        $svg.="\n\n</svg>";
        return $svg;
   }
   
   sub tryMove{
     my ($self,$elementToMove,$delta)=@_;
     if (! ref $elementToMove){
       $elementToMove= $self->{elements}->[$elementToMove];
	 }
	 
	 my $testElement=$elementToMove->clone();
	 $testElement->move($delta);
	 if ($self->checkOverlap($testElement) ){
		 $testElement=undef;
		 return 0;
	 }
	 else{
         $elementToMove->move($delta);
         return 1;
         }	   
   }

	sub moveTowards{
	  my ($self,$element,$target)=@_;  
	  unless (ref $element){
		$element=$self->{elements}->[$element]
	  }
	  if (! scalar(@{$self->{elements}})){
		  $element->{x}=$target->[0]-$element->{width}/2;
		  $element->{y}=$target->[0]-$element->{height}/2;
		  return;
		  
	  }
	  my $count=0;my ($xDir,$yDir);my $buffer=[];
	  while (1){
		my @testStationary=($element->{x},$element->{y});
		unshift @$buffer,[$element->{x},$element->{y}];
		my ($centerX,$centerY)=@{$element->center()};
		($xDir,$yDir) = (($target->[0]<=>$centerX)*10,($target->[1]<=>$centerY)*10);
		$self->tryMove($element,[$xDir,0]);
		$self->tryMove($element,[0,$yDir]);
		if (($testStationary[0]==$element->{x})&&($testStationary[1]==$element->{y})){
		  print " Cannot move ".@{$self->{elements}}."\n";
		  print " Stationary\n" if stationary($buffer);
		  last;
		}
		$count++;
		if ($count>100){
		  print " loop Failed ".@{$self->{elements}}."\n";
		  print " oscillating\n" if oscillating($buffer);
		  last;
		}
		if (scalar @$buffer==3){pop @$buffer;}
	  }
	}
	
	sub stationary{
	   my $buffer=shift;
	   return 0 if scalar @$buffer<2;
	   return 1 if (($buffer->[0]->[0] == $buffer->[1]->[0]) &&($buffer->[0]->[1] == $buffer->[1]->[1]));
	   return 0;
		
	}


   sub oscillating{
	   my $buffer=shift;
	   return 0 if scalar @$buffer<3;
	   return 1 if (($buffer->[0]->[0] == $buffer->[2]->[0]) &&($buffer->[0]->[1] == $buffer->[2]->[1]));
   }
   
   sub save{
     my ($self,$fileName)=@_;
     open my $fh,">", $fileName;
     print $fh $self->svg();
     close $fh;
   }


