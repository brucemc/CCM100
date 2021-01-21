pandoc ^
  --extract-media=pics ^
     book.docx ^
  -o mainmatter.tex ^
  --variable documentclass=book ^
  --reference-location=section ^
  -N ^
  --toc ^
  --variable fontfamily=Palatino ^
  --variable fontsize=11pt

perl format.pl > formatted-mainmatter.tex

xelatex book.tex
