use strict;

my $output = "";
my @chap_lines = ();
my $caption = "";
my $source = "";
my $file_name = "";
my $pic_width = "";
my $pic_pos = "";
my $chapter = 0;
#my $footnote_count = 0;

open(INFILE, "< mainmatter.tex") or die "Cannot open file\n";

while (<INFILE>) {
  my $line = $_;
  $line =~ s/£/\\pounds/g;
  $line =~ s/½/\\nicefrac{1}{2}/g;
  $line =~ s/\\label\{.*}}.*//;
  #$line =~ s/\\section/\\section*/;
  #$line =~ s/\\footnote/\\endnote/g;

  if ($line =~ /file\\\{(.*)\\}/) {
    $file_name = $1;
  }
  elsif ($line =~ /HRule$/) {
    my $skip = "\\noindent\\rule[0.5ex]{\\linewidth}{1pt}\n";
    push @chap_lines, $skip;
  }
  elsif ($line =~ /Newcol$/) {
    my $skip = "\\vfill\\null\n";
    my $skip .= "\\newpage\n";
    push @chap_lines, $skip;
  }
  elsif ($line =~ /Newpage$/) {
    my $skip = "\\newpage\n";
    push @chap_lines, $skip;
  }
  elsif ($line =~ /Para$/) {
    my $skip = "\n";
    push @chap_lines, $skip;
  }
  elsif ($line =~ /Smallskip$/) {
    my $skip = "\\smallskip\n";
    push @chap_lines, $skip;
  }
  elsif ($line =~ /Medskip$/) {
    my $skip = "\\medskip\n";
    push @chap_lines, $skip;
  }
  elsif ($line =~ /Endnotes$/) {
    my $en = "\\printendnotes[custom]\n";
    $en .= "\\setcounter{endnote}{0}\n";
    push @chap_lines, $en;
  }
  elsif ($line =~ /Balance$/) {
    my $en = "\\balance\n";
    push @chap_lines, $en;
  }
  elsif ($line =~ /Dictum\\\{(.*)\\}\\\{(.*)\\}$/) {
    my $s = $1;
    my $t = $2;
    $t =~ s/\/\//\\linebreak /g;
    my $dict = "\\setchapterpreamble[o]{\n";
    $dict .= "\\dictum[$s]{$t}}\n";
    push @chap_lines, $dict;
  }
  elsif ($line =~ /Drop\\\{(.)(.*)\\}(.*)$/) {
    my $let = $1;
    my $text = uc $2;
    my $rest = $3;
    my $drop .= "\\lettrine[lines=3]{$let}{$text}\n";
    push @chap_lines, $drop;
    push @chap_lines, $rest;
  }
  elsif ($line =~ /width\\\{(.*)\\}/) {
    $pic_width = $1;
  }
  elsif ($line =~ /position\\\{(.*)\\}/) {
    $pic_pos   = $1;
  }
  elsif ($line =~ /caption\\\{(.*)\\}\\\{(.*)\\}/) {
    $caption   = $1;
    $source   = $2;
    my $fig = "";
    if ($pic_pos eq "p") {
      $fig .= "\\begin{figure*}[!htb]\n";
      $fig .= "\\begin{center}\n";
      $fig .= "\\includegraphics[width=$pic_width\\textwidth,center]{../images/$file_name}\n";
      if ($caption ne "") {
        if ($source ne "") {
          $fig .= "\\caption{{\\itshape $caption} {\\scriptsize($source)}}\n";
        }
        else {
          $fig .= "\\caption{\\itshape $caption}\n";
        }
      }
      $fig .= "\\end{center}\n";
      $fig .= "\\end{figure*}\n";
    }
    elsif ($pic_pos eq "c") {
      $fig .= "\\begin{figure}\n";
      $fig .= "\\begin{center}\n";
      $fig .= "\\includegraphics[width=$pic_width\\linewidth,center]{../images/$file_name}\n";
      if ($caption ne "") {
        if ($source ne "") {
          $fig .= "\\caption{{\\itshape $caption} {\\scriptsize($source)}}\n";
        }
        else {
          $fig .= "\\caption{\\itshape $caption}\n";
        }
      }
      $fig .= "\\end{center}\n";
      $fig .= "\\end{figure}\n";
    }
    elsif ($pic_pos eq "ch") {
      $fig .= "\\medskip\n";
      $fig .= "\\begin{minipage}[b]{\\linewidth}\n";
      $fig .= "\\begin{center}\n";
      $fig .= "\\includegraphics[width=$pic_width\\linewidth,center]{../images/$file_name}\n";
      if ($caption ne "") {
        if ($source ne "") {
          $fig .= "\\captionof{figure}{{\\itshape $caption} {\\scriptsize($source)}}\n";
        }
        else {
          $fig .= "\\captionof{figure}{\\itshape $caption}\n";
        }
      }
      $fig .= "\\end{center}\n";
      $fig .= "\\end{minipage}\n";
      $fig .= "\\medskip\n";
    }
    push @chap_lines, $fig;
  }
  elsif ($line =~ /\\includegraphics/) {
  }
  elsif ($line =~ /\\hypertarget/) {
  }
  elsif ($line =~ /\\footnote/) {
    push @chap_lines, $line;
    #$footnote_count += 1;
  }
  elsif ($line =~ /\\chapter/) {
    my $lines = @chap_lines;
    #my $count = 0;
    #my $balance = 0;
    my $l = "";
    foreach $l (@chap_lines) {
      $output .= $l;
      #$count = $count + 1;
      #if ($count > $lines - 3) {
      #  if ($chapter > 0 && $balance eq 0) {
      #   $output .= "\\balance\n";
      #   $balance = 1;
      #  }
      #}
    }
    @chap_lines = ();
    #if ($chapter > 0) {
      #$output .= "\\balance\n";
      #if ($footnote_count > 0) {
      #  $output .= "\\printendnotes[custom]\n";
      #  $output .= "\\setcounter{endnote}{0}\n";
      #  $footnote_count = 0;
      #}
    #}
    $chapter += 1;
    if ($line =~ /Appendicies/) {
        $output .= "\\backmatter\n";
    }
    $output .= $line;
    $output .= "\\nobalance\n";
  }
  else {
    push @chap_lines, "$line\n";
  }
}
my $lines = @chap_lines;
#my $count = 0;
#my $balance = 0;
my $l = "";
foreach $l (@chap_lines) {
  $output .= $l;
  #$count = $count + 1;
  #if ($count > $lines - 2) {
  #  if ($chapter > 0 && $balance eq 0) {
  #    $output .= "\\balance\n";
  #    $balance = 1;
  #  }
  #}
}
@chap_lines = ();

close INFILE;

#if ($footnote_count > 0) {
#  $output .= "\\printendnotes[custom]\n";
#}

print $output;
