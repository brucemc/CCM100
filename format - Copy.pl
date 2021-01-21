use strict;

my $output = "";
my $caption = "";
my $pic_width = "";
my $chapter = 0;

open(INFILE, "< mainmatter.tex") or die "Cannot open file\n";

while (<INFILE>) {
  my $line = $_;
  $line =~ s/£/\\pounds/g;
  $line =~ s/½/\\nicefrac{1}{2}/g;
  $line =~ s/\\label{.*}}.*//;
  #$line =~ s/\\section/\\section*/;
  #$line =~ s/\\footnote/\\endnote/g;
  if ($line =~ /caption\\{(.*)\\}\\{(.*)\\}/) {
    $caption = $1;
    $pic_width = $2;
  }
  elsif ($line =~ /\\includegraphics.*({.*})$/) {
    my $image = $1;
    if ($pic_width =~ "[bth]") {
        $output .= "\\begin{figure}[$pic_width]\n";
        $output .= "\\begin{center}\n";
        $output .= "\\includegraphics[width=.95\\textwidth,center]$image\n";
        if ($caption ne "") {
          $output .= "\\caption{$caption}\n";
        }
        $output .= "\\end{center}\n";
        $output .= "\\end{figure}\n";
    }
    else {
      if ($pic_width ne "") {
        $output .= "\\begin{wrapfigure}{R}{$pic_width\\textwidth}\n";
      }
      else {
        $output .= "\\begin{wrapfigure}{R}{.5\\textwidth}\n";
      }
      $output .= "\\begin{center}\n";
      if ($pic_width ne "") {
        $pic_width = $pic_width - 0.02;
        $output .= "\\includegraphics[width=$pic_width\\textwidth,right]$image\n";
      }
      else {
        $output .= "\\includegraphics[width=.48\\textwidth,right]$image\n";
      }
      if ($caption ne "") {
        $output .= "\\caption{$caption}\n";
      }
      $output .= "\\end{center}\n";
      $output .= "\\end{wrapfigure}\n";
    }
    $caption = "";
    $pic_width = "";
  }
  elsif ($line =~ /\\hypertarget/) {
  }
  elsif ($line =~ /\\chapter/) {
    if ($chapter > 0) {
      $output .= "\\printendnotes\n";
      $output .= "\\setcounter{endnote}{0}\n";
    }
    $chapter += 1;
    $output .= $line;
  }
  else {
    $output .= $line;
  }
}

close INFILE;

$output .= "\\printendnotes\n";

print $output;
