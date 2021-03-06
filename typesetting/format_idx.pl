use strict;

my @places;
my $place = "";

open(PLACES, "< places.txt") or die "Cannot open file\n";

while (<PLACES>) {
  $place = $_;
  $place =~ s/[^\w]//g;
  push @places, $place;
}

close PLACES;

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
  elsif ($line =~ /\\lettrine/) {
    $output .= $line;
  }
  else {
    foreach $place (@places) {
      $line =~ s/$place/$place\\index{$place}/g;
    }

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
    if ($line =~ /Lee Warner/ || $line =~ /Rev[ Le]*Warner/) {
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
    if ($line =~ /the Kapernick's/) {
      $line =~ s/the Kapernick's/the Kapernick's\\index{Kapernick, I (Mick)}\\index{Kapernick, Marion}/;
    }
    if ($line =~ /Ivor \(Mick\) and Marion Kapernick/) {
      $line =~ s/Ivor \(Mick\) and Marion Kapernick/Ivor (Mick) and Marion Kapernick\\index{Kapernick, I (Mick)}\\index{Kapernick, Marion}/;
    }
    if ($line =~ /Mick Kapernick/) {
      $line =~ s/Mick Kapernick/Mick Kapernick\\index{Kapernick, I (Mick)}/;
    }
    if ($line =~ /I Kapernick/) {
      $line =~ s/I Kapernick/I Kapernick\\index{Kapernick, I (Mick)}/;
    }
    if ($line =~ /Ivor Douglas Kapernick/) {
      $line =~ s/Ivor Douglas Kapernick/Ivor Douglas Kapernick\\index{Kapernick, I (Mick)}/;
    }
    if ($line =~ /Marion Kapernick/) {
      $line =~ s/Marion Kapernick/Marion Kapernick\\index{Kapernick, Marion}/;
    }
    if ($line =~ /\(Mick\) Kapernick/) {
      $line =~ s/\(Mick\) Kapernick/(Mick) Kapernick\\index{Kapernick, I (Mick)}/;
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
    if ($line =~ /George Waldock Jr/) {
      $line =~ s/George Waldock Jr/George Waldock Jr\\index{Waldock, George Jnr}/;
    }
    if ($line =~ /S Waldock/) {
      $line =~ s/S Waldock/S Waldock\\index{Waldock, Shirley}/;
    }
    if ($line =~ /Shirley Waldock/) {
      $line =~ s/Shirley Waldock/Shirley Waldock\\index{Waldock, Shirley}/;
    }
    if ($line =~ /John Waldock/) {
      $line =~ s/John Waldock/John Waldock\\index{Waldock, John}/;
    }
    if ($line =~ /Ross Waldock/) {
      $line =~ s/Ross Waldock/Ross Waldock\\index{Waldock, Ross}/;
    }
    if ($line =~ /Heather Waldock/) {
      $line =~ s/Heather Waldock/Heather Waldock\\index{Waldock, Heather}/;
    }
    if ($line =~ /Ted Waldock/) {
      $line =~ s/Ted Waldock/Ted Waldock\\index{Waldock, Ted}/;
    }
    if ($line =~ /G Waldock/) {
      $line =~ s/G Waldock/G Waldock\\index{Waldock, G}/;
    }
    if ($line =~ /C W Waldock/) {
      $line =~ s/C W Waldock/C W Waldock\\index{Waldock, C W}/;
    }
    if ($line =~ /Mr C Waldock/) {
      $line =~ s/Mr C Waldock/Mr C Waldock\\index{Waldock, C W}/;
    }
    if ($line =~ /George Waldock Jnr/) {
      $line =~ s/George Waldock Jnr/George Waldock Jnr\\index{Waldock, George Jnr}/;
    }
    if ($line =~ /Nick Waldock/) {
      $line =~ s/Nick Waldock/Nick Waldock\\index{Waldock, Nick}/;
    }
    if ($line =~ /May Gedge/) {
      $line =~ s/May Gedge/May Gedge\\index{Gedge, May}/;
    }
    elsif ($line =~ /Gedges/) {
      $line =~ s/Gedges/Gedges\\index{Gedge, Bill}\\index{Gedge, May}/;
    }
    elsif ($line =~ /May and Bill Gedge/) {
      $line =~ s/May and Bill Gedge/May and Bill Gedge\\index{Gedge, Bill}\\index{Gedge, May}/;
    }
    elsif ($line =~ /Mr and Mrs Gedge/) {
      $line =~ s/Mr and Mrs Gedge/Mr and Mrs Gedge\\index{Gedge, Bill}\\index{Gedge, May}/;
    }
    elsif ($line =~ /Mr Gedge/) {
      $line =~ s/Mr Gedge/Mr Gedge\\index{Gedge, Bill}/;
    }
    elsif ($line =~ /Gedge/) {
      $line =~ s/Gedge/Gedge\\index{Gedge, Bill}/;
    }
    if ($line =~ /Trevor Cichero/) {
      $line =~ s/Trevor Cichero/Trevor Cichero\\index{Cichero, Trevor}/;
    }
    if ($line =~ /son Cliff/) {
      $line =~ s/son Cliff/son Cliff\\index{Krebs, Cliff}/;
    }
    if ($line =~ /Cliff Krebs/) {
      $line =~ s/Cliff Krebs/Cliff Krebs\\index{Krebs, Cliff}/;
    }
    if ($line =~ /Jack Krebs/) {
      $line =~ s/Jack Krebs/Jack Krebs\\index{Krebs, Jack}/;
    }
    if ($line =~ /John \(Jack\) Krebs/) {
      $line =~ s/John \(Jack\) Krebs/John (Jack) Krebs\\index{Krebs, John}/;
    }
    if ($line =~ /Bill Roberts/) {
      $line =~ s/Bill Roberts/Bill Roberts\\index{Roberts, Bill}/;
    }
    if ($line =~ /G W Roberts/) {
      $line =~ s/G W Roberts/G W Roberts\\index{Roberts, Bill}/;
    }
    if ($line =~ /Kathleen O�Neill/) {
      $line =~ s/Kathleen O�Neill/Kathleen O�Neill\\index{O�Neill, Kathleen}/;
    }
    if ($line =~ /Kathleen \(Katie\) O�Neill/) {
      $line =~ s/Kathleen \(Katie\) O�Neill/Kathleen (Katie) O�Neill\\index{O�Neill, Kathleen}/;
    }
    if ($line =~ /Thelma O�Neill/) {
      $line =~ s/Thelma O�Neill/Thelma O�Neill\\index{O�Neill, Thelma}/;
    }
    if ($line =~ /David O�Neill/) {
      $line =~ s/David O�Neill/David O�Neill\\index{O�Neill, David}/;
    }
    if ($line =~ /Richard O�Neill/) {
      $line =~ s/Richard O�Neill/Richard O�Neill\\index{O�Neill, Richard}/;
    }
    if ($line =~ /F Narracott/) {
      $line =~ s/F Narracott/F Narracot\\index{Narracott, Frank}/;
    }
    if ($line =~ /Frank Narracott/) {
      $line =~ s/Frank Narracott/Frank Narracot\\index{Narracott, Frank}/;
    }
    if ($line =~ /Frank and Myra Narracott/) {
      $line =~ s/Frank and Myra Narracott/Frank and Myra Narracott\\index{Narracott, Frank}/;
    }
    if ($line =~ /Bernard Monz/) {
      $line =~ s/Bernard Monz/Bernard Monz\\index{Monz, Bernard}/;
    }
    if ($line =~ /D Hindley/) {
      $line =~ s/D Hindley/D Hindley\\index{Hindley, Donna}/;
    }
    if ($line =~ /Donna Hindley/) {
      $line =~ s/Donna Hindley/Donna Hindley\\index{Hindley, Donna}/;
    }
    if ($line =~ /L Steele/) {
      $line =~ s/L Steele/L Steele\\index{Steele, Lynda}/;
    }
    if ($line =~ /Lynda Steele/) {
      $line =~ s/Lynda Steele/Lynda Steele\\index{Steele, Lynda}/;
    }
    if ($line =~ /Fang Ling Quested/) {
      $line =~ s/Fang Ling Quested/Fang Ling Quested\\index{Quested, Fang Ling}/;
    }
    if ($line =~ /Michael Quested/) {
      $line =~ s/Michael Quested/Michael Quested\\index{Quested, Michael}/;
    }
    if ($line =~ /Murgon Mothers/) {
      $line =~ s/Murgon Mothers/Murgon Mothers\\index{Mothers' Union}/;
    }
    if ($line =~ /Ladies' Guild/) {
      $line =~ s/Ladies' Guild/Ladies' Guild\\index{Ladies' Guild}/;
    }
    elsif ($line =~ /Women's Guild/) {
      $line =~ s/Women's Guild/Women's Guild\\index{Women's Guild}/;
    }
    elsif ($line =~ /Guild/) {
      $line =~ s/Guild/Guild\\index{Ladies' Guild}/;
    }
    if ($line =~ /St David�s/) {
      $line =~ s/St David�s/St David�s\\index{Boonara, St David�s Chruch}/;
    }
    if ($line =~ /Holy Spirit, Hivesville/) {
      $line =~ s/Holy Spirit, Hivesville/Holy Spirit, Hivesville\\index{Hivesville, Church of the Holy Spirit}/;
    }
    if ($line =~ /Church of the Holy Spirit was blessed/) {
      $line =~ s/Church of the Holy Spirit was blessed/Church of the Holy Spirit was blessed\\index{Hivesville, Church of the Holy Spirit}/;
    }
    if ($line =~ /the official opening of the Church of the Holy Spirit by Rev H Saull/) {
      $line =~ s/the official opening of the Church of the Holy Spirit by Rev H Saull/the official opening of the Church of the Holy Spirit by Rev H Saull\\index{Hivesville, Church of the Holy Spirit}/;
    }
    if ($line =~ /Holy Spirit church at Cherbourg/) {
      $line =~ s/Holy Spirit church at Cherbourg/Holy Spirit church at Cherbourg\\index{Cherbourg, Church of the Holy Spirit}/;
    }
    if ($line =~ /Holy Spirit Church, Cherbourg/) {
      $line =~ s/Holy Spirit Church, Cherbourg/Holy Spirit Church, Cherbourg\\index{Cherbourg, Church of the Holy Spirit}/;
    }
    if ($line =~ /Holy Trinity, Woolloongabba/) {
    }
    elsif ($line =~ /Holy Trinity/) {
      $line =~ s/Holy Trinity/Holy Trinity\\index{Windera, Church of the Holy Trinity}/;
    }
    if ($line =~ /St Matthew�s/) {
      $line =~ s/St Matthew�s/St Matthew�s\\index{Kilkivan, St Matthew�s Church}/;
    }
    if ($line =~ /Pryce-Davies/) {
      $line =~ s/Pryce-Davies/Pryce-Davies\\index{Pryce-Davies, John}/;
    }
    if ($line =~ /Rhonda Hunt/) {
      $line =~ s/Rhonda Hunt/Rhonda Hunt\\index{Hunt, Rhonda}/;
    }
    if ($line =~ /Kerr/) {
      $line =~ s/Kerr/Kerr\\index{Kerr, Ruth}/;
    }
    if ($line =~ /Dyson/) {
      $line =~ s/Dyson/Dyson\\index{Dyson, Ron}/;
    }
    if ($line =~ /Aspinall/) {
      $line =~ s/Aspinall/Aspinall\\index{Aspinall, Phillip}/;
    }
    if ($line =~ /Venables/) {
      $line =~ s/Venables/Venables\\index{Venables, Cameron}/;
    }
    if ($line =~ /Nolan/) {
      $line =~ s/Nolan/Nolan\\index{Nolan, Robert}/;
    }
    if ($line =~ /George Van/) {
      $line =~ s/George Van/George Van\\index{Van, George}/;
    }
    if ($line =~ /George Arnell/) {
      $line =~ s/George Arnell/George Arnell\\index{Arnell, George}/;
    }
    if ($line =~ /Arnott/) {
      $line =~ s/Arnott/Arnott\\index{Arnott, Felix}/;
    }
    if ($line =~ /Gerald Greaves/) {
      $line =~ s/Gerald Greaves/Gerald Greaves\\index{Greaves, Gerald}/;
    }
    if ($line =~ /Rev Greaves/) {
      $line =~ s/Rev Greaves/Rev Greaves\\index{Greaves, Gerald}/;
    }
    if ($line =~ /G C Quinn/) {
      $line =~ s/G C Quinn/G C Quinn\\index{Quinn, G C}/;
    }
    if ($line =~ /G C \(Chappie\) Quinn/) {
      $line =~ s/G C \(Chappie\) Quinn/G C (Chappie) Quinn\\index{Quinn, G C}/;
    }
    if ($line =~ /Lindsay Quinn/) {
      $line =~ s/Lindsay Quinn/Lindsay Quinn\\index{Quinn, Lindsay}/;
    }
    if ($line =~ /Joyce Quinn/) {
      $line =~ s/Joyce Quinn/Joyce Quinn\\index{Quinn, Joyce}/;
    }
    if ($line =~ /Linda Quinn/) {
      $line =~ s/Linda Quinn/Linda Quinn\\index{Quinn, Linda}/;
    }
    if ($line =~ /L Quinn/) {
      $line =~ s/L Quinn/L Quinn\\index{Quinn, Linda}/;
    }
    if ($line =~ /Dorothea Quinn/) {
      $line =~ s/Dorothea Quinn/Dorothea Quinn\\index{Quinn, Dorothea}/;
    }
    $output .= $line;
  }
 
}

close INFILE;


print $output;
