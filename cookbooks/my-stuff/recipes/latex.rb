%w(texlive texlive-science texlive-publishers texlive-pictures texlive-math-extra texlive-lang-german).each do |p|
  package p
end

%w(gedit-latex-plugin auctex latexila).each do |p|
  package p
end
