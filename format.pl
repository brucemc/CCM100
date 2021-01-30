use strict;

my $output = "";
my $caption = "";
my $file_name = "";
my $pic_width = "";
my $pic_pos = "";
my $chapter = 0;
my $footnote_count = 0;

open(INFILE, "< mainmatter.tex") or die "Cannot open file\n";

while (<INFILE>) {
  my $line = $_;
  $line =~ s/£/\\pounds/g;
  $line =~ s/½/\\nicefrac{1}{2}/g;
  $line =~ s/\\label{.*}}.*//;
  #$line =~ s/\\section/\\section*/;
  #$line =~ s/\\footnote/\\endnote/g;

  if ($line =~ /file\\{(.*)\\}/) {
    $file_name = $1;
  }
  elsif ($line =~ /width\\{(.*)\\}/) {
    $pic_width = $1;
  }
  elsif ($line =~ /position\\{(.*)\\}/) {
    $pic_pos   = $1;
  }
  elsif ($line =~ /caption\\{(.*)\\}/) {
    $caption   = $1;
    #print "$file_name $pic_width $pic_pos $caption\n";

    if ($pic_width eq "") {
      $pic_width = "0.5";
    }

    if ($pic_pos =~ "[RL]") {
      $output .= "\\begin{wrapfigure}{$pic_pos}{$pic_width\\textwidth}\n";
      $output .= "\\begin{center}\n";
      $pic_width = $pic_width - 0.02;
      #$output .= "\\pdfimageresolution=300\n";
      $output .= "\\includegraphics[width=$pic_width\\textwidth,right]{images/$file_name}\n";
      if ($caption ne "") {
        $output .= "\\caption{$caption}\n";
      }
      $output .= "\\end{center}\n";
      $output .= "\\end{wrapfigure}\n";
    }
    elsif ($pic_pos =~ "[bthH]") {
        if ($pic_pos eq "H") {
          $output .= "\\begin{figure}[H]\n";
        }
        else {
          $output .= "\\begin{figure}[!$pic_pos]\n";
        }
        $output .= "\\begin{center}\n";
        #$output .= "\\pdfimageresolution=300\n";
        $output .= "\\includegraphics[width=$pic_width\\textwidth,center]{images/$file_name}\n";
        if ($caption ne "") {
          $output .= "\\caption{$caption}\n";
        }
        $output .= "\\end{center}\n";
        $output .= "\\end{figure}\n";
    }
    $caption = "";
    $file_name = "";
    $pic_pos = "";
    $pic_width = "";
  }
  elsif ($line =~ /\\includegraphics/) {
  }
  elsif ($line =~ /\\hypertarget/) {
  }
  elsif ($line =~ /\\footnote/) {
    $output .= $line;
    $footnote_count += 1;
  }
  elsif ($line =~ /\\chapter/) {
    if ($chapter > 0) {
      if ($footnote_count > 0) {
        $output .= "\\printendnotes[custom]\n";
        $output .= "\\setcounter{endnote}{0}\n";
        $footnote_count = 0;
      }
    }
    $chapter += 1;
    if ($line =~ /Appendicies/) {
        $output .= "\\backmatter\n";
    }
    $output .= $line;
  }
  else {
    $output .= $line;
  }
}

close INFILE;

if ($footnote_count > 0) {
  $output .= "\\printendnotes[custom]\n";
}

print $output;
