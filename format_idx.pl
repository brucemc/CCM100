use strict;

my $output = "";

open(INFILE, "< formatted-mainmatter.tex") or die "Cannot open file\n";

while (<INFILE>) {
  my $line = $_;

  if ($line =~ /\\chapter/) {
    $output .= $line;
  }
  elsif ($line =~ /\\caption/) {
    $output .= $line;
  }
  elsif ($line =~ /\\section/) {
    $output .= $line;
  }
  elsif ($line =~ /\\includegraphics/) {
    $output .= $line;
  }
  else {

    if ($line =~ /Tatham/) {
      $line =~ s/Tatham/Tatham\\index{Tatham, G J}/;
    }
    if ($line =~ /Archdeacon.*Rivers/) {
      $line =~ s/Rivers/Rivers\\index{Rivers, A R}/;
    }
    if ($line =~ /J H Steer/ || $line =~ /Rev[ JH]*Steer/) {
      $line =~ s/Steer/Steer\\index{Steer, J H}/;
    }
    if ($line =~ /C G B Turner/ || $line =~ /Rev[ CGB]*Turner/) {
      $line =~ s/Turner/Turner\\index{Turner, C G B}/;
    }
    if ($line =~ /J L Puxley/ || $line =~ /Rev[ JL]*Puxley/) {
      $line =~ s/Puxley/Puxley\\index{Puxley, J L}/;
    }
    if ($line =~ /B P Walker/ || $line =~ /Rev[ BP]*Walker/) {
      $line =~ s/Walker/Walker\\index{Walker, B P}/;
    }
    if ($line =~ /C C H James/ || $line =~ /Rev[ CH]*James/) {
      $line =~ s/James/James\\index{James, C C H}/;
    }
    if ($line =~ /Lee.*Warner/ || $line =~ /Rev[ Le]*Warner/) {
      $line =~ s/Warner/Warner\\index{Lee-Warner, J}/;
    }
    if ($line =~ /Shand/ || $line =~ /Rev[ RWa-z]*Shand/) {
      $line =~ s/Shand/Shand\\index{Shand, R W}/;
    }
    if ($line =~ /Griffiths/ || $line =~ /Rev[ WHa-z]*Griffiths/) {
      $line =~ s/Griffiths/Griffiths\\index{Griffiths, H W}/;
    }
    if ($line =~ /Thompson/ || $line =~ /Rev[ AGa-z]*Thompson/) {
      $line =~ s/Thompson/Thompson\\index{Thompson, A G}/;
    }
    if ($line =~ /J.*Kruger/ || $line =~ /Rev[ Ja-z]*Kruger/) {
      $line =~ s/Kruger/Kruger\\index{Kruger, J}/;
    }
    if ($line =~ /Jull/ || $line =~ /Rev[ AS]*Jull/) {
      $line =~ s/Jull/Jull\\index{Jull, A S}/;
    }
    if ($line =~ /Robert.*Donne/ || $line =~ /Rev[ RAa-z]*Donne/) {
      $line =~ s/Donne/Donne\\index{Donne, R A}/;
    }
    if ($line =~ /Gerlach/) {
      $line =~ s/Gerlach/Gerlach\\index{Gerlach, A J}/;
    }
    if ($line =~ /McDougall/) {
      $line =~ s/McDougall/McDougall\\index{McDougall, D}/;
    }
    if ($line =~ /Toon/) {
      $line =~ s/Toon/Toon\\index{Toon, U E}/;
    }
    if ($line =~ /Richter/) {
      $line =~ s/Richter/Richter\\index{Richter, M C}/;
    }
    if ($line =~ /Campbell/) {
      $line =~ s/Campbell/Campbell\\index{Campbell, D K}/;
    }
    if ($line =~ /Joan Gray/) {
      $line =~ s/Joan Gray/Joan Gray\\index{Gray, Joan}/;
    }
    if ($line =~ /McNamara/) {
      $line =~ s/McNamara/McNamara\\index{McNamara, V J}/;
    }
    if ($line =~ /Clarke/) {
      $line =~ s/Clarke/Clarke\\index{Clarke, B J}/;
    }
    if ($line =~ /Wagstaff/) {
      $line =~ s/Wagstaff/Wagstaff\\index{Wagstaff, N W}/;
    }
    if ($line =~ /Bill Gedge/) {
      $line =~ s/Bill Gedge/Bill Gedge\\index{Gedge, Bill}/;
    }
    if ($line =~ /Mick Kapernick/) {
      $line =~ s/Mick Kapernick/Mick Kapernick\\index{Kapernick, I (Mick)}/;
    }
    if ($line =~ /Ewen McIntosh/) {
      $line =~ s/Ewen McIntosh/Ewen McIntosh\\index{McIntosh, E B}/;
    }
    if ($line =~ /Marcia McIntosh/) {
      $line =~ s/Marcia McIntosh/Marcia McIntosh\\index{McIntosh, M G}/;
    }
    if ($line =~ /Marcia Gay McIntosh/) {
      $line =~ s/Marcia Gay McIntosh/Marcia Gay McIntosh\\index{McIntosh, M G}/;
    }
    if ($line =~ /Frederick W McIntosh/) {
      $line =~ s/Frederick W McIntosh/Frederick W McIntosh\\index{McIntosh, Frederick W}/;
    }
    if ($line =~ /Joyce Ethel McIntosh/) {
      $line =~ s/Joyce Ethel McIntosh/Joyce Ethel McIntosh\\index{McIntosh, Joyce Ethel}/;
    }
    elsif ($line =~ /Ethel McIntosh/) {
      $line =~ s/Ethel McIntosh/Ethel McIntosh\\index{McIntosh, Ethel}/;
    }
    if ($line =~ /Elizabeth Pretoria McIntosh/) {
      $line =~ s/Elizabeth Pretoria McIntosh/Elizabeth Pretoria McIntosh\\index{McIntosh, Elizabeth Pretoria}/;
    }
    $output .= $line;
  }
 
}

close INFILE;


print $output;
