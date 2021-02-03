pandoc ^
     book.docx ^
  -o mainmatter.tex ^
  --variable documentclass=book ^
  --wrap=none ^
  --reference-location=section ^
  --toc ^
  -N 

perl format.pl > formatted-mainmatter.tex
perl format_idx.pl > formatted-mainmatter-idx.tex

xelatex book.tex

"c:\Program Files\gs\gs9.53.3\bin\gswin64.exe" -sDEVICE=pdfwrite -dMaxSubsetPct=100 -dPDFSETTINGS=/prepress -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode -sOutputFile="book_prepress.pdf" -dNOPAUSE -dBATCH "book.pdf"
