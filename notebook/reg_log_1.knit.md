
<!-- rnb-text-begin -->

---
title: "R Notebook"
output: html_notebook
---


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeShyZWFkeGwpXG5saWJyYXJ5KHRpZHl2ZXJzZSlcbmBgYCJ9 -->

```r
library(readxl)
library(tidyverse)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogbGUgcGFja2FnZSDigJh0aWR5dmVyc2XigJkgYSDDqXTDqSBjb21waWzDqSBhdmVjIGxhIHZlcnNpb24gUiA0LjAuNVxuUmVnaXN0ZXJlZCBTMyBtZXRob2RzIG92ZXJ3cml0dGVuIGJ5ICdkYnBseXInOlxuICBtZXRob2QgICAgICAgICBmcm9tXG4gIHByaW50LnRibF9sYXp5ICAgICBcbiAgcHJpbnQudGJsX3NxbCAgICAgIFxuLS0gQXR0YWNoaW5nIHBhY2thZ2VzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHRpZHl2ZXJzZSAxLjMuMSAtLVxudiB0aWJibGUgIDMuMS4yICAgICB2IHN0cmluZ3IgMS40LjBcbnYgcmVhZHIgICAxLjQuMCAgICAgdiBmb3JjYXRzIDAuNS4xXG52IHB1cnJyICAgMC4zLjQgICAgIFxuV2FybmluZzogbGUgcGFja2FnZSDigJh0aWJibGXigJkgYSDDqXTDqSBjb21waWzDqSBhdmVjIGxhIHZlcnNpb24gUiA0LjAuNVxuV2FybmluZzogbGUgcGFja2FnZSDigJhyZWFkcuKAmSBhIMOpdMOpIGNvbXBpbMOpIGF2ZWMgbGEgdmVyc2lvbiBSIDQuMC41XG5XYXJuaW5nOiBsZSBwYWNrYWdlIOKAmHB1cnJy4oCZIGEgw6l0w6kgY29tcGlsw6kgYXZlYyBsYSB2ZXJzaW9uIFIgNC4wLjVcbldhcm5pbmc6IGxlIHBhY2thZ2Ug4oCYc3RyaW5ncuKAmSBhIMOpdMOpIGNvbXBpbMOpIGF2ZWMgbGEgdmVyc2lvbiBSIDQuMC41XG5XYXJuaW5nOiBsZSBwYWNrYWdlIOKAmGZvcmNhdHPigJkgYSDDqXTDqSBjb21waWzDqSBhdmVjIGxhIHZlcnNpb24gUiA0LjAuNVxuLS0gQ29uZmxpY3RzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHRpZHl2ZXJzZV9jb25mbGljdHMoKSAtLVxueCBwbG90bHk6OmFycmFuZ2UoKSAgICAgICAgbWFza3MgZHBseXI6OmFycmFuZ2UoKSwgcGx5cjo6YXJyYW5nZSgpXG54IGx1YnJpZGF0ZTo6YXMuZGlmZnRpbWUoKSBtYXNrcyBiYXNlOjphcy5kaWZmdGltZSgpXG54IHB1cnJyOjpjb21wYWN0KCkgICAgICAgICBtYXNrcyBwbHlyOjpjb21wYWN0KClcbnggZHBseXI6OmNvdW50KCkgICAgICAgICAgIG1hc2tzIHBseXI6OmNvdW50KClcbnggbHVicmlkYXRlOjpkYXRlKCkgICAgICAgIG1hc2tzIGJhc2U6OmRhdGUoKVxueCBkcGx5cjo6ZmFpbHdpdGgoKSAgICAgICAgbWFza3MgcGx5cjo6ZmFpbHdpdGgoKVxueCBwbG90bHk6OmZpbHRlcigpICAgICAgICAgbWFza3MgZHBseXI6OmZpbHRlcigpLCBzdGF0czo6ZmlsdGVyKClcbnggZHBseXI6OmlkKCkgICAgICAgICAgICAgIG1hc2tzIHBseXI6OmlkKClcbnggbHVicmlkYXRlOjppbnRlcnNlY3QoKSAgIG1hc2tzIGJhc2U6OmludGVyc2VjdCgpXG54IGRwbHlyOjpsYWcoKSAgICAgICAgICAgICBtYXNrcyBzdGF0czo6bGFnKClcbnggcGxvdGx5OjptdXRhdGUoKSAgICAgICAgIG1hc2tzIGRwbHlyOjptdXRhdGUoKSwgcGx5cjo6bXV0YXRlKClcbnggcGxvdGx5OjpyZW5hbWUoKSAgICAgICAgIG1hc2tzIGRwbHlyOjpyZW5hbWUoKSwgcGx5cjo6cmVuYW1lKClcbnggbHVicmlkYXRlOjpzZXRkaWZmKCkgICAgIG1hc2tzIGJhc2U6OnNldGRpZmYoKVxueCBwbG90bHk6OnN1bW1hcmlzZSgpICAgICAgbWFza3MgZHBseXI6OnN1bW1hcmlzZSgpLCBwbHlyOjpzdW1tYXJpc2UoKVxueCBkcGx5cjo6c3VtbWFyaXplKCkgICAgICAgbWFza3MgcGx5cjo6c3VtbWFyaXplKClcbnggbHVicmlkYXRlOjp1bmlvbigpICAgICAgIG1hc2tzIGJhc2U6OnVuaW9uKClcbiJ9 -->

```
Warning: le package ‘tidyverse’ a été compilé avec la version R 4.0.5
Registered S3 methods overwritten by 'dbplyr':
  method         from
  print.tbl_lazy     
  print.tbl_sql      
-- Attaching packages ----------------------------------------------------------------------------------------------------------------------------- tidyverse 1.3.1 --
v tibble  3.1.2     v stringr 1.4.0
v readr   1.4.0     v forcats 0.5.1
v purrr   0.3.4     
Warning: le package ‘tibble’ a été compilé avec la version R 4.0.5
Warning: le package ‘readr’ a été compilé avec la version R 4.0.5
Warning: le package ‘purrr’ a été compilé avec la version R 4.0.5
Warning: le package ‘stringr’ a été compilé avec la version R 4.0.5
Warning: le package ‘forcats’ a été compilé avec la version R 4.0.5
-- Conflicts -------------------------------------------------------------------------------------------------------------------------------- tidyverse_conflicts() --
x plotly::arrange()        masks dplyr::arrange(), plyr::arrange()
x lubridate::as.difftime() masks base::as.difftime()
x purrr::compact()         masks plyr::compact()
x dplyr::count()           masks plyr::count()
x lubridate::date()        masks base::date()
x dplyr::failwith()        masks plyr::failwith()
x plotly::filter()         masks dplyr::filter(), stats::filter()
x dplyr::id()              masks plyr::id()
x lubridate::intersect()   masks base::intersect()
x dplyr::lag()             masks stats::lag()
x plotly::mutate()         masks dplyr::mutate(), plyr::mutate()
x plotly::rename()         masks dplyr::rename(), plyr::rename()
x lubridate::setdiff()     masks base::setdiff()
x plotly::summarise()      masks dplyr::summarise(), plyr::summarise()
x dplyr::summarize()       masks plyr::summarize()
x lubridate::union()       masks base::union()
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeShnZ3Bsb3QyKVxubGlicmFyeShGYWN0b01pbmVSKVxuYGBgIn0= -->

```r
library(ggplot2)
library(FactoMineR)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogbGUgcGFja2FnZSDigJhGYWN0b01pbmVS4oCZIGEgw6l0w6kgY29tcGlsw6kgYXZlYyBsYSB2ZXJzaW9uIFIgNC4wLjVcbiJ9 -->

```
Warning: le package ‘FactoMineR’ a été compilé avec la version R 4.0.5
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeShmYWN0b2V4dHJhKVxuYGBgIn0= -->

```r
library(factoextra)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogbGUgcGFja2FnZSDigJhmYWN0b2V4dHJh4oCZIGEgw6l0w6kgY29tcGlsw6kgYXZlYyBsYSB2ZXJzaW9uIFIgNC4wLjVcbldlbGNvbWUhIFdhbnQgdG8gbGVhcm4gbW9yZT8gU2VlIHR3byBmYWN0b2V4dHJhLXJlbGF0ZWQgYm9va3MgYXQgaHR0cHM6Ly9nb28uZ2wvdmUzV0JhXG4ifQ== -->

```
Warning: le package ‘factoextra’ a été compilé avec la version R 4.0.5
Welcome! Want to learn more? See two factoextra-related books at https://goo.gl/ve3WBa
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeSh0aWR5dmVyc2UpXG5saWJyYXJ5IChwbG90Uk9DKVxuYGBgIn0= -->

```r
library(tidyverse)
library (plotROC)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogbGUgcGFja2FnZSDigJhwbG90Uk9D4oCZIGEgw6l0w6kgY29tcGlsw6kgYXZlYyBsYSB2ZXJzaW9uIFIgNC4wLjVcbiJ9 -->

```
Warning: le package ‘plotROC’ a été compilé avec la version R 4.0.5
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGZfY2FuZGlkYXQgPSByZWFkX2V4Y2VsKFwiZGYyMDE3Lnhsc3hcIiwgc2hlZXQgPSBcImNhbmRpZGF0XCIpXG5kZl9jaG9peCA9IHJlYWRfZXhjZWwoXCJkZjIwMTcueGxzeFwiLCBzaGVldCA9IFwiY2hvaXhcIilcbmRmX3Rlc3QgPSByZWFkX2V4Y2VsKFwiZGYyMDE3Lnhsc3hcIiwgc2hlZXQgPSBcInRlc3RcIilcbmRmX25vdGUgPSByZWFkX2V4Y2VsKFwiZGYyMDE3Lnhsc3hcIiwgc2hlZXQgPSBcIm5vdGVcIilcbmBgYCJ9 -->

```r
df_candidat = read_excel("df2017.xlsx", sheet = "candidat")
df_choix = read_excel("df2017.xlsx", sheet = "choix")
df_test = read_excel("df2017.xlsx", sheet = "test")
df_note = read_excel("df2017.xlsx", sheet = "note")
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGYgPSBkZl9jYW5kaWRhdCU+JWZpbHRlcihzZXJpZSA9PSBcIkRcIilcbmRmID0gbmEub21pdChkZilcbmRmX2Nob2l4JGFubmVlID0gYXMubnVtZXJpYyhkZl9jaG9peCRhbm5lZSlcbmRmID0gZGYlPiVsZWZ0X2pvaW4oZGZfY2hvaXgsIGJ5PWMoXCJpZGVudGlmaWFudENhbmRpZGF0XCIsIFwiYW5uZWVcIikpXG5kZiA9IGRmJT4lbGVmdF9qb2luKGRmX25vdGUsIGJ5PWMoXCJpZGVudGlmaWFudENhbmRpZGF0XCIsIFwiYW5uZWVcIikpXG5kZiA9IGRmWyxhcHBseShkZiwgMiwgZnVuY3Rpb24oeCkgIWFsbChpcy5uYSh4KSkpXVxuXG5gYGAifQ== -->

```r
df = df_candidat%>%filter(serie == "D")
df = na.omit(df)
df_choix$annee = as.numeric(df_choix$annee)
df = df%>%left_join(df_choix, by=c("identifiantCandidat", "annee"))
df = df%>%left_join(df_note, by=c("identifiantCandidat", "annee"))
df = df[,apply(df, 2, function(x) !all(is.na(x)))]

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc2VlX2NvbF93aXRoX2luZGV4ID0gZnVuY3Rpb24oZGYpIHtcbiAgZm9yIChqIGluIDE6bGVuZ3RoKGNvbG5hbWVzKGRmKSkpIHtcbiAgICBjYXQoaiwgXCItXCIsIGNvbG5hbWVzKGRmKVtqXSlcbiAgICBpZiAoaiUlMyA9PSAwKSB7XG4gICAgICBjYXQoXCJcXG5cIilcbiAgICB9IGVsc2Uge1xuICAgICAgY2F0KFwiXFx0XFx0XFx0XCIpXG4gICAgfVxuICB9XG59XG5zZWVfY29sX3dpdGhfaW5kZXgoZGYpXG5gYGAifQ== -->

```r
see_col_with_index = function(df) {
  for (j in 1:length(colnames(df))) {
    cat(j, "-", colnames(df)[j])
    if (j%%3 == 0) {
      cat("\n")
    } else {
      cat("\t\t\t")
    }
  }
}
see_col_with_index(df)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiMSAtIGlkZW50aWZpYW50Q2FuZGlkYXRcdFx0XHQyIC0gZXRhYmxpc3NlbWVudE9yaWdpbmVcdFx0XHQzIC0gZGF0ZU5haXNzYW5jZVxuNCAtIGdlbnJlXHRcdFx0NSAtIE5hdGlvbmFsaXRlXHRcdFx0NiAtIHNlcmllXG43IC0gbWVudGlvbkF1QmFjXHRcdFx0OCAtIHJlZG91YmxlbWVudFRlcm1pbmFsZVx0XHRcdDkgLSByYW5nRW5UZXJtaW5hbGVcbjEwIC0gYWdlXHRcdFx0MTEgLSBhbm5lZVx0XHRcdDEyIC0gRFJFTlxuMTMgLSBhZG1pc3NpYmxlXHRcdFx0MTQgLSBGaWxpZXJlQWNjdWVpbFx0XHRcdDE1IC0gQ3ljbGVcbjE2IC0gRWNvbGVBY2N1ZWlsXHRcdFx0MTcgLSBhZG1pc1x0XHRcdDE4IC0gbW95ZW5uZURvc3NpZXJfMVxuMTkgLSBtb3llbm5lRG9zc2llcl8yXHRcdFx0MjAgLSBtb3llbm5lRG9zc2llcl8zXHRcdFx0MjEgLSBtb3llbm5lRG9zc2llcl80XG4yMiAtIG1veWVubmVEb3NzaWVyXzVcdFx0XHQyMyAtIG1veWVubmVEb3NzaWVyXzZcdFx0XHQyNCAtIG1veWVubmVEb3NzaWVyXzdcbjI1IC0gbW95ZW5uZURvc3NpZXJfOFx0XHRcdDI2IC0gbW95ZW5uZURvc3NpZXJfOVx0XHRcdDI3IC0gbW95ZW5uZVRlc3RfMVxuMjggLSBtb3llbm5lVGVzdF8yXHRcdFx0MjkgLSBtb3llbm5lVGVzdF8zXHRcdFx0MzAgLSBtb3llbm5lVGVzdF80XG4zMSAtIG1veWVubmVUZXN0XzVcdFx0XHQzMiAtIG1veWVubmVUZXN0XzZcdFx0XHQzMyAtIG1veWVubmVUZXN0XzdcbjM0IC0gbW95ZW5uZVRlc3RfOFx0XHRcdDM1IC0gbW95ZW5uZVRlc3RfOVx0XHRcdDM2IC0gbW95ZW5uZURlZmluaXRpdmVfMVxuMzcgLSBtb3llbm5lRGVmaW5pdGl2ZV8yXHRcdFx0MzggLSBtb3llbm5lRGVmaW5pdGl2ZV8zXHRcdFx0MzkgLSBtb3llbm5lRGVmaW5pdGl2ZV80XG40MCAtIG1veWVubmVEZWZpbml0aXZlXzVcdFx0XHQ0MSAtIG1veWVubmVEZWZpbml0aXZlXzZcdFx0XHQ0MiAtIG1veWVubmVEZWZpbml0aXZlXzdcbjQzIC0gbW95ZW5uZURlZmluaXRpdmVfOFx0XHRcdDQ0IC0gbW95ZW5uZURlZmluaXRpdmVfOVx0XHRcdDQ1IC0gY3ljbGVzXzFcbjQ2IC0gY3ljbGVzXzJcdFx0XHQ0NyAtIGN5Y2xlc18zXHRcdFx0NDggLSBjeWNsZXNfNFxuNDkgLSBjeWNsZXNfNVx0XHRcdDUwIC0gY3ljbGVzXzZcdFx0XHQ1MSAtIGN5Y2xlc183XG41MiAtIGN5Y2xlc184XHRcdFx0NTMgLSBjeWNsZXNfOVx0XHRcdDU0IC0gY29kZUZpbGllcmVfMVxuNTUgLSBjb2RlRmlsaWVyZV8yXHRcdFx0NTYgLSBjb2RlRmlsaWVyZV8zXHRcdFx0NTcgLSBjb2RlRmlsaWVyZV80XG41OCAtIGNvZGVGaWxpZXJlXzVcdFx0XHQ1OSAtIGNvZGVGaWxpZXJlXzZcdFx0XHQ2MCAtIGNvZGVGaWxpZXJlXzdcbjYxIC0gY29kZUZpbGllcmVfOFx0XHRcdDYyIC0gY29kZUZpbGllcmVfOVx0XHRcdDYzIC0gY29kZUVjb2xlXzFcbjY0IC0gY29kZUVjb2xlXzJcdFx0XHQ2NSAtIGNvZGVFY29sZV8zXHRcdFx0NjYgLSBjb2RlRWNvbGVfNFxuNjcgLSBjb2RlRWNvbGVfNVx0XHRcdDY4IC0gY29kZUVjb2xlXzZcdFx0XHQ2OSAtIGNvZGVFY29sZV83XG43MCAtIGNvZGVFY29sZV84XHRcdFx0NzEgLSBjb2RlRWNvbGVfOVx0XHRcdDcyIC0gMUVSRV9BTkdMQUlTXG43MyAtIDFFUkVfRlJBTkNBSVNcdFx0XHQ3NCAtIDFFUkVfTUFUSEVNQVRJUVVFU1x0XHRcdDc1IC0gMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNcbjc2IC0gMUVSRV9TVlRcdFx0XHQ3NyAtIDJOREVfQU5HTEFJU1x0XHRcdDc4IC0gMk5ERV9GUkFOQ0FJU1xuNzkgLSAyTkRFX01BVEhFTUFUSVFVRVNcdFx0XHQ4MCAtIDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTXHRcdFx0ODEgLSAyTkRFX1NWVFxuODIgLSBCQUNfQU5HTEFJU1x0XHRcdDgzIC0gQkFDX0ZSQU5DQUlTXHRcdFx0ODQgLSBCQUNfTUFUSEVNQVRJUVVFU1xuODUgLSBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTXHRcdFx0ODYgLSBCQUNfU1ZUXHRcdFx0ODcgLSBUTEVfQU5HTEFJU1xuODggLSBUTEVfRlJBTkNBSVNcdFx0XHQ4OSAtIFRMRV9NQVRIRU1BVElRVUVTXHRcdFx0OTAgLSBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTXG45MSAtIFRMRV9TVlRcdFx0XHRcbiJ9 -->

```
1 - identifiantCandidat			2 - etablissementOrigine			3 - dateNaissance
4 - genre			5 - Nationalite			6 - serie
7 - mentionAuBac			8 - redoublementTerminale			9 - rangEnTerminale
10 - age			11 - annee			12 - DREN
13 - admissible			14 - FiliereAccueil			15 - Cycle
16 - EcoleAccueil			17 - admis			18 - moyenneDossier_1
19 - moyenneDossier_2			20 - moyenneDossier_3			21 - moyenneDossier_4
22 - moyenneDossier_5			23 - moyenneDossier_6			24 - moyenneDossier_7
25 - moyenneDossier_8			26 - moyenneDossier_9			27 - moyenneTest_1
28 - moyenneTest_2			29 - moyenneTest_3			30 - moyenneTest_4
31 - moyenneTest_5			32 - moyenneTest_6			33 - moyenneTest_7
34 - moyenneTest_8			35 - moyenneTest_9			36 - moyenneDefinitive_1
37 - moyenneDefinitive_2			38 - moyenneDefinitive_3			39 - moyenneDefinitive_4
40 - moyenneDefinitive_5			41 - moyenneDefinitive_6			42 - moyenneDefinitive_7
43 - moyenneDefinitive_8			44 - moyenneDefinitive_9			45 - cycles_1
46 - cycles_2			47 - cycles_3			48 - cycles_4
49 - cycles_5			50 - cycles_6			51 - cycles_7
52 - cycles_8			53 - cycles_9			54 - codeFiliere_1
55 - codeFiliere_2			56 - codeFiliere_3			57 - codeFiliere_4
58 - codeFiliere_5			59 - codeFiliere_6			60 - codeFiliere_7
61 - codeFiliere_8			62 - codeFiliere_9			63 - codeEcole_1
64 - codeEcole_2			65 - codeEcole_3			66 - codeEcole_4
67 - codeEcole_5			68 - codeEcole_6			69 - codeEcole_7
70 - codeEcole_8			71 - codeEcole_9			72 - 1ERE_ANGLAIS
73 - 1ERE_FRANCAIS			74 - 1ERE_MATHEMATIQUES			75 - 1ERE_SCIENCES PHYSIQUES
76 - 1ERE_SVT			77 - 2NDE_ANGLAIS			78 - 2NDE_FRANCAIS
79 - 2NDE_MATHEMATIQUES			80 - 2NDE_SCIENCES PHYSIQUES			81 - 2NDE_SVT
82 - BAC_ANGLAIS			83 - BAC_FRANCAIS			84 - BAC_MATHEMATIQUES
85 - BAC_SCIENCES PHYSIQUES			86 - BAC_SVT			87 - TLE_ANGLAIS
88 - TLE_FRANCAIS			89 - TLE_MATHEMATIQUES			90 - TLE_SCIENCES PHYSIQUES
91 - TLE_SVT			
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGYgPSBkZlssIC1jKDE6MywgNTo2LCAxMiwgMTQsICAxNTo1MywgNjM6NzEpXVxuZGYkcmFuZ0VuVGVybWluYWxlW2RmJHJhbmdFblRlcm1pbmFsZSAhPVwiMVwiICYgZGYkcmFuZ0VuVGVybWluYWxlICE9IFwiMlwiICYgZGYkcmFuZ0VuVGVybWluYWxlICE9IFwiM1wiXSA9IFwiMFwiXG5kZiA9IGNiaW5kKGRmJT4lc2VsZWN0KC1hZG1pc3NpYmxlKSwgZGYlPiVzZWxlY3QoYWRtaXNzaWJsZSkpXG5zdHIoZGYpXG5gYGAifQ== -->

```r
df = df[, -c(1:3, 5:6, 12, 14,  15:53, 63:71)]
df$rangEnTerminale[df$rangEnTerminale !="1" & df$rangEnTerminale != "2" & df$rangEnTerminale != "3"] = "0"
df = cbind(df%>%select(-admissible), df%>%select(admissible))
str(df)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiJ2RhdGEuZnJhbWUnOlx0NjIxOSBvYnMuIG9mICAzNiB2YXJpYWJsZXM6XG4gJCBnZW5yZSAgICAgICAgICAgICAgICAgIDogY2hyICBcIk1cIiBcIk1cIiBcIk1cIiBcIk1cIiAuLi5cbiAkIG1lbnRpb25BdUJhYyAgICAgICAgICAgOiBjaHIgIFwiQVNTRVotQklFTlwiIFwiQVNTRVotQklFTlwiIFwiUEFTU0FCTEVcIiBcIkFTU0VaLUJJRU5cIiAuLi5cbiAkIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgOiBjaHIgIFwiTk9OXCIgXCJOT05cIiBcIk5PTlwiIFwiTk9OXCIgLi4uXG4gJCByYW5nRW5UZXJtaW5hbGUgICAgICAgIDogY2hyICBcIjFcIiBcIjBcIiBcIjFcIiBcIjJcIiAuLi5cbiAkIGFnZSAgICAgICAgICAgICAgICAgICAgOiBudW0gIDE4IDE4IDE4IDE3IDE3IDE5IDE3IDE3IDIwIDE3IC4uLlxuICQgYW5uZWUgICAgICAgICAgICAgICAgICA6IG51bSAgMjAxOCAyMDE4IDIwMTggMjAxOCAyMDE4IC4uLlxuICQgY29kZUZpbGllcmVfMSAgICAgICAgICA6IGNociAgXCJCQ1BTVFwiIFwiQkNQU1RcIiBcIkJDUFNUXCIgXCJCQ1BTVFwiIC4uLlxuICQgY29kZUZpbGllcmVfMiAgICAgICAgICA6IGNociAgXCJDQUVcIiBcIkNBRVwiIFwiQ0FFXCIgXCJFQ1NcIiAuLi5cbiAkIGNvZGVGaWxpZXJlXzMgICAgICAgICAgOiBjaHIgIFwiRUNTXCIgXCJFQ1NcIiBcIkVDU1wiIFwiYXVjdW5cIiAuLi5cbiAkIGNvZGVGaWxpZXJlXzQgICAgICAgICAgOiBjaHIgIFwiR0NcIiBcIkdDXCIgXCJHQ1wiIFwiYXVjdW5cIiAuLi5cbiAkIGNvZGVGaWxpZXJlXzUgICAgICAgICAgOiBjaHIgIFwiTUdcIiBcIk1HXCIgXCJNR1wiIFwiYXVjdW5cIiAuLi5cbiAkIGNvZGVGaWxpZXJlXzYgICAgICAgICAgOiBjaHIgIFwiU1RHSVwiIFwiU1RHSVwiIFwiU1RHSVwiIFwiYXVjdW5cIiAuLi5cbiAkIGNvZGVGaWxpZXJlXzcgICAgICAgICAgOiBjaHIgIFwiU1RHUFwiIFwiU1RHUFwiIFwiU1RHUFwiIFwiYXVjdW5cIiAuLi5cbiAkIGNvZGVGaWxpZXJlXzggICAgICAgICAgOiBjaHIgIFwiU1RJQ1wiIFwiU1RJQ1wiIFwiU1RJQ1wiIFwiYXVjdW5cIiAuLi5cbiAkIGNvZGVGaWxpZXJlXzkgICAgICAgICAgOiBjaHIgIFwiVFNBXCIgXCJUU0FcIiBcIlRTQVwiIFwiYXVjdW5cIiAuLi5cbiAkIDFFUkVfQU5HTEFJUyAgICAgICAgICAgOiBjaHIgIFwiMTYuODdcIiBcIjEyLjc5XCIgXCIxMS4wMVwiIFwiMTUuMDBcIiAuLi5cbiAkIDFFUkVfRlJBTkNBSVMgICAgICAgICAgOiBjaHIgIFwiMTIuOTNcIiBcIjEwLjU0XCIgXCIxMC4zM1wiIFwiMTIuMzBcIiAuLi5cbiAkIDFFUkVfTUFUSEVNQVRJUVVFUyAgICAgOiBjaHIgIFwiMTMuNTZcIiBcIjE0LjA2XCIgXCIxMy42NVwiIFwiMTMuNjRcIiAuLi5cbiAkIDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTOiBjaHIgIFwiMTYuNTNcIiBcIjkuOTRcIiBcIjE1LjE2XCIgXCIxMy44N1wiIC4uLlxuICQgMUVSRV9TVlQgICAgICAgICAgICAgICA6IGNociAgXCIxNi40M1wiIFwiMTMuNTlcIiBcIjEzLjI2XCIgXCIxMy4zMFwiIC4uLlxuICQgMk5ERV9BTkdMQUlTICAgICAgICAgICA6IGNociAgXCIxNy4xNVwiIFwiMTIuODhcIiBcIjkuOTBcIiBcIjEzLjAwXCIgLi4uXG4gJCAyTkRFX0ZSQU5DQUlTICAgICAgICAgIDogY2hyICBcIjEzLjE3XCIgXCIxMS42NVwiIFwiMTAuMDRcIiBcIjEyLjQ3XCIgLi4uXG4gJCAyTkRFX01BVEhFTUFUSVFVRVMgICAgIDogY2hyICBcIjE0LjkzXCIgXCIxMS43OVwiIFwiMTMuOTBcIiBcIjE1LjA1XCIgLi4uXG4gJCAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFUzogY2hyICBcIjEzLjM3XCIgXCIxNC4yOFwiIFwiMTIuNDVcIiBcIjEyLjM5XCIgLi4uXG4gJCAyTkRFX1NWVCAgICAgICAgICAgICAgIDogY2hyICBcIjE0LjkwXCIgXCIxMi40MlwiIFwiMTEuNjZcIiBcIjEyLjQ0XCIgLi4uXG4gJCBCQUNfQU5HTEFJUyAgICAgICAgICAgIDogY2hyICBcIjE1LjAwXCIgXCIxMS4wMFwiIFwiMTIuMDBcIiBcIjE0LjAwXCIgLi4uXG4gJCBCQUNfRlJBTkNBSVMgICAgICAgICAgIDogY2hyICBcIjE0LjAwXCIgXCI4LjAwXCIgXCIxMy4wMFwiIFwiMTEuMDBcIiAuLi5cbiAkIEJBQ19NQVRIRU1BVElRVUVTICAgICAgOiBjaHIgIFwiMTAuMDBcIiBcIjExLjAwXCIgXCIxMC4wMFwiIFwiMTYuMDBcIiAuLi5cbiAkIEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVMgOiBjaHIgIFwiMTYuMDBcIiBcIjEwLjAwXCIgXCIxMS4wMFwiIFwiMTYuMDBcIiAuLi5cbiAkIEJBQ19TVlQgICAgICAgICAgICAgICAgOiBjaHIgIFwiMTQuMDBcIiBcIjE1LjAwXCIgXCI3LjAwXCIgXCIxMy4wMFwiIC4uLlxuICQgVExFX0FOR0xBSVMgICAgICAgICAgICA6IGNociAgXCIxNlwiIFwiOS4xXCIgXCIxNC40XCIgXCIxNy43M1wiIC4uLlxuICQgVExFX0ZSQU5DQUlTICAgICAgICAgICA6IGNociAgXCIxMi44XCIgXCI4LjY2XCIgXCIxMy45NlwiIFwiMTEuNjVcIiAuLi5cbiAkIFRMRV9NQVRIRU1BVElRVUVTICAgICAgOiBjaHIgIFwiMTQuN1wiIFwiMTIuNVwiIFwiMTMuODRcIiBcIjE2LjY0XCIgLi4uXG4gJCBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTIDogY2hyICBcIjE1LjJcIiBcIjEyLjM4XCIgXCIxNC45XCIgXCIxNS45NVwiIC4uLlxuICQgVExFX1NWVCAgICAgICAgICAgICAgICA6IGNociAgXCIxNS40NlwiIFwiMTIuMDFcIiBcIjEyLjM2XCIgXCIxMi4xXCIgLi4uXG4gJCBhZG1pc3NpYmxlICAgICAgICAgICAgIDogY2hyICBcIjFcIiBcIjBcIiBcIjBcIiBcIjFcIiAuLi5cbiJ9 -->

```
'data.frame':	6219 obs. of  36 variables:
 $ genre                  : chr  "M" "M" "M" "M" ...
 $ mentionAuBac           : chr  "ASSEZ-BIEN" "ASSEZ-BIEN" "PASSABLE" "ASSEZ-BIEN" ...
 $ redoublementTerminale  : chr  "NON" "NON" "NON" "NON" ...
 $ rangEnTerminale        : chr  "1" "0" "1" "2" ...
 $ age                    : num  18 18 18 17 17 19 17 17 20 17 ...
 $ annee                  : num  2018 2018 2018 2018 2018 ...
 $ codeFiliere_1          : chr  "BCPST" "BCPST" "BCPST" "BCPST" ...
 $ codeFiliere_2          : chr  "CAE" "CAE" "CAE" "ECS" ...
 $ codeFiliere_3          : chr  "ECS" "ECS" "ECS" "aucun" ...
 $ codeFiliere_4          : chr  "GC" "GC" "GC" "aucun" ...
 $ codeFiliere_5          : chr  "MG" "MG" "MG" "aucun" ...
 $ codeFiliere_6          : chr  "STGI" "STGI" "STGI" "aucun" ...
 $ codeFiliere_7          : chr  "STGP" "STGP" "STGP" "aucun" ...
 $ codeFiliere_8          : chr  "STIC" "STIC" "STIC" "aucun" ...
 $ codeFiliere_9          : chr  "TSA" "TSA" "TSA" "aucun" ...
 $ 1ERE_ANGLAIS           : chr  "16.87" "12.79" "11.01" "15.00" ...
 $ 1ERE_FRANCAIS          : chr  "12.93" "10.54" "10.33" "12.30" ...
 $ 1ERE_MATHEMATIQUES     : chr  "13.56" "14.06" "13.65" "13.64" ...
 $ 1ERE_SCIENCES PHYSIQUES: chr  "16.53" "9.94" "15.16" "13.87" ...
 $ 1ERE_SVT               : chr  "16.43" "13.59" "13.26" "13.30" ...
 $ 2NDE_ANGLAIS           : chr  "17.15" "12.88" "9.90" "13.00" ...
 $ 2NDE_FRANCAIS          : chr  "13.17" "11.65" "10.04" "12.47" ...
 $ 2NDE_MATHEMATIQUES     : chr  "14.93" "11.79" "13.90" "15.05" ...
 $ 2NDE_SCIENCES PHYSIQUES: chr  "13.37" "14.28" "12.45" "12.39" ...
 $ 2NDE_SVT               : chr  "14.90" "12.42" "11.66" "12.44" ...
 $ BAC_ANGLAIS            : chr  "15.00" "11.00" "12.00" "14.00" ...
 $ BAC_FRANCAIS           : chr  "14.00" "8.00" "13.00" "11.00" ...
 $ BAC_MATHEMATIQUES      : chr  "10.00" "11.00" "10.00" "16.00" ...
 $ BAC_SCIENCES PHYSIQUES : chr  "16.00" "10.00" "11.00" "16.00" ...
 $ BAC_SVT                : chr  "14.00" "15.00" "7.00" "13.00" ...
 $ TLE_ANGLAIS            : chr  "16" "9.1" "14.4" "17.73" ...
 $ TLE_FRANCAIS           : chr  "12.8" "8.66" "13.96" "11.65" ...
 $ TLE_MATHEMATIQUES      : chr  "14.7" "12.5" "13.84" "16.64" ...
 $ TLE_SCIENCES PHYSIQUES : chr  "15.2" "12.38" "14.9" "15.95" ...
 $ TLE_SVT                : chr  "15.46" "12.01" "12.36" "12.1" ...
 $ admissible             : chr  "1" "0" "0" "1" ...
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZm9yKGkgaW4gNzoxNSkge1xuICBkZltpcy5uYShkZlssIGldKSwgaV0gPSBcImF1Y3VuXCJcbn1cbmBgYCJ9 -->

```r
for(i in 7:15) {
  df[is.na(df[, i]), i] = "aucun"
}
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuayA9IDFcbmZvciAoaSBpbiBjb2xuYW1lcyhkZikpIHtcbiAgICBpZihrID4gMTUpIHtcbiAgICAgICNkZltpcy5uYShkZl9jaG9peFssIGldKSwgaV0gPSBcIjBcIlxuICAgICAgZGZbLCBjb2xuYW1lcyhkZiU+JXNlbGVjdChpKSlbMV1dID0gYXMuZG91YmxlKHVubGlzdChkZiU+JXNlbGVjdChpKSkpXG4gICAgfSBlbHNlIHtcbiAgICAgICNkZltpcy5uYShkZlssIGldKSwgaV0gPSBcImF1Y3VuXCJcbiAgICAgIGRmWywgY29sbmFtZXMoZGYlPiVzZWxlY3QoaSkpWzFdXSA9IGFzLmZhY3Rvcih1bmxpc3QoZGYlPiVzZWxlY3QoaSkpKVxuICAgIH1cbiAgXG4gIGsgPSBrICsgMVxufVxuYGBgIn0= -->

```r
k = 1
for (i in colnames(df)) {
    if(k > 15) {
      #df[is.na(df_choix[, i]), i] = "0"
      df[, colnames(df%>%select(i))[1]] = as.double(unlist(df%>%select(i)))
    } else {
      #df[is.na(df[, i]), i] = "aucun"
      df[, colnames(df%>%select(i))[1]] = as.factor(unlist(df%>%select(i)))
    }
  
  k = k + 1
}
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiTm90ZTogVXNpbmcgYW4gZXh0ZXJuYWwgdmVjdG9yIGluIHNlbGVjdGlvbnMgaXMgYW1iaWd1b3VzLlxuaSBVc2UgYGFsbF9vZihpKWAgaW5zdGVhZCBvZiBgaWAgdG8gc2lsZW5jZSB0aGlzIG1lc3NhZ2UuXG5pIFNlZSA8aHR0cHM6Ly90aWR5c2VsZWN0LnItbGliLm9yZy9yZWZlcmVuY2UvZmFxLWV4dGVybmFsLXZlY3Rvci5odG1sPi5cblRoaXMgbWVzc2FnZSBpcyBkaXNwbGF5ZWQgb25jZSBwZXIgc2Vzc2lvbi5cbiJ9 -->

```
Note: Using an external vector in selections is ambiguous.
i Use `all_of(i)` instead of `i` to silence this message.
i See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
This message is displayed once per session.
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucm0oaylcbnJtKGkpXG5ybShzZWVfY29sX3dpdGhfaW5kZXgpXG5zdHIoZGYpXG5gYGAifQ== -->

```r
rm(k)
rm(i)
rm(see_col_with_index)
str(df)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiJ2RhdGEuZnJhbWUnOlx0NjIxOSBvYnMuIG9mICAzNiB2YXJpYWJsZXM6XG4gJCBnZW5yZSAgICAgICAgICAgICAgICAgIDogRmFjdG9yIHcvIDIgbGV2ZWxzIFwiRlwiLFwiTVwiOiAyIDIgMiAyIDIgMiAyIDIgMiAyIC4uLlxuICQgbWVudGlvbkF1QmFjICAgICAgICAgICA6IEZhY3RvciB3LyA0IGxldmVscyBcIkFTU0VaLUJJRU5cIixcIkJJRU5cIiwuLjogMSAxIDMgMSAxIDEgMSAxIDEgMSAuLi5cbiAkIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgOiBGYWN0b3Igdy8gMiBsZXZlbHMgXCJOT05cIixcIk9VSVwiOiAxIDEgMSAxIDEgMSAxIDIgMSAxIC4uLlxuICQgcmFuZ0VuVGVybWluYWxlICAgICAgICA6IEZhY3RvciB3LyA0IGxldmVscyBcIjBcIixcIjFcIixcIjJcIixcIjNcIjogMiAxIDIgMyAxIDIgNCAyIDEgMyAuLi5cbiAkIGFnZSAgICAgICAgICAgICAgICAgICAgOiBGYWN0b3Igdy8gMTIgbGV2ZWxzIFwiMTFcIixcIjE0XCIsXCIxNVwiLC4uOiA2IDYgNiA1IDUgNyA1IDUgOCA1IC4uLlxuICQgYW5uZWUgICAgICAgICAgICAgICAgICA6IEZhY3RvciB3LyAyIGxldmVscyBcIjIwMTdcIixcIjIwMThcIjogMiAyIDIgMiAyIDIgMiAyIDIgMiAuLi5cbiAkIGNvZGVGaWxpZXJlXzEgICAgICAgICAgOiBGYWN0b3Igdy8gOSBsZXZlbHMgXCJCQ1BTVFwiLFwiQ0FFXCIsLi46IDEgMSAxIDEgMSAxIDIgMiAxIDEgLi4uXG4gJCBjb2RlRmlsaWVyZV8yICAgICAgICAgIDogRmFjdG9yIHcvIDEwIGxldmVscyBcImF1Y3VuXCIsXCJCQ1BTVFwiLC4uOiAzIDMgMyA0IDMgMyA1IDUgNCAzIC4uLlxuICQgY29kZUZpbGllcmVfMyAgICAgICAgICA6IEZhY3RvciB3LyAxMCBsZXZlbHMgXCJhdWN1blwiLFwiQkNQU1RcIiwuLjogNCA0IDQgMSA0IDQgNiA2IDEgNCAuLi5cbiAkIGNvZGVGaWxpZXJlXzQgICAgICAgICAgOiBGYWN0b3Igdy8gMTAgbGV2ZWxzIFwiYXVjdW5cIixcIkJDUFNUXCIsLi46IDUgNSA1IDEgNSA1IDcgNyAxIDUgLi4uXG4gJCBjb2RlRmlsaWVyZV81ICAgICAgICAgIDogRmFjdG9yIHcvIDEwIGxldmVscyBcImF1Y3VuXCIsXCJCQ1BTVFwiLC4uOiA2IDYgNiAxIDYgNiA4IDggMSA2IC4uLlxuICQgY29kZUZpbGllcmVfNiAgICAgICAgICA6IEZhY3RvciB3LyAxMCBsZXZlbHMgXCJhdWN1blwiLFwiQkNQU1RcIiwuLjogNyA3IDcgMSA3IDcgOSA5IDEgNyAuLi5cbiAkIGNvZGVGaWxpZXJlXzcgICAgICAgICAgOiBGYWN0b3Igdy8gMTAgbGV2ZWxzIFwiYXVjdW5cIixcIkJDUFNUXCIsLi46IDggOCA4IDEgOCA4IDEwIDEwIDEgOCAuLi5cbiAkIGNvZGVGaWxpZXJlXzggICAgICAgICAgOiBGYWN0b3Igdy8gMTAgbGV2ZWxzIFwiYXVjdW5cIixcIkJDUFNUXCIsLi46IDkgOSA5IDEgOSA5IDEgMSAxIDkgLi4uXG4gJCBjb2RlRmlsaWVyZV85ICAgICAgICAgIDogRmFjdG9yIHcvIDEwIGxldmVscyBcImF1Y3VuXCIsXCJCQ1BTVFwiLC4uOiAxMCAxMCAxMCAxIDEwIDEwIDEgMSAxIDEwIC4uLlxuICQgMUVSRV9BTkdMQUlTICAgICAgICAgICA6IG51bSAgMTYuOSAxMi44IDExIDE1IDEwLjMgLi4uXG4gJCAxRVJFX0ZSQU5DQUlTICAgICAgICAgIDogbnVtICAxMi45IDEwLjUgMTAuMyAxMi4zIDEwLjQgLi4uXG4gJCAxRVJFX01BVEhFTUFUSVFVRVMgICAgIDogbnVtICAxMy42IDE0LjEgMTMuNiAxMy42IDEwLjYgLi4uXG4gJCAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFUzogbnVtICAxNi41MyA5Ljk0IDE1LjE2IDEzLjg3IDEzLjg4IC4uLlxuICQgMUVSRV9TVlQgICAgICAgICAgICAgICA6IG51bSAgMTYuNCAxMy42IDEzLjMgMTMuMyAxMy4xIC4uLlxuICQgMk5ERV9BTkdMQUlTICAgICAgICAgICA6IG51bSAgMTcuMSAxMi45IDkuOSAxMyAxMC4xIC4uLlxuICQgMk5ERV9GUkFOQ0FJUyAgICAgICAgICA6IG51bSAgMTMuMiAxMS42IDEwIDEyLjUgMTEuOSAuLi5cbiAkIDJOREVfTUFUSEVNQVRJUVVFUyAgICAgOiBudW0gIDE0LjkgMTEuOCAxMy45IDE1LjEgMTMuMSAuLi5cbiAkIDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTOiBudW0gIDEzLjQgMTQuMyAxMi40IDEyLjQgMTMuNSAuLi5cbiAkIDJOREVfU1ZUICAgICAgICAgICAgICAgOiBudW0gIDE0LjkgMTIuNCAxMS43IDEyLjQgOC45IC4uLlxuICQgQkFDX0FOR0xBSVMgICAgICAgICAgICA6IG51bSAgMTUgMTEgMTIgMTQgMTIgMTQgMTMgMTQgMTEgMTIgLi4uXG4gJCBCQUNfRlJBTkNBSVMgICAgICAgICAgIDogbnVtICAxNCA4IDEzIDExIDkgMTMgOCAxMSAxMCA5IC4uLlxuICQgQkFDX01BVEhFTUFUSVFVRVMgICAgICA6IG51bSAgMTAgMTEgMTAgMTYgMTEgMTEgOSAxNSAxMCAxMiAuLi5cbiAkIEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVMgOiBudW0gIDE2IDEwIDExIDE2IDE0IDEzIDEzIDE0IDE1IDE1IC4uLlxuICQgQkFDX1NWVCAgICAgICAgICAgICAgICA6IG51bSAgMTQgMTUgNyAxMyAxMyAxNyAxNiA5IDE2IDEzIC4uLlxuICQgVExFX0FOR0xBSVMgICAgICAgICAgICA6IG51bSAgMTYgOS4xIDE0LjQgMTcuNyAxMC40IC4uLlxuICQgVExFX0ZSQU5DQUlTICAgICAgICAgICA6IG51bSAgMTIuOCA4LjY2IDEzLjk2IDExLjY1IDEyLjYzIC4uLlxuICQgVExFX01BVEhFTUFUSVFVRVMgICAgICA6IG51bSAgMTQuNyAxMi41IDEzLjggMTYuNiAxMy43IC4uLlxuICQgVExFX1NDSUVOQ0VTIFBIWVNJUVVFUyA6IG51bSAgMTUuMiAxMi40IDE0LjkgMTUuOSAxMiAuLi5cbiAkIFRMRV9TVlQgICAgICAgICAgICAgICAgOiBudW0gIDE1LjUgMTIgMTIuNCAxMi4xIDEzLjIgLi4uXG4gJCBhZG1pc3NpYmxlICAgICAgICAgICAgIDogbnVtICAxIDAgMCAxIDAgMSAwIDEgMCAwIC4uLlxuIn0= -->

```
'data.frame':	6219 obs. of  36 variables:
 $ genre                  : Factor w/ 2 levels "F","M": 2 2 2 2 2 2 2 2 2 2 ...
 $ mentionAuBac           : Factor w/ 4 levels "ASSEZ-BIEN","BIEN",..: 1 1 3 1 1 1 1 1 1 1 ...
 $ redoublementTerminale  : Factor w/ 2 levels "NON","OUI": 1 1 1 1 1 1 1 2 1 1 ...
 $ rangEnTerminale        : Factor w/ 4 levels "0","1","2","3": 2 1 2 3 1 2 4 2 1 3 ...
 $ age                    : Factor w/ 12 levels "11","14","15",..: 6 6 6 5 5 7 5 5 8 5 ...
 $ annee                  : Factor w/ 2 levels "2017","2018": 2 2 2 2 2 2 2 2 2 2 ...
 $ codeFiliere_1          : Factor w/ 9 levels "BCPST","CAE",..: 1 1 1 1 1 1 2 2 1 1 ...
 $ codeFiliere_2          : Factor w/ 10 levels "aucun","BCPST",..: 3 3 3 4 3 3 5 5 4 3 ...
 $ codeFiliere_3          : Factor w/ 10 levels "aucun","BCPST",..: 4 4 4 1 4 4 6 6 1 4 ...
 $ codeFiliere_4          : Factor w/ 10 levels "aucun","BCPST",..: 5 5 5 1 5 5 7 7 1 5 ...
 $ codeFiliere_5          : Factor w/ 10 levels "aucun","BCPST",..: 6 6 6 1 6 6 8 8 1 6 ...
 $ codeFiliere_6          : Factor w/ 10 levels "aucun","BCPST",..: 7 7 7 1 7 7 9 9 1 7 ...
 $ codeFiliere_7          : Factor w/ 10 levels "aucun","BCPST",..: 8 8 8 1 8 8 10 10 1 8 ...
 $ codeFiliere_8          : Factor w/ 10 levels "aucun","BCPST",..: 9 9 9 1 9 9 1 1 1 9 ...
 $ codeFiliere_9          : Factor w/ 10 levels "aucun","BCPST",..: 10 10 10 1 10 10 1 1 1 10 ...
 $ 1ERE_ANGLAIS           : num  16.9 12.8 11 15 10.3 ...
 $ 1ERE_FRANCAIS          : num  12.9 10.5 10.3 12.3 10.4 ...
 $ 1ERE_MATHEMATIQUES     : num  13.6 14.1 13.6 13.6 10.6 ...
 $ 1ERE_SCIENCES PHYSIQUES: num  16.53 9.94 15.16 13.87 13.88 ...
 $ 1ERE_SVT               : num  16.4 13.6 13.3 13.3 13.1 ...
 $ 2NDE_ANGLAIS           : num  17.1 12.9 9.9 13 10.1 ...
 $ 2NDE_FRANCAIS          : num  13.2 11.6 10 12.5 11.9 ...
 $ 2NDE_MATHEMATIQUES     : num  14.9 11.8 13.9 15.1 13.1 ...
 $ 2NDE_SCIENCES PHYSIQUES: num  13.4 14.3 12.4 12.4 13.5 ...
 $ 2NDE_SVT               : num  14.9 12.4 11.7 12.4 8.9 ...
 $ BAC_ANGLAIS            : num  15 11 12 14 12 14 13 14 11 12 ...
 $ BAC_FRANCAIS           : num  14 8 13 11 9 13 8 11 10 9 ...
 $ BAC_MATHEMATIQUES      : num  10 11 10 16 11 11 9 15 10 12 ...
 $ BAC_SCIENCES PHYSIQUES : num  16 10 11 16 14 13 13 14 15 15 ...
 $ BAC_SVT                : num  14 15 7 13 13 17 16 9 16 13 ...
 $ TLE_ANGLAIS            : num  16 9.1 14.4 17.7 10.4 ...
 $ TLE_FRANCAIS           : num  12.8 8.66 13.96 11.65 12.63 ...
 $ TLE_MATHEMATIQUES      : num  14.7 12.5 13.8 16.6 13.7 ...
 $ TLE_SCIENCES PHYSIQUES : num  15.2 12.4 14.9 15.9 12 ...
 $ TLE_SVT                : num  15.5 12 12.4 12.1 13.2 ...
 $ admissible             : num  1 0 0 1 0 1 0 1 0 0 ...
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuY2F0KFxuICBcInRvdGFsIGNhbmRpZGF0OlwiLCBucm93KGRmKSwgXG4gIFwiXFxudG90YWwgcGFyIGFubsOpZTpcXG5cXHRjYW5kaWRhdCAyMDE3OlwiLCBucm93KGRmJT4lZmlsdGVyKGFubmVlID09IDIwMTcpKSwgXG4gIFwiXFxuXFx0XFx0Y2FuZGlkYXQgYWRtaXNzaWJsZTpcIiwgbnJvdyhkZiU+JWZpbHRlcihhbm5lZSA9PSAyMDE3ICYgYWRtaXNzaWJsZSA9PSAxKSksIFxuICBcIlxcblxcdFxcdGNhbmRpZGF0IG5vbi1hZG1pc3NpYmxlOlwiLCBucm93KGRmJT4lZmlsdGVyKGFubmVlID09IDIwMTcgJiBhZG1pc3NpYmxlID09IDApKSwgXG4gIFwiXFxuXFx0Y2FuZGlkYXQgMjAxODpcIiwgbnJvdyhkZiU+JWZpbHRlcihhbm5lZSA9PSAyMDE4KSksXG4gIFwiXFxuXFx0XFx0Y2FuZGlkYXQgYWRtaXNzaWJsZTpcIiwgbnJvdyhkZiU+JWZpbHRlcihhbm5lZSA9PSAyMDE4ICYgYWRtaXNzaWJsZSA9PSAxKSksIFxuICBcIlxcblxcdFxcdGNhbmRpZGF0IG5vbi1hZG1pc3NpYmxlOlwiLCBucm93KGRmJT4lZmlsdGVyKGFubmVlID09IDIwMTggJiBhZG1pc3NpYmxlID09IDApKVxuKVxuYGBgIn0= -->

```r
cat(
  "total candidat:", nrow(df), 
  "\ntotal par année:\n\tcandidat 2017:", nrow(df%>%filter(annee == 2017)), 
  "\n\t\tcandidat admissible:", nrow(df%>%filter(annee == 2017 & admissible == 1)), 
  "\n\t\tcandidat non-admissible:", nrow(df%>%filter(annee == 2017 & admissible == 0)), 
  "\n\tcandidat 2018:", nrow(df%>%filter(annee == 2018)),
  "\n\t\tcandidat admissible:", nrow(df%>%filter(annee == 2018 & admissible == 1)), 
  "\n\t\tcandidat non-admissible:", nrow(df%>%filter(annee == 2018 & admissible == 0))
)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoidG90YWwgY2FuZGlkYXQ6IDYyMTkgXG50b3RhbCBwYXIgYW5uw6llOlxuXHRjYW5kaWRhdCAyMDE3OiAzNjIzIFxuXHRcdGNhbmRpZGF0IGFkbWlzc2libGU6IDQ3NiBcblx0XHRjYW5kaWRhdCBub24tYWRtaXNzaWJsZTogMzE0NyBcblx0Y2FuZGlkYXQgMjAxODogMjU5NiBcblx0XHRjYW5kaWRhdCBhZG1pc3NpYmxlOiA0NTAgXG5cdFx0Y2FuZGlkYXQgbm9uLWFkbWlzc2libGU6IDIxNDZcbiJ9 -->

```
total candidat: 6219 
total par année:
	candidat 2017: 3623 
		candidat admissible: 476 
		candidat non-admissible: 3147 
	candidat 2018: 2596 
		candidat admissible: 450 
		candidat non-admissible: 2146
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc2V0LnNlZWQoMSlcbnByb3BfYWRtXzIwMTcgPSByb3VuZCgobnJvdyhkZiU+JWZpbHRlcihhbm5lZSA9PSAyMDE3ICYgYWRtaXNzaWJsZSA9PSAxKSkvbnJvdyhkZiU+JWZpbHRlcihhbm5lZSA9PSAyMDE3KSkpICogKG5yb3coZGYlPiVmaWx0ZXIoYW5uZWUgPT0gMjAxNykpL25yb3coZGYpKSAqIDEwMClcbnByb3Bfbm9uX2FkbV8yMDE3ID0gcm91bmQoKG5yb3coZGYlPiVmaWx0ZXIoYW5uZWUgPT0gMjAxNyAmIGFkbWlzc2libGUgPT0gMCkpL25yb3coZGYlPiVmaWx0ZXIoYW5uZWUgPT0gMjAxNykpKSAqIChucm93KGRmJT4lZmlsdGVyKGFubmVlID09IDIwMTcpKS9ucm93KGRmKSkgKiAxMDApXG5cbnByb3BfYWRtXzIwMTggPSByb3VuZCgobnJvdyhkZiU+JWZpbHRlcihhbm5lZSA9PSAyMDE4ICYgYWRtaXNzaWJsZSA9PSAxKSkvbnJvdyhkZiU+JWZpbHRlcihhbm5lZSA9PSAyMDE4KSkpICogKG5yb3coZGYlPiVmaWx0ZXIoYW5uZWUgPT0gMjAxOCkpL25yb3coZGYpKSAqIDEwMClcbnByb3Bfbm9uX2FkbV8yMDE4ID0gMTAwIC0gcHJvcF9hZG1fMjAxOCAtIHByb3BfYWRtXzIwMTcgLSBwcm9wX25vbl9hZG1fMjAxN1xuXG5uYl90b3RhbF90cmFpbiA9IHJvdW5kKChucm93KGRmKSo3MCkvMTAwKVxuXG5cblxudG1wID0gZGYlPiVmaWx0ZXIoYW5uZWUgPT0gMjAxNyAmIGFkbWlzc2libGUgPT0gMSlcbmxpc3RlX2FkbV8yMDE3ID0gc2FtcGxlKG5yb3codG1wKSwgbmJfdG90YWxfdHJhaW4gKiBwcm9wX2FkbV8yMDE3IC8gMTAwLCByZXBsYWNlID0gRkFMU0UpXG50cmFpbiA9IHRtcCU+JXNlbGVjdCgtYW5uZWUpXG5cbnRtcCA9IGRmJT4lZmlsdGVyKGFubmVlID09IDIwMTcgJiBhZG1pc3NpYmxlID09IDApXG5saXN0ZV9ub25fYWRtXzIwMTcgPSBzYW1wbGUobnJvdyh0bXApLCBuYl90b3RhbF90cmFpbiAqIHByb3Bfbm9uX2FkbV8yMDE3IC8gMTAwLCByZXBsYWNlID0gRkFMU0UpXG50cmFpbiA9IHJiaW5kKHRyYWluLCB0bXBbbGlzdGVfbm9uX2FkbV8yMDE3LCBdJT4lc2VsZWN0KC1hbm5lZSkpXG5cbnRtcCA9IGRmJT4lZmlsdGVyKGFubmVlID09IDIwMTggJiBhZG1pc3NpYmxlID09IDEpXG5saXN0ZV9hZG1fMjAxOCA9IHNhbXBsZShucm93KHRtcCksIG5iX3RvdGFsX3RyYWluICogcHJvcF9hZG1fMjAxOCAvIDEwMCwgcmVwbGFjZSA9IEZBTFNFKVxudHJhaW4gPSByYmluZCh0cmFpbiwgdG1wW2xpc3RlX2FkbV8yMDE4LCBdJT4lc2VsZWN0KC1hbm5lZSkpXG5cbnRtcCA9IGRmJT4lZmlsdGVyKGFubmVlID09IDIwMTggJiBhZG1pc3NpYmxlID09IDApXG5saXN0ZV9ub25fYWRtXzIwMTggPSBzYW1wbGUobnJvdyh0bXApLCBuYl90b3RhbF90cmFpbiAqIHByb3Bfbm9uX2FkbV8yMDE4IC8gMTAwLCByZXBsYWNlID0gRkFMU0UpXG50cmFpbiA9IHJiaW5kKHRyYWluLCB0bXBbbGlzdGVfbm9uX2FkbV8yMDE4LCBdJT4lc2VsZWN0KC1hbm5lZSkpXG5cblxudGVzdCA9IHNldGRpZmYoZGYlPiVzZWxlY3QoLWFubmVlKSwgdHJhaW4pXG5cbiNpbnRlcnNlY3QodHJhaW4sIGRmJT4lc2VsZWN0KC1hbm5lZSkpXG4jdHJhaW4gJWluJSBkZiU+JXNlbGVjdCgtYW5uZWUpXG4jc3VtKGRhdGEuZnJhbWUodHJhaW4pICVpbiUgZGF0YS5mcmFtZShkZiU+JXNlbGVjdCgtYW5uZWUpKSlcbmBgYCJ9 -->

```r
set.seed(1)
prop_adm_2017 = round((nrow(df%>%filter(annee == 2017 & admissible == 1))/nrow(df%>%filter(annee == 2017))) * (nrow(df%>%filter(annee == 2017))/nrow(df)) * 100)
prop_non_adm_2017 = round((nrow(df%>%filter(annee == 2017 & admissible == 0))/nrow(df%>%filter(annee == 2017))) * (nrow(df%>%filter(annee == 2017))/nrow(df)) * 100)

prop_adm_2018 = round((nrow(df%>%filter(annee == 2018 & admissible == 1))/nrow(df%>%filter(annee == 2018))) * (nrow(df%>%filter(annee == 2018))/nrow(df)) * 100)
prop_non_adm_2018 = 100 - prop_adm_2018 - prop_adm_2017 - prop_non_adm_2017

nb_total_train = round((nrow(df)*70)/100)



tmp = df%>%filter(annee == 2017 & admissible == 1)
liste_adm_2017 = sample(nrow(tmp), nb_total_train * prop_adm_2017 / 100, replace = FALSE)
train = tmp%>%select(-annee)

tmp = df%>%filter(annee == 2017 & admissible == 0)
liste_non_adm_2017 = sample(nrow(tmp), nb_total_train * prop_non_adm_2017 / 100, replace = FALSE)
train = rbind(train, tmp[liste_non_adm_2017, ]%>%select(-annee))

tmp = df%>%filter(annee == 2018 & admissible == 1)
liste_adm_2018 = sample(nrow(tmp), nb_total_train * prop_adm_2018 / 100, replace = FALSE)
train = rbind(train, tmp[liste_adm_2018, ]%>%select(-annee))

tmp = df%>%filter(annee == 2018 & admissible == 0)
liste_non_adm_2018 = sample(nrow(tmp), nb_total_train * prop_non_adm_2018 / 100, replace = FALSE)
train = rbind(train, tmp[liste_non_adm_2018, ]%>%select(-annee))


test = setdiff(df%>%select(-annee), train)

#intersect(train, df%>%select(-annee))
#train %in% df%>%select(-annee)
#sum(data.frame(train) %in% data.frame(df%>%select(-annee)))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->






<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucm0obGlzdGVfYWRtXzIwMTcpXG5ybShsaXN0ZV9hZG1fMjAxOClcbnJtKGxpc3RlX25vbl9hZG1fMjAxNylcbnJtKGxpc3RlX25vbl9hZG1fMjAxOClcbnJtKG5iX3RvdGFsX3RyYWluKVxucm0ocHJvcF9hZG1fMjAxNylcbnJtKHByb3BfYWRtXzIwMTgpXG5ybShwcm9wX25vbl9hZG1fMjAxNylcbnJtKHByb3Bfbm9uX2FkbV8yMDE4KVxucm0odG1wKVxuYGBgIn0= -->

```r
rm(liste_adm_2017)
rm(liste_adm_2018)
rm(liste_non_adm_2017)
rm(liste_non_adm_2018)
rm(nb_total_train)
rm(prop_adm_2017)
rm(prop_adm_2018)
rm(prop_non_adm_2017)
rm(prop_non_adm_2018)
rm(tmp)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->





<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmVnX2xvZyA8LSBnbG0oYWRtaXNzaWJsZX4uLGRhdGE9dHJhaW4sIGZhbWlseSA9IGJpbm9taWFsKGxvZ2l0KSlcbmBgYCJ9 -->

```r
reg_log <- glm(admissible~.,data=train, family = binomial(logit))
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc3VtbWFyeShyZWdfbG9nKVxuYGBgIn0= -->

```r
summary(reg_log)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5DYWxsOlxuZ2xtKGZvcm11bGEgPSBhZG1pc3NpYmxlIH4gLiwgZmFtaWx5ID0gYmlub21pYWwobG9naXQpLCBkYXRhID0gdHJhaW4pXG5cbkRldmlhbmNlIFJlc2lkdWFsczogXG4gICAgTWluICAgICAgIDFRICAgTWVkaWFuICAgICAgIDNRICAgICAgTWF4ICBcbi0zLjY5MDQgIC0wLjAyNjMgIC0wLjAwMTEgICAwLjAwMDAgICA0LjUwNjkgIFxuXG5Db2VmZmljaWVudHM6XG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRXN0aW1hdGUgU3RkLiBFcnJvciB6IHZhbHVlIFByKD58enwpICAgIFxuKEludGVyY2VwdCkgICAgICAgICAgICAgICAtMS4xMDRlKzAyICAxLjQ1NWUrMDMgIC0wLjA3NiAwLjkzOTUxMiAgICBcbmdlbnJlTSAgICAgICAgICAgICAgICAgICAgLTMuMjIyZS0wMSAgMi4zOTRlLTAxICAtMS4zNDYgMC4xNzgyOTIgICAgXG5tZW50aW9uQXVCYWNCSUVOICAgICAgICAgIC0xLjQyMWUtMDEgIDQuMTA4ZS0wMSAgLTAuMzQ2IDAuNzI5NDU1ICAgIFxubWVudGlvbkF1QmFjUEFTU0FCTEUgICAgICAtNS44OTBlLTAxICA0LjU0MmUtMDEgIC0xLjI5NyAwLjE5NDc1NyAgICBcbm1lbnRpb25BdUJhY1RSRVMgQklFTiAgICAgLTMuMTY2ZSswMCAgNS4zOTJlKzAyICAtMC4wMDYgMC45OTUzMTUgICAgXG5yZWRvdWJsZW1lbnRUZXJtaW5hbGVPVUkgIC0xLjg1MmUrMDAgIDMuODg2ZS0wMSAgLTQuNzY3IDEuODdlLTA2ICoqKlxucmFuZ0VuVGVybWluYWxlMSAgICAgICAgICAgMS42OTdlKzAwICAzLjU4NGUtMDEgICA0LjczNCAyLjIwZS0wNiAqKipcbnJhbmdFblRlcm1pbmFsZTIgICAgICAgICAgIDEuMDc5ZSswMCAgMy4yNjVlLTAxICAgMy4zMDUgMC4wMDA5NTEgKioqXG5yYW5nRW5UZXJtaW5hbGUzICAgICAgICAgICAxLjExMmUrMDAgIDMuNjk4ZS0wMSAgIDMuMDA3IDAuMDAyNjM4ICoqIFxuYWdlMTQgICAgICAgICAgICAgICAgICAgICAgOC41OTVlKzAwICAyLjA1OGUrMDMgICAwLjAwNCAwLjk5NjY2OCAgICBcbmFnZTE1ICAgICAgICAgICAgICAgICAgICAgIDEuMjE5ZSswMSAgMS40NTVlKzAzICAgMC4wMDggMC45OTMzMTcgICAgXG5hZ2UxNiAgICAgICAgICAgICAgICAgICAgICAxLjE1NWUrMDEgIDEuNDU1ZSswMyAgIDAuMDA4IDAuOTkzNjY5ICAgIFxuYWdlMTcgICAgICAgICAgICAgICAgICAgICAgMS4xOTllKzAxICAxLjQ1NWUrMDMgICAwLjAwOCAwLjk5MzQyNyAgICBcbmFnZTE4ICAgICAgICAgICAgICAgICAgICAgIDEuMjY3ZSswMSAgMS40NTVlKzAzICAgMC4wMDkgMC45OTMwNTYgICAgXG5hZ2UxOSAgICAgICAgICAgICAgICAgICAgICAxLjIyN2UrMDEgIDEuNDU1ZSswMyAgIDAuMDA4IDAuOTkzMjcxICAgIFxuYWdlMjAgICAgICAgICAgICAgICAgICAgICAgMS4xMzdlKzAxICAxLjQ1NWUrMDMgICAwLjAwOCAwLjk5Mzc2OCAgICBcbmFnZTIxICAgICAgICAgICAgICAgICAgICAgIDEuMTkwZSswMSAgMS40NTVlKzAzICAgMC4wMDggMC45OTM0NzQgICAgXG5hZ2UyMiAgICAgICAgICAgICAgICAgICAgICAxLjI2NGUrMDEgIDEuNDU1ZSswMyAgIDAuMDA5IDAuOTkzMDczICAgIFxuYWdlMjMgICAgICAgICAgICAgICAgICAgICAgMS4yMTBlKzAxICAxLjQ1NWUrMDMgICAwLjAwOCAwLjk5MzM2NiAgICBcbmFnZTI0ICAgICAgICAgICAgICAgICAgICAgIDEuMTA4ZSswMSAgMS40NTVlKzAzICAgMC4wMDggMC45OTM5MjMgICAgXG5jb2RlRmlsaWVyZV8xQ0FFICAgICAgICAgIC0xLjA2NmUrMDAgIDUuODA1ZS0wMSAgLTEuODM3IDAuMDY2MjU0IC4gIFxuY29kZUZpbGllcmVfMUVDUyAgICAgICAgICAtMy4yMjRlKzAwICA1LjQ0NGUtMDEgIC01LjkyMyAzLjE2ZS0wOSAqKipcbmNvZGVGaWxpZXJlXzFHQyAgICAgICAgICAgLTEuMTE2ZSswMCAgNS4zNTJlLTAxICAtMi4wODUgMC4wMzcwNzYgKiAgXG5jb2RlRmlsaWVyZV8xTUcgICAgICAgICAgIC0yLjAyN2UrMDAgIDcuMjI5ZS0wMSAgLTIuODAzIDAuMDA1MDU3ICoqIFxuY29kZUZpbGllcmVfMVNUR0kgICAgICAgICAtNS44MTBlLTAxICA5LjcxNWUtMDEgIC0wLjU5OCAwLjU0OTgwNiAgICBcbmNvZGVGaWxpZXJlXzFTVEdQICAgICAgICAgLTMuMTEwZSswMCAgMS43NzZlKzAwICAtMS43NTEgMC4wNzk5NDkgLiAgXG5jb2RlRmlsaWVyZV8xU1RJQyAgICAgICAgIC0xLjY4N2UrMDAgIDYuNzc0ZS0wMSAgLTIuNDkwIDAuMDEyNzcwICogIFxuY29kZUZpbGllcmVfMVRTQSAgICAgICAgICAtMi40NTVlLTAxICA5LjA2NGUtMDEgIC0wLjI3MSAwLjc4NjUwMiAgICBcbmNvZGVGaWxpZXJlXzJCQ1BTVCAgICAgICAgIDQuNDU2ZSswMCAgNi40NTllLTAxICAgNi44OTggNS4yNmUtMTIgKioqXG5jb2RlRmlsaWVyZV8yQ0FFICAgICAgICAgICAzLjk3NGUrMDAgIDYuNTE1ZS0wMSAgIDYuMTAwIDEuMDZlLTA5ICoqKlxuY29kZUZpbGllcmVfMkVDUyAgICAgICAgICAgMi40NjllKzAwICA1Ljk2NGUtMDEgICA0LjE0MSAzLjQ2ZS0wNSAqKipcbmNvZGVGaWxpZXJlXzJHQyAgICAgICAgICAgIDMuMDg3ZSswMCAgNy44MjFlLTAxICAgMy45NDcgNy45MmUtMDUgKioqXG5jb2RlRmlsaWVyZV8yTUcgICAgICAgICAgICAxLjY4OGUrMDAgIDcuMzIyZS0wMSAgIDIuMzA2IDAuMDIxMTI2ICogIFxuY29kZUZpbGllcmVfMlNUR0kgICAgICAgICAgMi4wNzBlKzAwICA3LjA2OGUtMDEgICAyLjkyOSAwLjAwMzM5NyAqKiBcbmNvZGVGaWxpZXJlXzJTVEdQICAgICAgICAgIDMuMzA4ZSswMCAgMS4wMDllKzAwICAgMy4yNzggMC4wMDEwNDYgKiogXG5jb2RlRmlsaWVyZV8yU1RJQyAgICAgICAgICAyLjU1OGUrMDAgIDcuMTgwZS0wMSAgIDMuNTYzIDAuMDAwMzY2ICoqKlxuY29kZUZpbGllcmVfMlRTQSAgICAgICAgICAgMy4wNDZlKzAwICA3LjA5MWUtMDEgICA0LjI5NSAxLjc1ZS0wNSAqKipcbmNvZGVGaWxpZXJlXzNCQ1BTVCAgICAgICAgIDkuNjQ3ZS0wMSAgOC41NjllLTAxICAgMS4xMjYgMC4yNjAyNjEgICAgXG5jb2RlRmlsaWVyZV8zQ0FFICAgICAgICAgIC0zLjA3MmUtMDEgIDUuODkyZS0wMSAgLTAuNTIxIDAuNjAyMTE1ICAgIFxuY29kZUZpbGllcmVfM0VDUyAgICAgICAgICAtMS4yMDhlKzAwICA5LjM0M2UtMDEgIC0xLjI5MiAwLjE5NjIwMSAgICBcbmNvZGVGaWxpZXJlXzNHQyAgICAgICAgICAgLTEuODM5ZS0wMSAgNi4zNDFlLTAxICAtMC4yOTAgMC43NzE3NzAgICAgXG5jb2RlRmlsaWVyZV8zTUcgICAgICAgICAgIC0xLjYxMWUtMDEgIDYuMTAxZS0wMSAgLTAuMjY0IDAuNzkxNjkxICAgIFxuY29kZUZpbGllcmVfM1NUR0kgICAgICAgICAgNi4zNjFlLTAxICA3LjEwNGUtMDEgICAwLjg5NSAwLjM3MDU1NyAgICBcbmNvZGVGaWxpZXJlXzNTVEdQICAgICAgICAgIDIuNzE5ZS0wMSAgOC4xNzFlLTAxICAgMC4zMzMgMC43MzkyODkgICAgXG5jb2RlRmlsaWVyZV8zU1RJQyAgICAgICAgIC03Ljk0MWUtMDIgIDUuOTQ4ZS0wMSAgLTAuMTM0IDAuODkzNzkxICAgIFxuY29kZUZpbGllcmVfM1RTQSAgICAgICAgICAgOS44OTNlLTAxICA2LjE2OWUtMDEgICAxLjYwNCAwLjEwODgwMiAgICBcbmNvZGVGaWxpZXJlXzRCQ1BTVCAgICAgICAgLTIuNDcyZS0wMSAgMS4xMzJlKzAwICAtMC4yMTggMC44MjcwOTcgICAgXG5jb2RlRmlsaWVyZV80Q0FFICAgICAgICAgIC00LjEyNGUtMDIgIDcuNTI1ZS0wMSAgLTAuMDU1IDAuOTU2MjkyICAgIFxuY29kZUZpbGllcmVfNEVDUyAgICAgICAgICAtNS42NTdlLTAyICA5Ljg4OGUtMDEgIC0wLjA1NyAwLjk1NDM3OSAgICBcbmNvZGVGaWxpZXJlXzRHQyAgICAgICAgICAgLTQuMjEzZS0wMSAgNy40MzFlLTAxICAtMC41NjcgMC41NzA3MjAgICAgXG5jb2RlRmlsaWVyZV80TUcgICAgICAgICAgIC0zLjY0M2UtMDEgIDguMjYwZS0wMSAgLTAuNDQxIDAuNjU5MTQ5ICAgIFxuY29kZUZpbGllcmVfNFNUR0kgICAgICAgICAtMi43ODZlLTAxICA3Ljc4NGUtMDEgIC0wLjM1OCAwLjcyMDQ0OCAgICBcbmNvZGVGaWxpZXJlXzRTVEdQICAgICAgICAgIDEuMjg5ZSswMCAgOS42NTZlLTAxICAgMS4zMzUgMC4xODE3NzIgICAgXG5jb2RlRmlsaWVyZV80U1RJQyAgICAgICAgICAzLjU3NGUtMDIgIDcuODA2ZS0wMSAgIDAuMDQ2IDAuOTYzNDgzICAgIFxuY29kZUZpbGllcmVfNFRTQSAgICAgICAgICAgMi42ODNlLTAxICA2Ljk1NWUtMDEgICAwLjM4NiAwLjY5OTY3NiAgICBcbmNvZGVGaWxpZXJlXzVCQ1BTVCAgICAgICAgIDIuNDI3ZSswMCAgMS45MTdlKzAwICAgMS4yNjYgMC4yMDU0NjYgICAgXG5jb2RlRmlsaWVyZV81Q0FFICAgICAgICAgICA2LjM3OGUtMDEgIDguMzQ2ZS0wMSAgIDAuNzY0IDAuNDQ0NzM4ICAgIFxuY29kZUZpbGllcmVfNUVDUyAgICAgICAgICAgMy4xMjdlLTAxICAxLjEyNWUrMDAgICAwLjI3OCAwLjc4MDk4NSAgICBcbmNvZGVGaWxpZXJlXzVHQyAgICAgICAgICAgLTUuNTU0ZS0wMiAgOS4yMTFlLTAxICAtMC4wNjAgMC45NTE5MjEgICAgXG5jb2RlRmlsaWVyZV81TUcgICAgICAgICAgIC00LjU1OGUtMDEgIDguOTg1ZS0wMSAgLTAuNTA3IDAuNjExOTk0ICAgIFxuY29kZUZpbGllcmVfNVNUR0kgICAgICAgICAgMi42NDdlLTAxICA5LjY2OWUtMDEgICAwLjI3NCAwLjc4NDIzMyAgICBcbmNvZGVGaWxpZXJlXzVTVEdQICAgICAgICAgIDEuMTU0ZSswMCAgOS40NjZlLTAxICAgMS4yMTkgMC4yMjI5NTYgICAgXG5jb2RlRmlsaWVyZV81U1RJQyAgICAgICAgIC0zLjU3MWUtMDEgIDkuNjYxZS0wMSAgLTAuMzcwIDAuNzExNjcxICAgIFxuY29kZUZpbGllcmVfNVRTQSAgICAgICAgICAgNi4zOTJlLTAxICA4LjAzOWUtMDEgICAwLjc5NSAwLjQyNjUwNiAgICBcbmNvZGVGaWxpZXJlXzZCQ1BTVCAgICAgICAgIDIuMjg4ZSswMCAgMS4yNDllKzAwICAgMS44MzIgMC4wNjcwMTYgLiAgXG5jb2RlRmlsaWVyZV82Q0FFICAgICAgICAgICAxLjQyM2UrMDAgIDkuNzc5ZS0wMSAgIDEuNDU1IDAuMTQ1NTc0ICAgIFxuY29kZUZpbGllcmVfNkVDUyAgICAgICAgICAtMi44MDRlLTAxICAxLjU5MmUrMDAgIC0wLjE3NiAwLjg2MDIwNSAgICBcbmNvZGVGaWxpZXJlXzZHQyAgICAgICAgICAgIDEuNTcxZSswMCAgMS4wNjhlKzAwICAgMS40NzIgMC4xNDEwMzQgICAgXG5jb2RlRmlsaWVyZV82TUcgICAgICAgICAgICAxLjE2MmUrMDAgIDEuMDcyZSswMCAgIDEuMDg0IDAuMjc4NTAxICAgIFxuY29kZUZpbGllcmVfNlNUR0kgICAgICAgICAgMS4zOTRlKzAwICAxLjEzMmUrMDAgICAxLjIzMiAwLjIxODAxNSAgICBcbmNvZGVGaWxpZXJlXzZTVEdQICAgICAgICAgIDIuOTUzZSswMCAgMS4xMjJlKzAwICAgMi42MzEgMC4wMDg1MTcgKiogXG5jb2RlRmlsaWVyZV82U1RJQyAgICAgICAgICAyLjA5NGUrMDAgIDkuOTI5ZS0wMSAgIDIuMTA5IDAuMDM0OTI4ICogIFxuY29kZUZpbGllcmVfNlRTQSAgICAgICAgICAgMy42MzNlKzAwICAxLjExOWUrMDAgICAzLjI0OCAwLjAwMTE2NCAqKiBcbmNvZGVGaWxpZXJlXzdCQ1BTVCAgICAgICAgLTIuOTQ2ZSswMCAgMi4yOTJlKzAwICAtMS4yODYgMC4xOTg1NDkgICAgXG5jb2RlRmlsaWVyZV83Q0FFICAgICAgICAgIC0xLjc1NGUrMDAgIDEuMTk1ZSswMCAgLTEuNDY3IDAuMTQyMjczICAgIFxuY29kZUZpbGllcmVfN0VDUyAgICAgICAgICAtMy45NTRlKzAwICAyLjAyOGUrMDAgIC0xLjk1MCAwLjA1MTE3MyAuICBcbmNvZGVGaWxpZXJlXzdHQyAgICAgICAgICAgLTEuOTk1ZSswMCAgMi4zMDdlKzAwICAtMC44NjUgMC4zODcwNTEgICAgXG5jb2RlRmlsaWVyZV83TUcgICAgICAgICAgIC0xLjI0NGUrMDAgIDEuMDU3ZSswMCAgLTEuMTc3IDAuMjM5MDYzICAgIFxuY29kZUZpbGllcmVfN1NUR0kgICAgICAgICAgMi44MDJlLTAxICAxLjEzNmUrMDAgICAwLjI0NyAwLjgwNTEwNyAgICBcbmNvZGVGaWxpZXJlXzdTVEdQICAgICAgICAgIDEuMzE3ZSswMCAgMS4zMDZlKzAwICAgMS4wMDggMC4zMTM0NTMgICAgXG5jb2RlRmlsaWVyZV83U1RJQyAgICAgICAgIC0yLjMzNWUrMDAgIDEuMzYzZSswMCAgLTEuNzEzIDAuMDg2NjMzIC4gIFxuY29kZUZpbGllcmVfN1RTQSAgICAgICAgICAtMS4xMjRlKzAwICAxLjA0MGUrMDAgIC0xLjA4MSAwLjI3OTU5MSAgICBcbmNvZGVGaWxpZXJlXzhCQ1BTVCAgICAgICAgIDEuNTU1ZSswMCAgMi40MTZlKzAwICAgMC42NDQgMC41MTk3MzIgICAgXG5jb2RlRmlsaWVyZV84Q0FFICAgICAgICAgIC02LjgyMGUtMDIgIDEuNzY4ZSswMCAgLTAuMDM5IDAuOTY5MjMyICAgIFxuY29kZUZpbGllcmVfOEVDUyAgICAgICAgICAtMS40NjRlKzAwICAzLjI4MmUrMDAgIC0wLjQ0NiAwLjY1NTUxNyAgICBcbmNvZGVGaWxpZXJlXzhHQyAgICAgICAgICAgIDIuMzgzZSswMCAgMi41MzZlKzAwICAgMC45NDAgMC4zNDczNzcgICAgXG5jb2RlRmlsaWVyZV84TUcgICAgICAgICAgICAxLjY4MGUrMDAgIDIuMTU1ZSswMCAgIDAuNzgwIDAuNDM1NDk2ICAgIFxuY29kZUZpbGllcmVfOFNUR0kgICAgICAgICAgMS4yMTJlKzAwICAxLjg2N2UrMDAgICAwLjY0OSAwLjUxNjE4NCAgICBcbmNvZGVGaWxpZXJlXzhTVEdQICAgICAgICAgIDEuMjA1ZSswMCAgMi4yNzhlKzAwICAgMC41MjkgMC41OTY4ODMgICAgXG5jb2RlRmlsaWVyZV84U1RJQyAgICAgICAgICAzLjYxOWUtMDEgIDEuNzQwZSswMCAgIDAuMjA4IDAuODM1MjY0ICAgIFxuY29kZUZpbGllcmVfOFRTQSAgICAgICAgICAgMS4yMjNlKzAwICAyLjA4NmUrMDAgICAwLjU4NiAwLjU1NzY1MSAgICBcbmNvZGVGaWxpZXJlXzlCQ1BTVCAgICAgICAgIDQuODM2ZS0wMSAgMy4yODZlKzAwICAgMC4xNDcgMC44ODI5OTQgICAgXG5jb2RlRmlsaWVyZV85Q0FFICAgICAgICAgIC0yLjkyM2UrMDAgIDIuMDEyZSswMCAgLTEuNDUzIDAuMTQ2Mjk2ICAgIFxuY29kZUZpbGllcmVfOUVDUyAgICAgICAgICAtMy4yMThlKzAwICAyLjc1NWUrMDAgIC0xLjE2OCAwLjI0MjczMyAgICBcbmNvZGVGaWxpZXJlXzlHQyAgICAgICAgICAgLTQuMzQ3ZSswMCAgNC41MzdlKzAwICAtMC45NTggMC4zMzc5OTMgICAgXG5jb2RlRmlsaWVyZV85TUcgICAgICAgICAgIC0xLjg1M2UrMDAgIDIuMDQ1ZSswMCAgLTAuOTA2IDAuMzY0ODI4ICAgIFxuY29kZUZpbGllcmVfOVNUR0kgICAgICAgICAtMS42MjVlKzAwICAyLjAxM2UrMDAgIC0wLjgwNyAwLjQxOTc1MSAgICBcbmNvZGVGaWxpZXJlXzlTVEdQICAgICAgICAgLTMuNjEyZSswMCAgMi4wMDFlKzAwICAtMS44MDUgMC4wNzEwMDYgLiAgXG5jb2RlRmlsaWVyZV85U1RJQyAgICAgICAgIC0zLjIxMGUtMDEgIDMuMzEwZSswMCAgLTAuMDk3IDAuOTIyNzQ2ICAgIFxuY29kZUZpbGllcmVfOVRTQSAgICAgICAgICAtMS4zNjhlKzAwICAxLjc3M2UrMDAgIC0wLjc3MSAwLjQ0MDQ0MCAgICBcbmAxRVJFX0FOR0xBSVNgICAgICAgICAgICAgIDIuMzkzZS0wMSAgNi4wMTVlLTAyICAgMy45NzkgNi45M2UtMDUgKioqXG5gMUVSRV9GUkFOQ0FJU2AgICAgICAgICAgIC0zLjI4MWUtMDMgIDYuODM2ZS0wMiAgLTAuMDQ4IDAuOTYxNzE5ICAgIFxuYDFFUkVfTUFUSEVNQVRJUVVFU2AgICAgICAgMS44MThlLTAxICA1LjMxNWUtMDIgICAzLjQyMSAwLjAwMDYyMyAqKipcbmAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEuNzg3ZS0wMSAgNS43MTZlLTAyICAgMy4xMjcgMC4wMDE3NjggKiogXG5gMUVSRV9TVlRgICAgICAgICAgICAgICAgICA0LjAwNmUtMDIgIDUuOTYzZS0wMiAgIDAuNjcyIDAuNTAxNzQ3ICAgIFxuYDJOREVfQU5HTEFJU2AgICAgICAgICAgICAgMi4zNDRlLTAzICA1LjI0M2UtMDIgICAwLjA0NSAwLjk2NDM0NCAgICBcbmAyTkRFX0ZSQU5DQUlTYCAgICAgICAgICAgLTUuMzE5ZS0wMiAgNi42NzVlLTAyICAtMC43OTcgMC40MjU1ODIgICAgXG5gMk5ERV9NQVRIRU1BVElRVUVTYCAgICAgICAxLjE2NmUtMDEgIDUuNDM0ZS0wMiAgIDIuMTQ3IDAuMDMxODIxICogIFxuYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMS4xNDBlLTAxICA1LjczMmUtMDIgICAxLjk4OSAwLjA0NjY3OCAqICBcbmAyTkRFX1NWVGAgICAgICAgICAgICAgICAgLTMuODQ5ZS0wMiAgNS45MDFlLTAyICAtMC42NTIgMC41MTQxOTUgICAgXG5CQUNfQU5HTEFJUyAgICAgICAgICAgICAgICA4LjUzMGUtMDEgIDcuMzExZS0wMiAgMTEuNjY3ICA8IDJlLTE2ICoqKlxuQkFDX0ZSQU5DQUlTICAgICAgICAgICAgICAgOS44NDhlLTAxICA3LjQ2NmUtMDIgIDEzLjE5MSAgPCAyZS0xNiAqKipcbkJBQ19NQVRIRU1BVElRVUVTICAgICAgICAgIDEuNjcxZSswMCAgMS4wNjNlLTAxICAxNS43MTcgIDwgMmUtMTYgKioqXG5gQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxLjIxMWUrMDAgIDguMjY1ZS0wMiAgMTQuNjQ3ICA8IDJlLTE2ICoqKlxuQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgNi44OTJlLTAxICA2LjUxMWUtMDIgIDEwLjU4NSAgPCAyZS0xNiAqKipcblRMRV9BTkdMQUlTICAgICAgICAgICAgICAgIDEuMjc3ZS0wMSAgNS45MTVlLTAyICAgMi4xNTkgMC4wMzA4NzkgKiAgXG5UTEVfRlJBTkNBSVMgICAgICAgICAgICAgICAyLjEwNmUtMDEgIDcuNzczZS0wMiAgIDIuNzA5IDAuMDA2NzQzICoqIFxuVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgNC41MzllLTAxICA3LjE3MmUtMDIgICA2LjMyOSAyLjQ3ZS0xMCAqKipcbmBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEuNjUwZS0wMSAgNi45MzBlLTAyICAgMi4zODIgMC4wMTcyNDAgKiAgXG5UTEVfU1ZUICAgICAgICAgICAgICAgICAgIC0yLjIzNGUtMDIgIDYuODEyZS0wMiAgLTAuMzI4IDAuNzQyOTI5ICAgIFxuLS0tXG5TaWduaWYuIGNvZGVzOiAgMCDigJgqKirigJkgMC4wMDEg4oCYKirigJkgMC4wMSDigJgq4oCZIDAuMDUg4oCYLuKAmSAwLjEg4oCYIOKAmSAxXG5cbihEaXNwZXJzaW9uIHBhcmFtZXRlciBmb3IgYmlub21pYWwgZmFtaWx5IHRha2VuIHRvIGJlIDEpXG5cbiAgICBOdWxsIGRldmlhbmNlOiA0MTQyLjYgIG9uIDQ0NzkgIGRlZ3JlZXMgb2YgZnJlZWRvbVxuUmVzaWR1YWwgZGV2aWFuY2U6ICA3MDguMiAgb24gNDM2MCAgZGVncmVlcyBvZiBmcmVlZG9tXG5BSUM6IDk0OC4yXG5cbk51bWJlciBvZiBGaXNoZXIgU2NvcmluZyBpdGVyYXRpb25zOiAxNFxuIn0= -->

```

Call:
glm(formula = admissible ~ ., family = binomial(logit), data = train)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-3.6904  -0.0263  -0.0011   0.0000   4.5069  

Coefficients:
                            Estimate Std. Error z value Pr(>|z|)    
(Intercept)               -1.104e+02  1.455e+03  -0.076 0.939512    
genreM                    -3.222e-01  2.394e-01  -1.346 0.178292    
mentionAuBacBIEN          -1.421e-01  4.108e-01  -0.346 0.729455    
mentionAuBacPASSABLE      -5.890e-01  4.542e-01  -1.297 0.194757    
mentionAuBacTRES BIEN     -3.166e+00  5.392e+02  -0.006 0.995315    
redoublementTerminaleOUI  -1.852e+00  3.886e-01  -4.767 1.87e-06 ***
rangEnTerminale1           1.697e+00  3.584e-01   4.734 2.20e-06 ***
rangEnTerminale2           1.079e+00  3.265e-01   3.305 0.000951 ***
rangEnTerminale3           1.112e+00  3.698e-01   3.007 0.002638 ** 
age14                      8.595e+00  2.058e+03   0.004 0.996668    
age15                      1.219e+01  1.455e+03   0.008 0.993317    
age16                      1.155e+01  1.455e+03   0.008 0.993669    
age17                      1.199e+01  1.455e+03   0.008 0.993427    
age18                      1.267e+01  1.455e+03   0.009 0.993056    
age19                      1.227e+01  1.455e+03   0.008 0.993271    
age20                      1.137e+01  1.455e+03   0.008 0.993768    
age21                      1.190e+01  1.455e+03   0.008 0.993474    
age22                      1.264e+01  1.455e+03   0.009 0.993073    
age23                      1.210e+01  1.455e+03   0.008 0.993366    
age24                      1.108e+01  1.455e+03   0.008 0.993923    
codeFiliere_1CAE          -1.066e+00  5.805e-01  -1.837 0.066254 .  
codeFiliere_1ECS          -3.224e+00  5.444e-01  -5.923 3.16e-09 ***
codeFiliere_1GC           -1.116e+00  5.352e-01  -2.085 0.037076 *  
codeFiliere_1MG           -2.027e+00  7.229e-01  -2.803 0.005057 ** 
codeFiliere_1STGI         -5.810e-01  9.715e-01  -0.598 0.549806    
codeFiliere_1STGP         -3.110e+00  1.776e+00  -1.751 0.079949 .  
codeFiliere_1STIC         -1.687e+00  6.774e-01  -2.490 0.012770 *  
codeFiliere_1TSA          -2.455e-01  9.064e-01  -0.271 0.786502    
codeFiliere_2BCPST         4.456e+00  6.459e-01   6.898 5.26e-12 ***
codeFiliere_2CAE           3.974e+00  6.515e-01   6.100 1.06e-09 ***
codeFiliere_2ECS           2.469e+00  5.964e-01   4.141 3.46e-05 ***
codeFiliere_2GC            3.087e+00  7.821e-01   3.947 7.92e-05 ***
codeFiliere_2MG            1.688e+00  7.322e-01   2.306 0.021126 *  
codeFiliere_2STGI          2.070e+00  7.068e-01   2.929 0.003397 ** 
codeFiliere_2STGP          3.308e+00  1.009e+00   3.278 0.001046 ** 
codeFiliere_2STIC          2.558e+00  7.180e-01   3.563 0.000366 ***
codeFiliere_2TSA           3.046e+00  7.091e-01   4.295 1.75e-05 ***
codeFiliere_3BCPST         9.647e-01  8.569e-01   1.126 0.260261    
codeFiliere_3CAE          -3.072e-01  5.892e-01  -0.521 0.602115    
codeFiliere_3ECS          -1.208e+00  9.343e-01  -1.292 0.196201    
codeFiliere_3GC           -1.839e-01  6.341e-01  -0.290 0.771770    
codeFiliere_3MG           -1.611e-01  6.101e-01  -0.264 0.791691    
codeFiliere_3STGI          6.361e-01  7.104e-01   0.895 0.370557    
codeFiliere_3STGP          2.719e-01  8.171e-01   0.333 0.739289    
codeFiliere_3STIC         -7.941e-02  5.948e-01  -0.134 0.893791    
codeFiliere_3TSA           9.893e-01  6.169e-01   1.604 0.108802    
codeFiliere_4BCPST        -2.472e-01  1.132e+00  -0.218 0.827097    
codeFiliere_4CAE          -4.124e-02  7.525e-01  -0.055 0.956292    
codeFiliere_4ECS          -5.657e-02  9.888e-01  -0.057 0.954379    
codeFiliere_4GC           -4.213e-01  7.431e-01  -0.567 0.570720    
codeFiliere_4MG           -3.643e-01  8.260e-01  -0.441 0.659149    
codeFiliere_4STGI         -2.786e-01  7.784e-01  -0.358 0.720448    
codeFiliere_4STGP          1.289e+00  9.656e-01   1.335 0.181772    
codeFiliere_4STIC          3.574e-02  7.806e-01   0.046 0.963483    
codeFiliere_4TSA           2.683e-01  6.955e-01   0.386 0.699676    
codeFiliere_5BCPST         2.427e+00  1.917e+00   1.266 0.205466    
codeFiliere_5CAE           6.378e-01  8.346e-01   0.764 0.444738    
codeFiliere_5ECS           3.127e-01  1.125e+00   0.278 0.780985    
codeFiliere_5GC           -5.554e-02  9.211e-01  -0.060 0.951921    
codeFiliere_5MG           -4.558e-01  8.985e-01  -0.507 0.611994    
codeFiliere_5STGI          2.647e-01  9.669e-01   0.274 0.784233    
codeFiliere_5STGP          1.154e+00  9.466e-01   1.219 0.222956    
codeFiliere_5STIC         -3.571e-01  9.661e-01  -0.370 0.711671    
codeFiliere_5TSA           6.392e-01  8.039e-01   0.795 0.426506    
codeFiliere_6BCPST         2.288e+00  1.249e+00   1.832 0.067016 .  
codeFiliere_6CAE           1.423e+00  9.779e-01   1.455 0.145574    
codeFiliere_6ECS          -2.804e-01  1.592e+00  -0.176 0.860205    
codeFiliere_6GC            1.571e+00  1.068e+00   1.472 0.141034    
codeFiliere_6MG            1.162e+00  1.072e+00   1.084 0.278501    
codeFiliere_6STGI          1.394e+00  1.132e+00   1.232 0.218015    
codeFiliere_6STGP          2.953e+00  1.122e+00   2.631 0.008517 ** 
codeFiliere_6STIC          2.094e+00  9.929e-01   2.109 0.034928 *  
codeFiliere_6TSA           3.633e+00  1.119e+00   3.248 0.001164 ** 
codeFiliere_7BCPST        -2.946e+00  2.292e+00  -1.286 0.198549    
codeFiliere_7CAE          -1.754e+00  1.195e+00  -1.467 0.142273    
codeFiliere_7ECS          -3.954e+00  2.028e+00  -1.950 0.051173 .  
codeFiliere_7GC           -1.995e+00  2.307e+00  -0.865 0.387051    
codeFiliere_7MG           -1.244e+00  1.057e+00  -1.177 0.239063    
codeFiliere_7STGI          2.802e-01  1.136e+00   0.247 0.805107    
codeFiliere_7STGP          1.317e+00  1.306e+00   1.008 0.313453    
codeFiliere_7STIC         -2.335e+00  1.363e+00  -1.713 0.086633 .  
codeFiliere_7TSA          -1.124e+00  1.040e+00  -1.081 0.279591    
codeFiliere_8BCPST         1.555e+00  2.416e+00   0.644 0.519732    
codeFiliere_8CAE          -6.820e-02  1.768e+00  -0.039 0.969232    
codeFiliere_8ECS          -1.464e+00  3.282e+00  -0.446 0.655517    
codeFiliere_8GC            2.383e+00  2.536e+00   0.940 0.347377    
codeFiliere_8MG            1.680e+00  2.155e+00   0.780 0.435496    
codeFiliere_8STGI          1.212e+00  1.867e+00   0.649 0.516184    
codeFiliere_8STGP          1.205e+00  2.278e+00   0.529 0.596883    
codeFiliere_8STIC          3.619e-01  1.740e+00   0.208 0.835264    
codeFiliere_8TSA           1.223e+00  2.086e+00   0.586 0.557651    
codeFiliere_9BCPST         4.836e-01  3.286e+00   0.147 0.882994    
codeFiliere_9CAE          -2.923e+00  2.012e+00  -1.453 0.146296    
codeFiliere_9ECS          -3.218e+00  2.755e+00  -1.168 0.242733    
codeFiliere_9GC           -4.347e+00  4.537e+00  -0.958 0.337993    
codeFiliere_9MG           -1.853e+00  2.045e+00  -0.906 0.364828    
codeFiliere_9STGI         -1.625e+00  2.013e+00  -0.807 0.419751    
codeFiliere_9STGP         -3.612e+00  2.001e+00  -1.805 0.071006 .  
codeFiliere_9STIC         -3.210e-01  3.310e+00  -0.097 0.922746    
codeFiliere_9TSA          -1.368e+00  1.773e+00  -0.771 0.440440    
`1ERE_ANGLAIS`             2.393e-01  6.015e-02   3.979 6.93e-05 ***
`1ERE_FRANCAIS`           -3.281e-03  6.836e-02  -0.048 0.961719    
`1ERE_MATHEMATIQUES`       1.818e-01  5.315e-02   3.421 0.000623 ***
`1ERE_SCIENCES PHYSIQUES`  1.787e-01  5.716e-02   3.127 0.001768 ** 
`1ERE_SVT`                 4.006e-02  5.963e-02   0.672 0.501747    
`2NDE_ANGLAIS`             2.344e-03  5.243e-02   0.045 0.964344    
`2NDE_FRANCAIS`           -5.319e-02  6.675e-02  -0.797 0.425582    
`2NDE_MATHEMATIQUES`       1.166e-01  5.434e-02   2.147 0.031821 *  
`2NDE_SCIENCES PHYSIQUES`  1.140e-01  5.732e-02   1.989 0.046678 *  
`2NDE_SVT`                -3.849e-02  5.901e-02  -0.652 0.514195    
BAC_ANGLAIS                8.530e-01  7.311e-02  11.667  < 2e-16 ***
BAC_FRANCAIS               9.848e-01  7.466e-02  13.191  < 2e-16 ***
BAC_MATHEMATIQUES          1.671e+00  1.063e-01  15.717  < 2e-16 ***
`BAC_SCIENCES PHYSIQUES`   1.211e+00  8.265e-02  14.647  < 2e-16 ***
BAC_SVT                    6.892e-01  6.511e-02  10.585  < 2e-16 ***
TLE_ANGLAIS                1.277e-01  5.915e-02   2.159 0.030879 *  
TLE_FRANCAIS               2.106e-01  7.773e-02   2.709 0.006743 ** 
TLE_MATHEMATIQUES          4.539e-01  7.172e-02   6.329 2.47e-10 ***
`TLE_SCIENCES PHYSIQUES`   1.650e-01  6.930e-02   2.382 0.017240 *  
TLE_SVT                   -2.234e-02  6.812e-02  -0.328 0.742929    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 4142.6  on 4479  degrees of freedom
Residual deviance:  708.2  on 4360  degrees of freedom
AIC: 948.2

Number of Fisher Scoring iterations: 14
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuY2FyOjpBbm92YSAocmVnX2xvZyAsdHlwZT0zLHRlc3Quc3RhdGlzdGljID0gXCJMUlwiICxzaW5ndWxhci5vaz1UUlVFKVxuYGBgIn0= -->

```r
car::Anova (reg_log ,type=3,test.statistic = "LR" ,singular.ok=TRUE)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG5XYXJuaW5nOiBnbG0uZml0OiBmaXR0ZWQgcHJvYmFiaWxpdGllcyBudW1lcmljYWxseSAwIG9yIDEgb2NjdXJyZWRcbldhcm5pbmc6IGdsbS5maXQ6IGZpdHRlZCBwcm9iYWJpbGl0aWVzIG51bWVyaWNhbGx5IDAgb3IgMSBvY2N1cnJlZFxuV2FybmluZzogZ2xtLmZpdDogZml0dGVkIHByb2JhYmlsaXRpZXMgbnVtZXJpY2FsbHkgMCBvciAxIG9jY3VycmVkXG4ifQ== -->

```
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiQW5hbHlzaXMgb2YgRGV2aWFuY2UgVGFibGUgKFR5cGUgSUlJIHRlc3RzKVxuXG5SZXNwb25zZTogYWRtaXNzaWJsZVxuICAgICAgICAgICAgICAgICAgICAgICAgICBMUiBDaGlzcSBEZiBQcig+Q2hpc3EpICAgIFxuZ2VucmUgICAgICAgICAgICAgICAgICAgICAgICAgMS44MSAgMSAgIDAuMTc4MTYzICAgIFxubWVudGlvbkF1QmFjICAgICAgICAgICAgICAgICAgMi4wMSAgMyAgIDAuNTcxMTE5ICAgIFxucmVkb3VibGVtZW50VGVybWluYWxlICAgICAgICAyNC43NiAgMSAgNi40NzllLTA3ICoqKlxucmFuZ0VuVGVybWluYWxlICAgICAgICAgICAgICAyNS42MCAgMyAgMS4xNThlLTA1ICoqKlxuYWdlICAgICAgICAgICAgICAgICAgICAgICAgICAxNi42NCAxMSAgIDAuMTE5MTAyICAgIFxuY29kZUZpbGllcmVfMSAgICAgICAgICAgICAgICA0NS40OSAgOCAgMi45NzFlLTA3ICoqKlxuY29kZUZpbGllcmVfMiAgICAgICAgICAgICAgICA2Ni40NSAgOSAgNy41MjdlLTExICoqKlxuY29kZUZpbGllcmVfMyAgICAgICAgICAgICAgICAgOS42MiAgOSAgIDAuMzgyMTEzICAgIFxuY29kZUZpbGllcmVfNCAgICAgICAgICAgICAgICAgNC4yNSAgOSAgIDAuODk0MzIwICAgIFxuY29kZUZpbGllcmVfNSAgICAgICAgICAgICAgICAgNi4zMiAgOSAgIDAuNzA3NjQyICAgIFxuY29kZUZpbGllcmVfNiAgICAgICAgICAgICAgICAxNi4xMSAgOSAgIDAuMDY0NTY0IC4gIFxuY29kZUZpbGllcmVfNyAgICAgICAgICAgICAgICAxMy40OSAgOSAgIDAuMTQxODU0ICAgIFxuY29kZUZpbGllcmVfOCAgICAgICAgICAgICAgICAgMi42OSAgOSAgIDAuOTc1NDM1ICAgIFxuY29kZUZpbGllcmVfOSAgICAgICAgICAgICAgICAgNi4zNyAgOSAgIDAuNzAyMjQ3ICAgIFxuYDFFUkVfQU5HTEFJU2AgICAgICAgICAgICAgICAxNi41MSAgMSAgNC44MzRlLTA1ICoqKlxuYDFFUkVfRlJBTkNBSVNgICAgICAgICAgICAgICAgMC4wMCAgMSAgIDAuOTYxNzIwICAgIFxuYDFFUkVfTUFUSEVNQVRJUVVFU2AgICAgICAgICAxMi4xMSAgMSAgIDAuMDAwNTAyICoqKlxuYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgICAgOS45OCAgMSAgIDAuMDAxNTgxICoqIFxuYDFFUkVfU1ZUYCAgICAgICAgICAgICAgICAgICAgMC40NSAgMSAgIDAuNTAxNTM4ICAgIFxuYDJOREVfQU5HTEFJU2AgICAgICAgICAgICAgICAgMC4wMCAgMSAgIDAuOTY0MzQ0ICAgIFxuYDJOREVfRlJBTkNBSVNgICAgICAgICAgICAgICAgMC42NCAgMSAgIDAuNDI1MTcwICAgIFxuYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgICAgNC42NyAgMSAgIDAuMDMwNjE5ICogIFxuYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgICAgMy45OSAgMSAgIDAuMDQ1NzExICogIFxuYDJOREVfU1ZUYCAgICAgICAgICAgICAgICAgICAgMC40MyAgMSAgIDAuNTE0MTk3ICAgIFxuQkFDX0FOR0xBSVMgICAgICAgICAgICAgICAgIDIwNC4wMCAgMSAgPCAyLjJlLTE2ICoqKlxuQkFDX0ZSQU5DQUlTICAgICAgICAgICAgICAgIDMwOS45MSAgMSAgPCAyLjJlLTE2ICoqKlxuQkFDX01BVEhFTUFUSVFVRVMgICAgICAgICAgIDcwMC43OSAgMSAgPCAyLjJlLTE2ICoqKlxuYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICAgIDQzNS4yMSAgMSAgPCAyLjJlLTE2ICoqKlxuQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgIDE1NC4zMyAgMSAgPCAyLjJlLTE2ICoqKlxuVExFX0FOR0xBSVMgICAgICAgICAgICAgICAgICAgNC43MSAgMSAgIDAuMDMwMDIwICogIFxuVExFX0ZSQU5DQUlTICAgICAgICAgICAgICAgICAgNy40OSAgMSAgIDAuMDA2MjEwICoqIFxuVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgICA0NC44NyAgMSAgMi4xMDhlLTExICoqKlxuYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAgICAgNS43NiAgMSAgIDAuMDE2MzkzICogIFxuVExFX1NWVCAgICAgICAgICAgICAgICAgICAgICAgMC4xMSAgMSAgIDAuNzQzMDUxICAgIFxuLS0tXG5TaWduaWYuIGNvZGVzOiAgMCDigJgqKirigJkgMC4wMDEg4oCYKirigJkgMC4wMSDigJgq4oCZIDAuMDUg4oCYLuKAmSAwLjEg4oCYIOKAmSAxXG4ifQ== -->

```
Analysis of Deviance Table (Type III tests)

Response: admissible
                          LR Chisq Df Pr(>Chisq)    
genre                         1.81  1   0.178163    
mentionAuBac                  2.01  3   0.571119    
redoublementTerminale        24.76  1  6.479e-07 ***
rangEnTerminale              25.60  3  1.158e-05 ***
age                          16.64 11   0.119102    
codeFiliere_1                45.49  8  2.971e-07 ***
codeFiliere_2                66.45  9  7.527e-11 ***
codeFiliere_3                 9.62  9   0.382113    
codeFiliere_4                 4.25  9   0.894320    
codeFiliere_5                 6.32  9   0.707642    
codeFiliere_6                16.11  9   0.064564 .  
codeFiliere_7                13.49  9   0.141854    
codeFiliere_8                 2.69  9   0.975435    
codeFiliere_9                 6.37  9   0.702247    
`1ERE_ANGLAIS`               16.51  1  4.834e-05 ***
`1ERE_FRANCAIS`               0.00  1   0.961720    
`1ERE_MATHEMATIQUES`         12.11  1   0.000502 ***
`1ERE_SCIENCES PHYSIQUES`     9.98  1   0.001581 ** 
`1ERE_SVT`                    0.45  1   0.501538    
`2NDE_ANGLAIS`                0.00  1   0.964344    
`2NDE_FRANCAIS`               0.64  1   0.425170    
`2NDE_MATHEMATIQUES`          4.67  1   0.030619 *  
`2NDE_SCIENCES PHYSIQUES`     3.99  1   0.045711 *  
`2NDE_SVT`                    0.43  1   0.514197    
BAC_ANGLAIS                 204.00  1  < 2.2e-16 ***
BAC_FRANCAIS                309.91  1  < 2.2e-16 ***
BAC_MATHEMATIQUES           700.79  1  < 2.2e-16 ***
`BAC_SCIENCES PHYSIQUES`    435.21  1  < 2.2e-16 ***
BAC_SVT                     154.33  1  < 2.2e-16 ***
TLE_ANGLAIS                   4.71  1   0.030020 *  
TLE_FRANCAIS                  7.49  1   0.006210 ** 
TLE_MATHEMATIQUES            44.87  1  2.108e-11 ***
`TLE_SCIENCES PHYSIQUES`      5.76  1   0.016393 *  
TLE_SVT                       0.11  1   0.743051    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmVnX2xvZ19zdGVwIDwtIHN0ZXAocmVnX2xvZyAsZGlyZWN0aW9uPVwiYmFja3dhcmRcIilcbmBgYCJ9 -->

```r
reg_log_step <- step(reg_log ,direction="backward")
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiU3RhcnQ6ICBBSUM9OTQ4LjJcbmFkbWlzc2libGUgfiBnZW5yZSArIG1lbnRpb25BdUJhYyArIHJlZG91YmxlbWVudFRlcm1pbmFsZSArIHJhbmdFblRlcm1pbmFsZSArIFxuICAgIGFnZSArIGNvZGVGaWxpZXJlXzEgKyBjb2RlRmlsaWVyZV8yICsgY29kZUZpbGllcmVfMyArIGNvZGVGaWxpZXJlXzQgKyBcbiAgICBjb2RlRmlsaWVyZV81ICsgY29kZUZpbGllcmVfNiArIGNvZGVGaWxpZXJlXzcgKyBjb2RlRmlsaWVyZV84ICsgXG4gICAgY29kZUZpbGllcmVfOSArIGAxRVJFX0FOR0xBSVNgICsgYDFFUkVfRlJBTkNBSVNgICsgYDFFUkVfTUFUSEVNQVRJUVVFU2AgKyBcbiAgICBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgYDFFUkVfU1ZUYCArIGAyTkRFX0FOR0xBSVNgICsgXG4gICAgYDJOREVfRlJBTkNBSVNgICsgYDJOREVfTUFUSEVNQVRJUVVFU2AgKyBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgXG4gICAgYDJOREVfU1ZUYCArIEJBQ19BTkdMQUlTICsgQkFDX0ZSQU5DQUlTICsgQkFDX01BVEhFTUFUSVFVRVMgKyBcbiAgICBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBCQUNfU1ZUICsgVExFX0FOR0xBSVMgKyBUTEVfRlJBTkNBSVMgKyBcbiAgICBUTEVfTUFUSEVNQVRJUVVFUyArIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFRMRV9TVlRcbiJ9 -->

```
Start:  AIC=948.2
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    age + codeFiliere_1 + codeFiliere_2 + codeFiliere_3 + codeFiliere_4 + 
    codeFiliere_5 + codeFiliere_6 + codeFiliere_7 + codeFiliere_8 + 
    codeFiliere_9 + `1ERE_ANGLAIS` + `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + 
    `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + `2NDE_ANGLAIS` + 
    `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + 
    `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + 
    `BAC_SCIENCES PHYSIQUES` + BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + 
    TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gY29kZUZpbGllcmVfOCAgICAgICAgICAgICAgOSAgIDcxMC44OSAgOTMyLjg5XG4tIGNvZGVGaWxpZXJlXzQgICAgICAgICAgICAgIDkgICA3MTIuNDUgIDkzNC40NVxuLSBjb2RlRmlsaWVyZV81ICAgICAgICAgICAgICA5ICAgNzE0LjUyICA5MzYuNTJcbi0gY29kZUZpbGllcmVfOSAgICAgICAgICAgICAgOSAgIDcxNC41NyAgOTM2LjU3XG4tIGNvZGVGaWxpZXJlXzMgICAgICAgICAgICAgIDkgICA3MTcuODIgIDkzOS44MlxuLSBhZ2UgICAgICAgICAgICAgICAgICAgICAgIDExICAgNzI0Ljg0ICA5NDIuODRcbi0gY29kZUZpbGllcmVfNyAgICAgICAgICAgICAgOSAgIDcyMS42OCAgOTQzLjY4XG4tIG1lbnRpb25BdUJhYyAgICAgICAgICAgICAgIDMgICA3MTAuMjAgIDk0NC4yMFxuLSBgMk5ERV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzA4LjIwICA5NDYuMjBcbi0gYDFFUkVfRlJBTkNBSVNgICAgICAgICAgICAgMSAgIDcwOC4yMCAgOTQ2LjIwXG4tIFRMRV9TVlQgICAgICAgICAgICAgICAgICAgIDEgICA3MDguMzEgIDk0Ni4zMVxuLSBjb2RlRmlsaWVyZV82ICAgICAgICAgICAgICA5ICAgNzI0LjMxICA5NDYuMzFcbi0gYDJOREVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDcwOC42MiAgOTQ2LjYyXG4tIGAxRVJFX1NWVGAgICAgICAgICAgICAgICAgIDEgICA3MDguNjUgIDk0Ni42NVxuLSBgMk5ERV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzA4LjgzICA5NDYuODNcbi0gZ2VucmUgICAgICAgICAgICAgICAgICAgICAgMSAgIDcxMC4wMSAgOTQ4LjAxXG48bm9uZT4gICAgICAgICAgICAgICAgICAgICAgICAgICA3MDguMjAgIDk0OC4yMFxuLSBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzEyLjE5ICA5NTAuMTlcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDcxMi44NyAgOTUwLjg3XG4tIFRMRV9BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA3MTIuOTEgIDk1MC45MVxuLSBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAgNzEzLjk2ICA5NTEuOTZcbi0gVExFX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgIDcxNS42OSAgOTUzLjY5XG4tIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3MTguMTggIDk1Ni4xOFxuLSBgMUVSRV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzIwLjMxICA5NTguMzFcbi0gYDFFUkVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDcyNC43MSAgOTYyLjcxXG4tIHJhbmdFblRlcm1pbmFsZSAgICAgICAgICAgIDMgICA3MzMuODAgIDk2Ny44MFxuLSByZWRvdWJsZW1lbnRUZXJtaW5hbGUgICAgICAxICAgNzMyLjk2ICA5NzAuOTZcbi0gY29kZUZpbGllcmVfMSAgICAgICAgICAgICAgOCAgIDc1My42OSAgOTc3LjY5XG4tIFRMRV9NQVRIRU1BVElRVUVTICAgICAgICAgIDEgICA3NTMuMDcgIDk5MS4wN1xuLSBjb2RlRmlsaWVyZV8yICAgICAgICAgICAgICA5ICAgNzc0LjY1ICA5OTYuNjVcbi0gQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDg2Mi41MyAxMTAwLjUzXG4tIEJBQ19BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA5MTIuMjAgMTE1MC4yMFxuLSBCQUNfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAxMDE4LjEwIDEyNTYuMTBcbi0gYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgMTE0My40MSAxMzgxLjQxXG4tIEJBQ19NQVRIRU1BVElRVUVTICAgICAgICAgIDEgIDE0MDguOTkgMTY0Ni45OVxuIn0= -->

```
                            Df Deviance     AIC
- codeFiliere_8              9   710.89  932.89
- codeFiliere_4              9   712.45  934.45
- codeFiliere_5              9   714.52  936.52
- codeFiliere_9              9   714.57  936.57
- codeFiliere_3              9   717.82  939.82
- age                       11   724.84  942.84
- codeFiliere_7              9   721.68  943.68
- mentionAuBac               3   710.20  944.20
- `2NDE_ANGLAIS`             1   708.20  946.20
- `1ERE_FRANCAIS`            1   708.20  946.20
- TLE_SVT                    1   708.31  946.31
- codeFiliere_6              9   724.31  946.31
- `2NDE_SVT`                 1   708.62  946.62
- `1ERE_SVT`                 1   708.65  946.65
- `2NDE_FRANCAIS`            1   708.83  946.83
- genre                      1   710.01  948.01
<none>                           708.20  948.20
- `2NDE_SCIENCES PHYSIQUES`  1   712.19  950.19
- `2NDE_MATHEMATIQUES`       1   712.87  950.87
- TLE_ANGLAIS                1   712.91  950.91
- `TLE_SCIENCES PHYSIQUES`   1   713.96  951.96
- TLE_FRANCAIS               1   715.69  953.69
- `1ERE_SCIENCES PHYSIQUES`  1   718.18  956.18
- `1ERE_MATHEMATIQUES`       1   720.31  958.31
- `1ERE_ANGLAIS`             1   724.71  962.71
- rangEnTerminale            3   733.80  967.80
- redoublementTerminale      1   732.96  970.96
- codeFiliere_1              8   753.69  977.69
- TLE_MATHEMATIQUES          1   753.07  991.07
- codeFiliere_2              9   774.65  996.65
- BAC_SVT                    1   862.53 1100.53
- BAC_ANGLAIS                1   912.20 1150.20
- BAC_FRANCAIS               1  1018.10 1256.10
- `BAC_SCIENCES PHYSIQUES`   1  1143.41 1381.41
- BAC_MATHEMATIQUES          1  1408.99 1646.99
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5TdGVwOiAgQUlDPTkzMi44OVxuYWRtaXNzaWJsZSB+IGdlbnJlICsgbWVudGlvbkF1QmFjICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgYWdlICsgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV8zICsgY29kZUZpbGllcmVfNCArIFxuICAgIGNvZGVGaWxpZXJlXzUgKyBjb2RlRmlsaWVyZV82ICsgY29kZUZpbGllcmVfNyArIGNvZGVGaWxpZXJlXzkgKyBcbiAgICBgMUVSRV9BTkdMQUlTYCArIGAxRVJFX0ZSQU5DQUlTYCArIGAxRVJFX01BVEhFTUFUSVFVRVNgICsgXG4gICAgYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAxRVJFX1NWVGAgKyBgMk5ERV9BTkdMQUlTYCArIFxuICAgIGAyTkRFX0ZSQU5DQUlTYCArIGAyTkRFX01BVEhFTUFUSVFVRVNgICsgYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFxuICAgIGAyTkRFX1NWVGAgKyBCQUNfQU5HTEFJUyArIEJBQ19GUkFOQ0FJUyArIEJBQ19NQVRIRU1BVElRVUVTICsgXG4gICAgYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICsgQkFDX1NWVCArIFRMRV9BTkdMQUlTICsgVExFX0ZSQU5DQUlTICsgXG4gICAgVExFX01BVEhFTUFUSVFVRVMgKyBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBUTEVfU1ZUXG4ifQ== -->

```

Step:  AIC=932.89
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    age + codeFiliere_1 + codeFiliere_2 + codeFiliere_3 + codeFiliere_4 + 
    codeFiliere_5 + codeFiliere_6 + codeFiliere_7 + codeFiliere_9 + 
    `1ERE_ANGLAIS` + `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + 
    `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + `2NDE_ANGLAIS` + 
    `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + 
    `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + 
    `BAC_SCIENCES PHYSIQUES` + BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + 
    TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuIn0= -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gY29kZUZpbGllcmVfNCAgICAgICAgICAgICAgOSAgIDcxNS41MCAgOTE5LjUwXG4tIGNvZGVGaWxpZXJlXzUgICAgICAgICAgICAgIDkgICA3MTcuMzggIDkyMS4zOFxuLSBjb2RlRmlsaWVyZV85ICAgICAgICAgICAgICA5ICAgNzE4LjQ3ICA5MjIuNDdcbi0gY29kZUZpbGllcmVfMyAgICAgICAgICAgICAgOSAgIDcyMS4yNiAgOTI1LjI2XG4tIGFnZSAgICAgICAgICAgICAgICAgICAgICAgMTEgICA3MjYuNzggIDkyNi43OFxuLSBjb2RlRmlsaWVyZV83ICAgICAgICAgICAgICA5ICAgNzI0LjQzICA5MjguNDNcbi0gbWVudGlvbkF1QmFjICAgICAgICAgICAgICAgMyAgIDcxMi44NyAgOTI4Ljg3XG4tIGAyTkRFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3MTAuODkgIDkzMC44OVxuLSBgMUVSRV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzEwLjg5ICA5MzAuODlcbi0gVExFX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDcxMC45OCAgOTMwLjk4XG4tIGAxRVJFX1NWVGAgICAgICAgICAgICAgICAgIDEgICA3MTEuMzkgIDkzMS4zOVxuLSBgMk5ERV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzExLjQwICA5MzEuNDBcbi0gYDJOREVfRlJBTkNBSVNgICAgICAgICAgICAgMSAgIDcxMS40MiAgOTMxLjQyXG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3MjcuNzcgIDkzMS43N1xuLSBnZW5yZSAgICAgICAgICAgICAgICAgICAgICAxICAgNzEyLjYzICA5MzIuNjNcbjxub25lPiAgICAgICAgICAgICAgICAgICAgICAgICAgIDcxMC44OSAgOTMyLjg5XG4tIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3MTQuODYgIDkzNC44NlxuLSBUTEVfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgNzE1LjUyICA5MzUuNTJcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDcxNS41OSAgOTM1LjU5XG4tIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgICA3MTYuMjkgIDkzNi4yOVxuLSBUTEVfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAgNzE4Ljg1ICA5MzguODVcbi0gYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDcyMC4zOCAgOTQwLjM4XG4tIGAxRVJFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3MjMuNDkgIDk0My40OVxuLSBgMUVSRV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzI3LjcxICA5NDcuNzFcbi0gcmFuZ0VuVGVybWluYWxlICAgICAgICAgICAgMyAgIDczNy4zMyAgOTUzLjMzXG4tIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgICAgIDEgICA3MzYuNDkgIDk1Ni40OVxuLSBjb2RlRmlsaWVyZV8xICAgICAgICAgICAgICA4ICAgNzU2LjE3ICA5NjIuMTdcbi0gVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgIDc1Ni43NyAgOTc2Ljc3XG4tIGNvZGVGaWxpZXJlXzIgICAgICAgICAgICAgIDkgICA3NzcuODcgIDk4MS44N1xuLSBCQUNfU1ZUICAgICAgICAgICAgICAgICAgICAxICAgODY4LjAzIDEwODguMDNcbi0gQkFDX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDkxNS40MSAxMTM1LjQxXG4tIEJBQ19GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgIDEwMjEuMTAgMTI0MS4xMFxuLSBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAxMTUwLjc2IDEzNzAuNzZcbi0gQkFDX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgMTQxMS4yNiAxNjMxLjI2XG4ifQ== -->

```
                            Df Deviance     AIC
- codeFiliere_4              9   715.50  919.50
- codeFiliere_5              9   717.38  921.38
- codeFiliere_9              9   718.47  922.47
- codeFiliere_3              9   721.26  925.26
- age                       11   726.78  926.78
- codeFiliere_7              9   724.43  928.43
- mentionAuBac               3   712.87  928.87
- `2NDE_ANGLAIS`             1   710.89  930.89
- `1ERE_FRANCAIS`            1   710.89  930.89
- TLE_SVT                    1   710.98  930.98
- `1ERE_SVT`                 1   711.39  931.39
- `2NDE_SVT`                 1   711.40  931.40
- `2NDE_FRANCAIS`            1   711.42  931.42
- codeFiliere_6              9   727.77  931.77
- genre                      1   712.63  932.63
<none>                           710.89  932.89
- `2NDE_SCIENCES PHYSIQUES`  1   714.86  934.86
- TLE_ANGLAIS                1   715.52  935.52
- `2NDE_MATHEMATIQUES`       1   715.59  935.59
- `TLE_SCIENCES PHYSIQUES`   1   716.29  936.29
- TLE_FRANCAIS               1   718.85  938.85
- `1ERE_SCIENCES PHYSIQUES`  1   720.38  940.38
- `1ERE_MATHEMATIQUES`       1   723.49  943.49
- `1ERE_ANGLAIS`             1   727.71  947.71
- rangEnTerminale            3   737.33  953.33
- redoublementTerminale      1   736.49  956.49
- codeFiliere_1              8   756.17  962.17
- TLE_MATHEMATIQUES          1   756.77  976.77
- codeFiliere_2              9   777.87  981.87
- BAC_SVT                    1   868.03 1088.03
- BAC_ANGLAIS                1   915.41 1135.41
- BAC_FRANCAIS               1  1021.10 1241.10
- `BAC_SCIENCES PHYSIQUES`   1  1150.76 1370.76
- BAC_MATHEMATIQUES          1  1411.26 1631.26
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5TdGVwOiAgQUlDPTkxOS41XG5hZG1pc3NpYmxlIH4gZ2VucmUgKyBtZW50aW9uQXVCYWMgKyByZWRvdWJsZW1lbnRUZXJtaW5hbGUgKyByYW5nRW5UZXJtaW5hbGUgKyBcbiAgICBhZ2UgKyBjb2RlRmlsaWVyZV8xICsgY29kZUZpbGllcmVfMiArIGNvZGVGaWxpZXJlXzMgKyBjb2RlRmlsaWVyZV81ICsgXG4gICAgY29kZUZpbGllcmVfNiArIGNvZGVGaWxpZXJlXzcgKyBjb2RlRmlsaWVyZV85ICsgYDFFUkVfQU5HTEFJU2AgKyBcbiAgICBgMUVSRV9GUkFOQ0FJU2AgKyBgMUVSRV9NQVRIRU1BVElRVUVTYCArIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBcbiAgICBgMUVSRV9TVlRgICsgYDJOREVfQU5HTEFJU2AgKyBgMk5ERV9GUkFOQ0FJU2AgKyBgMk5ERV9NQVRIRU1BVElRVUVTYCArIFxuICAgIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMk5ERV9TVlRgICsgQkFDX0FOR0xBSVMgKyBCQUNfRlJBTkNBSVMgKyBcbiAgICBCQUNfTUFUSEVNQVRJUVVFUyArIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCArIEJBQ19TVlQgKyBcbiAgICBUTEVfQU5HTEFJUyArIFRMRV9GUkFOQ0FJUyArIFRMRV9NQVRIRU1BVElRVUVTICsgYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgXG4gICAgVExFX1NWVFxuIn0= -->

```

Step:  AIC=919.5
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    age + codeFiliere_1 + codeFiliere_2 + codeFiliere_3 + codeFiliere_5 + 
    codeFiliere_6 + codeFiliere_7 + codeFiliere_9 + `1ERE_ANGLAIS` + 
    `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + 
    `1ERE_SVT` + `2NDE_ANGLAIS` + `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + 
    TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG4ifQ== -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gY29kZUZpbGllcmVfNSAgICAgICAgICAgICAgOSAgIDcyMS40NiAgOTA3LjQ2XG4tIGNvZGVGaWxpZXJlXzkgICAgICAgICAgICAgIDkgICA3MjMuNjIgIDkwOS42MlxuLSBjb2RlRmlsaWVyZV8zICAgICAgICAgICAgICA5ICAgNzI2LjM2ICA5MTIuMzZcbi0gY29kZUZpbGllcmVfNyAgICAgICAgICAgICAgOSAgIDcyNy4yNiAgOTEzLjI2XG4tIGFnZSAgICAgICAgICAgICAgICAgICAgICAgMTEgICA3MzEuNDYgIDkxMy40NlxuLSBtZW50aW9uQXVCYWMgICAgICAgICAgICAgICAzICAgNzE3LjUwICA5MTUuNTBcbi0gY29kZUZpbGllcmVfNiAgICAgICAgICAgICAgOSAgIDczMS4wMyAgOTE3LjAzXG4tIGAyTkRFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3MTUuNTAgIDkxNy41MFxuLSBgMUVSRV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzE1LjUwICA5MTcuNTBcbi0gVExFX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDcxNS41NiAgOTE3LjU2XG4tIGAxRVJFX1NWVGAgICAgICAgICAgICAgICAgIDEgICA3MTUuODkgIDkxNy44OVxuLSBgMk5ERV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzE1LjkxICA5MTcuOTFcbi0gYDJOREVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDcxNi4wMyAgOTE4LjAzXG4tIGdlbnJlICAgICAgICAgICAgICAgICAgICAgIDEgICA3MTcuMjAgIDkxOS4yMFxuPG5vbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzE1LjUwICA5MTkuNTBcbi0gYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDcxOS43OCAgOTIxLjc4XG4tIGAyTkRFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3MjAuMDMgIDkyMi4wM1xuLSBUTEVfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgNzIwLjA0ICA5MjIuMDRcbi0gYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgIDcyMS4wNiAgOTIzLjA2XG4tIFRMRV9GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgICA3MjQuMTUgIDkyNi4xNVxuLSBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzI2LjMyICA5MjguMzJcbi0gYDFFUkVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDcyNy4wOCAgOTI5LjA4XG4tIGAxRVJFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3MzIuNDcgIDkzNC40N1xuLSByYW5nRW5UZXJtaW5hbGUgICAgICAgICAgICAzICAgNzQxLjMyICA5MzkuMzJcbi0gcmVkb3VibGVtZW50VGVybWluYWxlICAgICAgMSAgIDc0Mi43MCAgOTQ0LjcwXG4tIGNvZGVGaWxpZXJlXzEgICAgICAgICAgICAgIDggICA3NjcuMTcgIDk1NS4xN1xuLSBUTEVfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAgNzU5Ljg4ICA5NjEuODhcbi0gY29kZUZpbGllcmVfMiAgICAgICAgICAgICAgOSAgIDc4My41MSAgOTY5LjUxXG4tIEJBQ19TVlQgICAgICAgICAgICAgICAgICAgIDEgICA4NzEuODEgMTA3My44MVxuLSBCQUNfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgOTIwLjQ2IDExMjIuNDZcbi0gQkFDX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgMTAyOC43NiAxMjMwLjc2XG4tIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgIDExNTkuMjUgMTM2MS4yNVxuLSBCQUNfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAxNDI5LjQxIDE2MzEuNDFcbiJ9 -->

```
                            Df Deviance     AIC
- codeFiliere_5              9   721.46  907.46
- codeFiliere_9              9   723.62  909.62
- codeFiliere_3              9   726.36  912.36
- codeFiliere_7              9   727.26  913.26
- age                       11   731.46  913.46
- mentionAuBac               3   717.50  915.50
- codeFiliere_6              9   731.03  917.03
- `2NDE_ANGLAIS`             1   715.50  917.50
- `1ERE_FRANCAIS`            1   715.50  917.50
- TLE_SVT                    1   715.56  917.56
- `1ERE_SVT`                 1   715.89  917.89
- `2NDE_FRANCAIS`            1   715.91  917.91
- `2NDE_SVT`                 1   716.03  918.03
- genre                      1   717.20  919.20
<none>                           715.50  919.50
- `2NDE_SCIENCES PHYSIQUES`  1   719.78  921.78
- `2NDE_MATHEMATIQUES`       1   720.03  922.03
- TLE_ANGLAIS                1   720.04  922.04
- `TLE_SCIENCES PHYSIQUES`   1   721.06  923.06
- TLE_FRANCAIS               1   724.15  926.15
- `1ERE_SCIENCES PHYSIQUES`  1   726.32  928.32
- `1ERE_MATHEMATIQUES`       1   727.08  929.08
- `1ERE_ANGLAIS`             1   732.47  934.47
- rangEnTerminale            3   741.32  939.32
- redoublementTerminale      1   742.70  944.70
- codeFiliere_1              8   767.17  955.17
- TLE_MATHEMATIQUES          1   759.88  961.88
- codeFiliere_2              9   783.51  969.51
- BAC_SVT                    1   871.81 1073.81
- BAC_ANGLAIS                1   920.46 1122.46
- BAC_FRANCAIS               1  1028.76 1230.76
- `BAC_SCIENCES PHYSIQUES`   1  1159.25 1361.25
- BAC_MATHEMATIQUES          1  1429.41 1631.41
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5TdGVwOiAgQUlDPTkwNy40NlxuYWRtaXNzaWJsZSB+IGdlbnJlICsgbWVudGlvbkF1QmFjICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgYWdlICsgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV8zICsgY29kZUZpbGllcmVfNiArIFxuICAgIGNvZGVGaWxpZXJlXzcgKyBjb2RlRmlsaWVyZV85ICsgYDFFUkVfQU5HTEFJU2AgKyBgMUVSRV9GUkFOQ0FJU2AgKyBcbiAgICBgMUVSRV9NQVRIRU1BVElRVUVTYCArIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMUVSRV9TVlRgICsgXG4gICAgYDJOREVfQU5HTEFJU2AgKyBgMk5ERV9GUkFOQ0FJU2AgKyBgMk5ERV9NQVRIRU1BVElRVUVTYCArIFxuICAgIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMk5ERV9TVlRgICsgQkFDX0FOR0xBSVMgKyBCQUNfRlJBTkNBSVMgKyBcbiAgICBCQUNfTUFUSEVNQVRJUVVFUyArIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCArIEJBQ19TVlQgKyBcbiAgICBUTEVfQU5HTEFJUyArIFRMRV9GUkFOQ0FJUyArIFRMRV9NQVRIRU1BVElRVUVTICsgYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgXG4gICAgVExFX1NWVFxuIn0= -->

```

Step:  AIC=907.46
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    age + codeFiliere_1 + codeFiliere_2 + codeFiliere_3 + codeFiliere_6 + 
    codeFiliere_7 + codeFiliere_9 + `1ERE_ANGLAIS` + `1ERE_FRANCAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + 
    `2NDE_ANGLAIS` + `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + 
    TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuIn0= -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gY29kZUZpbGllcmVfOSAgICAgICAgICAgICAgOSAgIDczMC4yOSAgODk4LjI5XG4tIGNvZGVGaWxpZXJlXzMgICAgICAgICAgICAgIDkgICA3MzIuNjIgIDkwMC42MlxuLSBjb2RlRmlsaWVyZV83ICAgICAgICAgICAgICA5ICAgNzMzLjAzICA5MDEuMDNcbi0gYWdlICAgICAgICAgICAgICAgICAgICAgICAxMSAgIDczNy43MSAgOTAxLjcxXG4tIG1lbnRpb25BdUJhYyAgICAgICAgICAgICAgIDMgICA3MjMuMjkgIDkwMy4yOVxuLSBgMUVSRV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzIxLjQ2ICA5MDUuNDZcbi0gYDJOREVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDcyMS40NiAgOTA1LjQ2XG4tIFRMRV9TVlQgICAgICAgICAgICAgICAgICAgIDEgICA3MjEuNDcgIDkwNS40N1xuLSBgMk5ERV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzIxLjcxICA5MDUuNzFcbi0gYDFFUkVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDcyMS43NiAgOTA1Ljc2XG4tIGAyTkRFX1NWVGAgICAgICAgICAgICAgICAgIDEgICA3MjIuMjMgIDkwNi4yM1xuLSBnZW5yZSAgICAgICAgICAgICAgICAgICAgICAxICAgNzIzLjI4ICA5MDcuMjhcbjxub25lPiAgICAgICAgICAgICAgICAgICAgICAgICAgIDcyMS40NiAgOTA3LjQ2XG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3NDAuNjggIDkwOC42OFxuLSBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzI1LjQ0ICA5MDkuNDRcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDcyNS42MSAgOTA5LjYxXG4tIFRMRV9BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA3MjYuMzcgIDkxMC4zN1xuLSBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAgNzI3LjMxICA5MTEuMzFcbi0gVExFX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgIDczMC42MiAgOTE0LjYyXG4tIGAxRVJFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3MzIuNTkgIDkxNi41OVxuLSBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzMzLjQ4ICA5MTcuNDhcbi0gYDFFUkVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDczNy45NyAgOTIxLjk3XG4tIHJhbmdFblRlcm1pbmFsZSAgICAgICAgICAgIDMgICA3NDYuMzcgIDkyNi4zN1xuLSByZWRvdWJsZW1lbnRUZXJtaW5hbGUgICAgICAxICAgNzUwLjI3ICA5MzQuMjdcbi0gY29kZUZpbGllcmVfMSAgICAgICAgICAgICAgOCAgIDc3MS45NyAgOTQxLjk3XG4tIFRMRV9NQVRIRU1BVElRVUVTICAgICAgICAgIDEgICA3NjcuNDEgIDk1MS40MVxuLSBjb2RlRmlsaWVyZV8yICAgICAgICAgICAgICA5ICAgNzg4LjcwICA5NTYuNzBcbi0gQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDg3OC44OSAxMDYyLjg5XG4tIEJBQ19BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA5MjcuNzcgMTExMS43N1xuLSBCQUNfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAxMDM5Ljk1IDEyMjMuOTVcbi0gYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgMTE2Ni44OSAxMzUwLjg5XG4tIEJBQ19NQVRIRU1BVElRVUVTICAgICAgICAgIDEgIDE0NDEuNjEgMTYyNS42MVxuIn0= -->

```
                            Df Deviance     AIC
- codeFiliere_9              9   730.29  898.29
- codeFiliere_3              9   732.62  900.62
- codeFiliere_7              9   733.03  901.03
- age                       11   737.71  901.71
- mentionAuBac               3   723.29  903.29
- `1ERE_FRANCAIS`            1   721.46  905.46
- `2NDE_ANGLAIS`             1   721.46  905.46
- TLE_SVT                    1   721.47  905.47
- `2NDE_FRANCAIS`            1   721.71  905.71
- `1ERE_SVT`                 1   721.76  905.76
- `2NDE_SVT`                 1   722.23  906.23
- genre                      1   723.28  907.28
<none>                           721.46  907.46
- codeFiliere_6              9   740.68  908.68
- `2NDE_SCIENCES PHYSIQUES`  1   725.44  909.44
- `2NDE_MATHEMATIQUES`       1   725.61  909.61
- TLE_ANGLAIS                1   726.37  910.37
- `TLE_SCIENCES PHYSIQUES`   1   727.31  911.31
- TLE_FRANCAIS               1   730.62  914.62
- `1ERE_MATHEMATIQUES`       1   732.59  916.59
- `1ERE_SCIENCES PHYSIQUES`  1   733.48  917.48
- `1ERE_ANGLAIS`             1   737.97  921.97
- rangEnTerminale            3   746.37  926.37
- redoublementTerminale      1   750.27  934.27
- codeFiliere_1              8   771.97  941.97
- TLE_MATHEMATIQUES          1   767.41  951.41
- codeFiliere_2              9   788.70  956.70
- BAC_SVT                    1   878.89 1062.89
- BAC_ANGLAIS                1   927.77 1111.77
- BAC_FRANCAIS               1  1039.95 1223.95
- `BAC_SCIENCES PHYSIQUES`   1  1166.89 1350.89
- BAC_MATHEMATIQUES          1  1441.61 1625.61
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5TdGVwOiAgQUlDPTg5OC4yOVxuYWRtaXNzaWJsZSB+IGdlbnJlICsgbWVudGlvbkF1QmFjICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgYWdlICsgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV8zICsgY29kZUZpbGllcmVfNiArIFxuICAgIGNvZGVGaWxpZXJlXzcgKyBgMUVSRV9BTkdMQUlTYCArIGAxRVJFX0ZSQU5DQUlTYCArIGAxRVJFX01BVEhFTUFUSVFVRVNgICsgXG4gICAgYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAxRVJFX1NWVGAgKyBgMk5ERV9BTkdMQUlTYCArIFxuICAgIGAyTkRFX0ZSQU5DQUlTYCArIGAyTkRFX01BVEhFTUFUSVFVRVNgICsgYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFxuICAgIGAyTkRFX1NWVGAgKyBCQUNfQU5HTEFJUyArIEJBQ19GUkFOQ0FJUyArIEJBQ19NQVRIRU1BVElRVUVTICsgXG4gICAgYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICsgQkFDX1NWVCArIFRMRV9BTkdMQUlTICsgVExFX0ZSQU5DQUlTICsgXG4gICAgVExFX01BVEhFTUFUSVFVRVMgKyBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBUTEVfU1ZUXG4ifQ== -->

```

Step:  AIC=898.29
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    age + codeFiliere_1 + codeFiliere_2 + codeFiliere_3 + codeFiliere_6 + 
    codeFiliere_7 + `1ERE_ANGLAIS` + `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + 
    `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + `2NDE_ANGLAIS` + 
    `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + 
    `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + 
    `BAC_SCIENCES PHYSIQUES` + BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + 
    TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gYWdlICAgICAgICAgICAgICAgICAgICAgICAxMSAgIDc0Ni4xOCAgODkyLjE4XG4tIGNvZGVGaWxpZXJlXzcgICAgICAgICAgICAgIDkgICA3NDIuNDUgIDg5Mi40NVxuLSBjb2RlRmlsaWVyZV8zICAgICAgICAgICAgICA5ICAgNzQzLjk3ICA4OTMuOTdcbi0gbWVudGlvbkF1QmFjICAgICAgICAgICAgICAgMyAgIDczMi4xMSAgODk0LjExXG4tIFRMRV9TVlQgICAgICAgICAgICAgICAgICAgIDEgICA3MzAuMjkgIDg5Ni4yOVxuLSBgMUVSRV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzMwLjI5ICA4OTYuMjlcbi0gYDJOREVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDczMC4zMCAgODk2LjMwXG4tIGAyTkRFX0ZSQU5DQUlTYCAgICAgICAgICAgIDEgICA3MzAuNDkgIDg5Ni40OVxuLSBgMUVSRV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzMwLjUwICA4OTYuNTBcbi0gYDJOREVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDczMC43NCAgODk2Ljc0XG4tIGdlbnJlICAgICAgICAgICAgICAgICAgICAgIDEgICA3MzIuMjMgIDg5OC4yM1xuPG5vbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzMwLjI5ICA4OTguMjlcbi0gY29kZUZpbGllcmVfNiAgICAgICAgICAgICAgOSAgIDc0OC45NSAgODk4Ljk1XG4tIGAyTkRFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3MzMuOTIgIDg5OS45MlxuLSBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzM0LjEwICA5MDAuMTBcbi0gVExFX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDczNS41MyAgOTAxLjUzXG4tIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgICA3MzYuMDMgIDkwMi4wM1xuLSBUTEVfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAgNzM5LjAxICA5MDUuMDFcbi0gYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc0MS43OCAgOTA3Ljc4XG4tIGAxRVJFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3NDIuMzYgIDkwOC4zNlxuLSBgMUVSRV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzQ3LjQxICA5MTMuNDFcbi0gcmFuZ0VuVGVybWluYWxlICAgICAgICAgICAgMyAgIDc1NS40MCAgOTE3LjQwXG4tIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgICAgIDEgICA3NTcuMjAgIDkyMy4yMFxuLSBjb2RlRmlsaWVyZV8xICAgICAgICAgICAgICA4ICAgNzc3LjMxICA5MjkuMzFcbi0gVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgIDc3NC44NSAgOTQwLjg1XG4tIGNvZGVGaWxpZXJlXzIgICAgICAgICAgICAgIDkgICA3OTYuNjQgIDk0Ni42NFxuLSBCQUNfU1ZUICAgICAgICAgICAgICAgICAgICAxICAgODkwLjEyIDEwNTYuMTJcbi0gQkFDX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDkzNS4xOSAxMTAxLjE5XG4tIEJBQ19GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgIDEwNDMuNzAgMTIwOS43MFxuLSBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAxMTc4LjYzIDEzNDQuNjNcbi0gQkFDX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgMTQ1OC4yMyAxNjI0LjIzXG4ifQ== -->

```
                            Df Deviance     AIC
- age                       11   746.18  892.18
- codeFiliere_7              9   742.45  892.45
- codeFiliere_3              9   743.97  893.97
- mentionAuBac               3   732.11  894.11
- TLE_SVT                    1   730.29  896.29
- `1ERE_FRANCAIS`            1   730.29  896.29
- `2NDE_ANGLAIS`             1   730.30  896.30
- `2NDE_FRANCAIS`            1   730.49  896.49
- `1ERE_SVT`                 1   730.50  896.50
- `2NDE_SVT`                 1   730.74  896.74
- genre                      1   732.23  898.23
<none>                           730.29  898.29
- codeFiliere_6              9   748.95  898.95
- `2NDE_MATHEMATIQUES`       1   733.92  899.92
- `2NDE_SCIENCES PHYSIQUES`  1   734.10  900.10
- TLE_ANGLAIS                1   735.53  901.53
- `TLE_SCIENCES PHYSIQUES`   1   736.03  902.03
- TLE_FRANCAIS               1   739.01  905.01
- `1ERE_SCIENCES PHYSIQUES`  1   741.78  907.78
- `1ERE_MATHEMATIQUES`       1   742.36  908.36
- `1ERE_ANGLAIS`             1   747.41  913.41
- rangEnTerminale            3   755.40  917.40
- redoublementTerminale      1   757.20  923.20
- codeFiliere_1              8   777.31  929.31
- TLE_MATHEMATIQUES          1   774.85  940.85
- codeFiliere_2              9   796.64  946.64
- BAC_SVT                    1   890.12 1056.12
- BAC_ANGLAIS                1   935.19 1101.19
- BAC_FRANCAIS               1  1043.70 1209.70
- `BAC_SCIENCES PHYSIQUES`   1  1178.63 1344.63
- BAC_MATHEMATIQUES          1  1458.23 1624.23
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5TdGVwOiAgQUlDPTg5Mi4xOFxuYWRtaXNzaWJsZSB+IGdlbnJlICsgbWVudGlvbkF1QmFjICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV8zICsgY29kZUZpbGllcmVfNiArIFxuICAgIGNvZGVGaWxpZXJlXzcgKyBgMUVSRV9BTkdMQUlTYCArIGAxRVJFX0ZSQU5DQUlTYCArIGAxRVJFX01BVEhFTUFUSVFVRVNgICsgXG4gICAgYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAxRVJFX1NWVGAgKyBgMk5ERV9BTkdMQUlTYCArIFxuICAgIGAyTkRFX0ZSQU5DQUlTYCArIGAyTkRFX01BVEhFTUFUSVFVRVNgICsgYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFxuICAgIGAyTkRFX1NWVGAgKyBCQUNfQU5HTEFJUyArIEJBQ19GUkFOQ0FJUyArIEJBQ19NQVRIRU1BVElRVUVTICsgXG4gICAgYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICsgQkFDX1NWVCArIFRMRV9BTkdMQUlTICsgVExFX0ZSQU5DQUlTICsgXG4gICAgVExFX01BVEhFTUFUSVFVRVMgKyBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBUTEVfU1ZUXG4ifQ== -->

```

Step:  AIC=892.18
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_3 + codeFiliere_6 + 
    codeFiliere_7 + `1ERE_ANGLAIS` + `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + 
    `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + `2NDE_ANGLAIS` + 
    `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + 
    `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + 
    `BAC_SCIENCES PHYSIQUES` + BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + 
    TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuIn0= -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gY29kZUZpbGllcmVfNyAgICAgICAgICAgICAgOSAgIDc1Ni4yMiAgODg0LjIyXG4tIGNvZGVGaWxpZXJlXzMgICAgICAgICAgICAgIDkgICA3NTkuMjggIDg4Ny4yOFxuLSBtZW50aW9uQXVCYWMgICAgICAgICAgICAgICAzICAgNzQ3LjgxICA4ODcuODFcbi0gYDFFUkVfRlJBTkNBSVNgICAgICAgICAgICAgMSAgIDc0Ni4xOCAgODkwLjE4XG4tIFRMRV9TVlQgICAgICAgICAgICAgICAgICAgIDEgICA3NDYuMjYgIDg5MC4yNlxuLSBgMk5ERV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzQ2LjI3ICA4OTAuMjdcbi0gYDJOREVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDc0Ni4zMiAgODkwLjMyXG4tIGAxRVJFX1NWVGAgICAgICAgICAgICAgICAgIDEgICA3NDYuNDcgIDg5MC40N1xuLSBgMk5ERV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzQ3LjA4ICA4OTEuMDhcbi0gZ2VucmUgICAgICAgICAgICAgICAgICAgICAgMSAgIDc0Ny42MSAgODkxLjYxXG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3NjMuNzYgIDg5MS43NlxuPG5vbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzQ2LjE4ICA4OTIuMThcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc0OS4xMyAgODkzLjEzXG4tIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3NTAuMjAgIDg5NC4yMFxuLSBUTEVfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgNzUxLjM3ICA4OTUuMzdcbi0gYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgIDc1MS43MCAgODk1LjcwXG4tIFRMRV9GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgICA3NTUuMDkgIDg5OS4wOVxuLSBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzU3LjY4ICA5MDEuNjhcbi0gYDFFUkVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc1OS4yMiAgOTAzLjIyXG4tIGAxRVJFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3NjEuMjEgIDkwNS4yMVxuLSByYW5nRW5UZXJtaW5hbGUgICAgICAgICAgICAzICAgNzcxLjEwICA5MTEuMTBcbi0gY29kZUZpbGllcmVfMSAgICAgICAgICAgICAgOCAgIDc5MS4yMiAgOTIxLjIyXG4tIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgICAgIDEgICA3ODIuMzkgIDkyNi4zOVxuLSBUTEVfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAgNzg2LjQ2ICA5MzAuNDZcbi0gY29kZUZpbGllcmVfMiAgICAgICAgICAgICAgOSAgIDgxMS40MSAgOTM5LjQxXG4tIEJBQ19TVlQgICAgICAgICAgICAgICAgICAgIDEgICA5MDMuNjkgMTA0Ny42OVxuLSBCQUNfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgOTQ1LjA0IDEwODkuMDRcbi0gQkFDX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgMTA1OS40NiAxMjAzLjQ2XG4tIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgIDExOTMuNTIgMTMzNy41MlxuLSBCQUNfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAxNDc1LjIxIDE2MTkuMjFcbiJ9 -->

```
                            Df Deviance     AIC
- codeFiliere_7              9   756.22  884.22
- codeFiliere_3              9   759.28  887.28
- mentionAuBac               3   747.81  887.81
- `1ERE_FRANCAIS`            1   746.18  890.18
- TLE_SVT                    1   746.26  890.26
- `2NDE_FRANCAIS`            1   746.27  890.27
- `2NDE_ANGLAIS`             1   746.32  890.32
- `1ERE_SVT`                 1   746.47  890.47
- `2NDE_SVT`                 1   747.08  891.08
- genre                      1   747.61  891.61
- codeFiliere_6              9   763.76  891.76
<none>                           746.18  892.18
- `2NDE_MATHEMATIQUES`       1   749.13  893.13
- `2NDE_SCIENCES PHYSIQUES`  1   750.20  894.20
- TLE_ANGLAIS                1   751.37  895.37
- `TLE_SCIENCES PHYSIQUES`   1   751.70  895.70
- TLE_FRANCAIS               1   755.09  899.09
- `1ERE_SCIENCES PHYSIQUES`  1   757.68  901.68
- `1ERE_MATHEMATIQUES`       1   759.22  903.22
- `1ERE_ANGLAIS`             1   761.21  905.21
- rangEnTerminale            3   771.10  911.10
- codeFiliere_1              8   791.22  921.22
- redoublementTerminale      1   782.39  926.39
- TLE_MATHEMATIQUES          1   786.46  930.46
- codeFiliere_2              9   811.41  939.41
- BAC_SVT                    1   903.69 1047.69
- BAC_ANGLAIS                1   945.04 1089.04
- BAC_FRANCAIS               1  1059.46 1203.46
- `BAC_SCIENCES PHYSIQUES`   1  1193.52 1337.52
- BAC_MATHEMATIQUES          1  1475.21 1619.21
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5TdGVwOiAgQUlDPTg4NC4yMlxuYWRtaXNzaWJsZSB+IGdlbnJlICsgbWVudGlvbkF1QmFjICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV8zICsgY29kZUZpbGllcmVfNiArIFxuICAgIGAxRVJFX0FOR0xBSVNgICsgYDFFUkVfRlJBTkNBSVNgICsgYDFFUkVfTUFUSEVNQVRJUVVFU2AgKyBcbiAgICBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgYDFFUkVfU1ZUYCArIGAyTkRFX0FOR0xBSVNgICsgXG4gICAgYDJOREVfRlJBTkNBSVNgICsgYDJOREVfTUFUSEVNQVRJUVVFU2AgKyBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgXG4gICAgYDJOREVfU1ZUYCArIEJBQ19BTkdMQUlTICsgQkFDX0ZSQU5DQUlTICsgQkFDX01BVEhFTUFUSVFVRVMgKyBcbiAgICBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBCQUNfU1ZUICsgVExFX0FOR0xBSVMgKyBUTEVfRlJBTkNBSVMgKyBcbiAgICBUTEVfTUFUSEVNQVRJUVVFUyArIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFRMRV9TVlRcbiJ9 -->

```

Step:  AIC=884.22
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_3 + codeFiliere_6 + 
    `1ERE_ANGLAIS` + `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + 
    `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + `2NDE_ANGLAIS` + 
    `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + 
    `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + 
    `BAC_SCIENCES PHYSIQUES` + BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + 
    TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbldhcm5pbmc6IGdsbS5maXQ6IGRlcyBwcm9iYWJpbGl0w6lzIG9udCDDqXTDqSBhanVzdMOpZXMgbnVtw6lyaXF1ZW1lbnQgw6AgMCBvdSAxXG5XYXJuaW5nOiBnbG0uZml0OiBkZXMgcHJvYmFiaWxpdMOpcyBvbnQgw6l0w6kgYWp1c3TDqWVzIG51bcOpcmlxdWVtZW50IMOgIDAgb3UgMVxuIn0= -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gY29kZUZpbGllcmVfMyAgICAgICAgICAgICAgOSAgIDc2Ni4zNiAgODc2LjM2XG4tIG1lbnRpb25BdUJhYyAgICAgICAgICAgICAgIDMgICA3NTcuMzkgIDg3OS4zOVxuLSBgMUVSRV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzU2LjIyICA4ODIuMjJcbi0gYDJOREVfRlJBTkNBSVNgICAgICAgICAgICAgMSAgIDc1Ni4zMiAgODgyLjMyXG4tIFRMRV9TVlQgICAgICAgICAgICAgICAgICAgIDEgICA3NTYuNDUgIDg4Mi40NVxuLSBgMk5ERV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzU2LjUzICA4ODIuNTNcbi0gYDFFUkVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDc1Ni41OSAgODgyLjU5XG4tIGAyTkRFX1NWVGAgICAgICAgICAgICAgICAgIDEgICA3NTYuOTUgIDg4Mi45NVxuLSBnZW5yZSAgICAgICAgICAgICAgICAgICAgICAxICAgNzU3LjMzICA4ODMuMzNcbjxub25lPiAgICAgICAgICAgICAgICAgICAgICAgICAgIDc1Ni4yMiAgODg0LjIyXG4tIGAyTkRFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3NTguNjkgIDg4NC42OVxuLSBjb2RlRmlsaWVyZV82ICAgICAgICAgICAgICA5ICAgNzc2LjAwICA4ODYuMDBcbi0gYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc2MC4xOSAgODg2LjE5XG4tIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgICA3NjAuNzMgIDg4Ni43M1xuLSBUTEVfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgNzYxLjQ2ICA4ODcuNDZcbi0gVExFX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgIDc2NS41OSAgODkxLjU5XG4tIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3NjYuODkgIDg5Mi44OVxuLSBgMUVSRV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzY4LjY3ICA4OTQuNjdcbi0gYDFFUkVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDc3MC40MiAgODk2LjQyXG4tIHJhbmdFblRlcm1pbmFsZSAgICAgICAgICAgIDMgICA3ODEuNDQgIDkwMy40NFxuLSBjb2RlRmlsaWVyZV8xICAgICAgICAgICAgICA4ICAgODAxLjY0ICA5MTMuNjRcbi0gcmVkb3VibGVtZW50VGVybWluYWxlICAgICAgMSAgIDc5MS4wOSAgOTE3LjA5XG4tIFRMRV9NQVRIRU1BVElRVUVTICAgICAgICAgIDEgICA3OTguNDIgIDkyNC40MlxuLSBjb2RlRmlsaWVyZV8yICAgICAgICAgICAgICA5ICAgODIxLjE4ICA5MzEuMThcbi0gQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDkxMS41NSAxMDM3LjU1XG4tIEJBQ19BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA5NTIuNzQgMTA3OC43NFxuLSBCQUNfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAxMDcxLjQwIDExOTcuNDBcbi0gYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgMTIwMy44MiAxMzI5LjgyXG4tIEJBQ19NQVRIRU1BVElRVUVTICAgICAgICAgIDEgIDE0ODMuMTMgMTYwOS4xM1xuXG5TdGVwOiAgQUlDPTg3Ni4zNlxuYWRtaXNzaWJsZSB+IGdlbnJlICsgbWVudGlvbkF1QmFjICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV82ICsgYDFFUkVfQU5HTEFJU2AgKyBcbiAgICBgMUVSRV9GUkFOQ0FJU2AgKyBgMUVSRV9NQVRIRU1BVElRVUVTYCArIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBcbiAgICBgMUVSRV9TVlRgICsgYDJOREVfQU5HTEFJU2AgKyBgMk5ERV9GUkFOQ0FJU2AgKyBgMk5ERV9NQVRIRU1BVElRVUVTYCArIFxuICAgIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMk5ERV9TVlRgICsgQkFDX0FOR0xBSVMgKyBCQUNfRlJBTkNBSVMgKyBcbiAgICBCQUNfTUFUSEVNQVRJUVVFUyArIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCArIEJBQ19TVlQgKyBcbiAgICBUTEVfQU5HTEFJUyArIFRMRV9GUkFOQ0FJUyArIFRMRV9NQVRIRU1BVElRVUVTICsgYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgXG4gICAgVExFX1NWVFxuIn0= -->

```
                            Df Deviance     AIC
- codeFiliere_3              9   766.36  876.36
- mentionAuBac               3   757.39  879.39
- `1ERE_FRANCAIS`            1   756.22  882.22
- `2NDE_FRANCAIS`            1   756.32  882.32
- TLE_SVT                    1   756.45  882.45
- `2NDE_ANGLAIS`             1   756.53  882.53
- `1ERE_SVT`                 1   756.59  882.59
- `2NDE_SVT`                 1   756.95  882.95
- genre                      1   757.33  883.33
<none>                           756.22  884.22
- `2NDE_MATHEMATIQUES`       1   758.69  884.69
- codeFiliere_6              9   776.00  886.00
- `2NDE_SCIENCES PHYSIQUES`  1   760.19  886.19
- `TLE_SCIENCES PHYSIQUES`   1   760.73  886.73
- TLE_ANGLAIS                1   761.46  887.46
- TLE_FRANCAIS               1   765.59  891.59
- `1ERE_SCIENCES PHYSIQUES`  1   766.89  892.89
- `1ERE_MATHEMATIQUES`       1   768.67  894.67
- `1ERE_ANGLAIS`             1   770.42  896.42
- rangEnTerminale            3   781.44  903.44
- codeFiliere_1              8   801.64  913.64
- redoublementTerminale      1   791.09  917.09
- TLE_MATHEMATIQUES          1   798.42  924.42
- codeFiliere_2              9   821.18  931.18
- BAC_SVT                    1   911.55 1037.55
- BAC_ANGLAIS                1   952.74 1078.74
- BAC_FRANCAIS               1  1071.40 1197.40
- `BAC_SCIENCES PHYSIQUES`   1  1203.82 1329.82
- BAC_MATHEMATIQUES          1  1483.13 1609.13

Step:  AIC=876.36
admissible ~ genre + mentionAuBac + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + 
    `1ERE_SVT` + `2NDE_ANGLAIS` + `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + 
    TLE_SVT
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gbWVudGlvbkF1QmFjICAgICAgICAgICAgICAgMyAgIDc2Ny43NCAgODcxLjc0XG4tIGAxRVJFX0ZSQU5DQUlTYCAgICAgICAgICAgIDEgICA3NjYuMzYgIDg3NC4zNlxuLSBgMk5ERV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzY2LjQwICA4NzQuNDBcbi0gYDFFUkVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDc2Ni41MyAgODc0LjUzXG4tIGAyTkRFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3NjYuNzMgIDg3NC43M1xuLSBUTEVfU1ZUICAgICAgICAgICAgICAgICAgICAxICAgNzY2Ljc0ICA4NzQuNzRcbi0gYDJOREVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDc2Ni43NiAgODc0Ljc2XG4tIGdlbnJlICAgICAgICAgICAgICAgICAgICAgIDEgICA3NjcuMDggIDg3NS4wOFxuPG5vbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzY2LjM2ICA4NzYuMzZcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc2OC42OCAgODc2LjY4XG4tIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3NzAuNDEgIDg3OC40MVxuLSBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAgNzcxLjI0ICA4NzkuMjRcbi0gY29kZUZpbGllcmVfNiAgICAgICAgICAgICAgOSAgIDc4OC4zNCAgODgwLjM0XG4tIFRMRV9BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA3NzIuMzYgIDg4MC4zNlxuLSBUTEVfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAgNzc1Ljg0ICA4ODMuODRcbi0gYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3Ni44NiAgODg0Ljg2XG4tIGAxRVJFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3NzguNTAgIDg4Ni41MFxuLSBgMUVSRV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzgwLjI2ICA4ODguMjZcbi0gcmFuZ0VuVGVybWluYWxlICAgICAgICAgICAgMyAgIDc5MC44NyAgODk0Ljg3XG4tIGNvZGVGaWxpZXJlXzEgICAgICAgICAgICAgIDggICA4MTAuNTggIDkwNC41OFxuLSByZWRvdWJsZW1lbnRUZXJtaW5hbGUgICAgICAxICAgNzk5LjM2ICA5MDcuMzZcbi0gVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgIDgwNy41NyAgOTE1LjU3XG4tIGNvZGVGaWxpZXJlXzIgICAgICAgICAgICAgIDkgICA4MzYuMDAgIDkyOC4wMFxuLSBCQUNfU1ZUICAgICAgICAgICAgICAgICAgICAxICAgOTE5Ljg5IDEwMjcuODlcbi0gQkFDX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDk2MS4yNCAxMDY5LjI0XG4tIEJBQ19GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgIDEwNzYuMzEgMTE4NC4zMVxuLSBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAxMjE4LjM2IDEzMjYuMzZcbi0gQkFDX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgMTQ5Ni42NCAxNjA0LjY0XG5cblN0ZXA6ICBBSUM9ODcxLjc0XG5hZG1pc3NpYmxlIH4gZ2VucmUgKyByZWRvdWJsZW1lbnRUZXJtaW5hbGUgKyByYW5nRW5UZXJtaW5hbGUgKyBcbiAgICBjb2RlRmlsaWVyZV8xICsgY29kZUZpbGllcmVfMiArIGNvZGVGaWxpZXJlXzYgKyBgMUVSRV9BTkdMQUlTYCArIFxuICAgIGAxRVJFX0ZSQU5DQUlTYCArIGAxRVJFX01BVEhFTUFUSVFVRVNgICsgYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFxuICAgIGAxRVJFX1NWVGAgKyBgMk5ERV9BTkdMQUlTYCArIGAyTkRFX0ZSQU5DQUlTYCArIGAyTkRFX01BVEhFTUFUSVFVRVNgICsgXG4gICAgYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAyTkRFX1NWVGAgKyBCQUNfQU5HTEFJUyArIEJBQ19GUkFOQ0FJUyArIFxuICAgIEJBQ19NQVRIRU1BVElRVUVTICsgYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICsgQkFDX1NWVCArIFxuICAgIFRMRV9BTkdMQUlTICsgVExFX0ZSQU5DQUlTICsgVExFX01BVEhFTUFUSVFVRVMgKyBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBcbiAgICBUTEVfU1ZUXG5cbiAgICAgICAgICAgICAgICAgICAgICAgICAgICBEZiBEZXZpYW5jZSAgICAgQUlDXG4tIGAxRVJFX0ZSQU5DQUlTYCAgICAgICAgICAgIDEgICA3NjcuNzUgIDg2OS43NVxuLSBgMk5ERV9GUkFOQ0FJU2AgICAgICAgICAgICAxICAgNzY3Ljc4ICA4NjkuNzhcbi0gYDFFUkVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDc2Ny45MyAgODY5LjkzXG4tIFRMRV9TVlQgICAgICAgICAgICAgICAgICAgIDEgICA3NjguMDggIDg3MC4wOFxuLSBgMk5ERV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzY4LjE0ICA4NzAuMTRcbi0gYDJOREVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDc2OC4xNCAgODcwLjE0XG4tIGdlbnJlICAgICAgICAgICAgICAgICAgICAgIDEgICA3NjguMzcgIDg3MC4zN1xuPG5vbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzY3Ljc0ICA4NzEuNzRcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc3MC4xMiAgODcyLjEyXG4tIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3NzEuNDUgIDg3My40NVxuLSBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAgNzcyLjc1ICA4NzQuNzVcbi0gVExFX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDc3My4zNSAgODc1LjM1XG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3OTAuMjQgIDg3Ni4yNFxuLSBUTEVfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAgNzc3LjU5ICA4NzkuNTlcbi0gYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3OC4wNyAgODgwLjA3XG4tIGAxRVJFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3NzkuNzggIDg4MS43OFxuLSBgMUVSRV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzgxLjczICA4ODMuNzNcbi0gcmFuZ0VuVGVybWluYWxlICAgICAgICAgICAgMyAgIDc5Mi43OCAgODkwLjc4XG4tIGNvZGVGaWxpZXJlXzEgICAgICAgICAgICAgIDggICA4MTEuNTMgIDg5OS41M1xuLSByZWRvdWJsZW1lbnRUZXJtaW5hbGUgICAgICAxICAgODAwLjMzICA5MDIuMzNcbi0gVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgIDgwOC44MSAgOTEwLjgxXG4tIGNvZGVGaWxpZXJlXzIgICAgICAgICAgICAgIDkgICA4MzYuNjQgIDkyMi42NFxuLSBCQUNfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgOTc0LjAzIDEwNzYuMDNcbi0gQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDk3OC42NyAxMDgwLjY3XG4tIEJBQ19GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgIDExMDcuNjMgMTIwOS42M1xuLSBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAxMzY1LjUwIDE0NjcuNTBcbi0gQkFDX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgMTcwMC4yMiAxODAyLjIyXG5cblN0ZXA6ICBBSUM9ODY5Ljc1XG5hZG1pc3NpYmxlIH4gZ2VucmUgKyByZWRvdWJsZW1lbnRUZXJtaW5hbGUgKyByYW5nRW5UZXJtaW5hbGUgKyBcbiAgICBjb2RlRmlsaWVyZV8xICsgY29kZUZpbGllcmVfMiArIGNvZGVGaWxpZXJlXzYgKyBgMUVSRV9BTkdMQUlTYCArIFxuICAgIGAxRVJFX01BVEhFTUFUSVFVRVNgICsgYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAxRVJFX1NWVGAgKyBcbiAgICBgMk5ERV9BTkdMQUlTYCArIGAyTkRFX0ZSQU5DQUlTYCArIGAyTkRFX01BVEhFTUFUSVFVRVNgICsgXG4gICAgYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAyTkRFX1NWVGAgKyBCQUNfQU5HTEFJUyArIEJBQ19GUkFOQ0FJUyArIFxuICAgIEJBQ19NQVRIRU1BVElRVUVTICsgYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICsgQkFDX1NWVCArIFxuICAgIFRMRV9BTkdMQUlTICsgVExFX0ZSQU5DQUlTICsgVExFX01BVEhFTUFUSVFVRVMgKyBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBcbiAgICBUTEVfU1ZUXG5cbiAgICAgICAgICAgICAgICAgICAgICAgICAgICBEZiBEZXZpYW5jZSAgICAgQUlDXG4tIGAyTkRFX0ZSQU5DQUlTYCAgICAgICAgICAgIDEgICA3NjcuODAgIDg2Ny44MFxuLSBgMUVSRV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzY3LjkzICA4NjcuOTNcbi0gVExFX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDc2OC4wOSAgODY4LjA5XG4tIGAyTkRFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3NjguMTUgIDg2OC4xNVxuLSBgMk5ERV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzY4LjE2ICA4NjguMTZcbi0gZ2VucmUgICAgICAgICAgICAgICAgICAgICAgMSAgIDc2OC4zOCAgODY4LjM4XG48bm9uZT4gICAgICAgICAgICAgICAgICAgICAgICAgICA3NjcuNzUgIDg2OS43NVxuLSBgMk5ERV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzcwLjEzICA4NzAuMTNcbi0gYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3MS40NSAgODcxLjQ1XG4tIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgICA3NzIuNzcgIDg3Mi43N1xuLSBUTEVfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgNzczLjM1ICA4NzMuMzVcbi0gY29kZUZpbGllcmVfNiAgICAgICAgICAgICAgOSAgIDc5MC4yNCAgODc0LjI0XG4tIFRMRV9GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgICA3NzcuNzcgIDg3Ny43N1xuLSBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzc4LjA4ICA4NzguMDhcbi0gYDFFUkVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc3OS44MCAgODc5LjgwXG4tIGAxRVJFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3ODEuNzMgIDg4MS43M1xuLSByYW5nRW5UZXJtaW5hbGUgICAgICAgICAgICAzICAgNzkyLjgwICA4ODguODBcbi0gY29kZUZpbGllcmVfMSAgICAgICAgICAgICAgOCAgIDgxMS41NSAgODk3LjU1XG4tIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgICAgIDEgICA4MDAuMzUgIDkwMC4zNVxuLSBUTEVfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAgODA4LjgxICA5MDguODFcbi0gY29kZUZpbGllcmVfMiAgICAgICAgICAgICAgOSAgIDgzNi42NyAgOTIwLjY3XG4tIEJBQ19BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA5NzQuMDQgMTA3NC4wNFxuLSBCQUNfU1ZUICAgICAgICAgICAgICAgICAgICAxICAgOTc4LjgzIDEwNzguODNcbi0gQkFDX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgMTEwNy43OSAxMjA3Ljc5XG4tIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgIDEzNjUuNTAgMTQ2NS41MFxuLSBCQUNfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAxNzAxLjI3IDE4MDEuMjdcblxuU3RlcDogIEFJQz04NjcuOFxuYWRtaXNzaWJsZSB+IGdlbnJlICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV82ICsgYDFFUkVfQU5HTEFJU2AgKyBcbiAgICBgMUVSRV9NQVRIRU1BVElRVUVTYCArIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMUVSRV9TVlRgICsgXG4gICAgYDJOREVfQU5HTEFJU2AgKyBgMk5ERV9NQVRIRU1BVElRVUVTYCArIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBcbiAgICBgMk5ERV9TVlRgICsgQkFDX0FOR0xBSVMgKyBCQUNfRlJBTkNBSVMgKyBCQUNfTUFUSEVNQVRJUVVFUyArIFxuICAgIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCArIEJBQ19TVlQgKyBUTEVfQU5HTEFJUyArIFRMRV9GUkFOQ0FJUyArIFxuICAgIFRMRV9NQVRIRU1BVElRVUVTICsgYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgVExFX1NWVFxuXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRGYgRGV2aWFuY2UgICAgIEFJQ1xuLSBgMUVSRV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzY3Ljk3ICA4NjUuOTdcbi0gVExFX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDc2OC4xNSAgODY2LjE1XG4tIGAyTkRFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3NjguMTcgIDg2Ni4xN1xuLSBgMk5ERV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzY4LjI1ICA4NjYuMjVcbi0gZ2VucmUgICAgICAgICAgICAgICAgICAgICAgMSAgIDc2OC40NCAgODY2LjQ0XG48bm9uZT4gICAgICAgICAgICAgICAgICAgICAgICAgICA3NjcuODAgIDg2Ny44MFxuLSBgMk5ERV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzcwLjE5ICA4NjguMTlcbi0gYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3MS40NiAgODY5LjQ2XG4tIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgICA3NzIuOTYgIDg3MC45NlxuLSBUTEVfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgNzczLjQ1ICA4NzEuNDVcbi0gY29kZUZpbGllcmVfNiAgICAgICAgICAgICAgOSAgIDc5MC4zMiAgODcyLjMyXG4tIFRMRV9GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgICA3NzcuOTMgIDg3NS45M1xuLSBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzc4LjEyICA4NzYuMTJcbi0gYDFFUkVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc3OS44MCAgODc3LjgwXG4tIGAxRVJFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3ODEuNzUgIDg3OS43NVxuLSByYW5nRW5UZXJtaW5hbGUgICAgICAgICAgICAzICAgNzkyLjgxICA4ODYuODFcbi0gY29kZUZpbGllcmVfMSAgICAgICAgICAgICAgOCAgIDgxMS41NiAgODk1LjU2XG4tIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgICAgIDEgICA4MDAuMzYgIDg5OC4zNlxuLSBUTEVfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAgODA4LjkyICA5MDYuOTJcbi0gY29kZUZpbGllcmVfMiAgICAgICAgICAgICAgOSAgIDgzNi42NyAgOTE4LjY3XG4tIEJBQ19BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA5NzQuNjAgMTA3Mi42MFxuLSBCQUNfU1ZUICAgICAgICAgICAgICAgICAgICAxICAgOTc4Ljk4IDEwNzYuOThcbi0gQkFDX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgMTEwOC43NiAxMjA2Ljc2XG4tIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgIDEzNjUuNTIgMTQ2My41MlxuLSBCQUNfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAxNzAxLjkzIDE3OTkuOTNcblxuU3RlcDogIEFJQz04NjUuOTdcbmFkbWlzc2libGUgfiBnZW5yZSArIHJlZG91YmxlbWVudFRlcm1pbmFsZSArIHJhbmdFblRlcm1pbmFsZSArIFxuICAgIGNvZGVGaWxpZXJlXzEgKyBjb2RlRmlsaWVyZV8yICsgY29kZUZpbGllcmVfNiArIGAxRVJFX0FOR0xBSVNgICsgXG4gICAgYDFFUkVfTUFUSEVNQVRJUVVFU2AgKyBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgYDJOREVfQU5HTEFJU2AgKyBcbiAgICBgMk5ERV9NQVRIRU1BVElRVUVTYCArIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMk5ERV9TVlRgICsgXG4gICAgQkFDX0FOR0xBSVMgKyBCQUNfRlJBTkNBSVMgKyBCQUNfTUFUSEVNQVRJUVVFUyArIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFxuICAgIEJBQ19TVlQgKyBUTEVfQU5HTEFJUyArIFRMRV9GUkFOQ0FJUyArIFRMRV9NQVRIRU1BVElRVUVTICsgXG4gICAgYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgVExFX1NWVFxuXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRGYgRGV2aWFuY2UgICAgIEFJQ1xuLSBgMk5ERV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzY4LjM0ICA4NjQuMzRcbi0gYDJOREVfU1ZUYCAgICAgICAgICAgICAgICAgMSAgIDc2OC4zNSAgODY0LjM1XG4tIFRMRV9TVlQgICAgICAgICAgICAgICAgICAgIDEgICA3NjguMzcgIDg2NC4zN1xuLSBnZW5yZSAgICAgICAgICAgICAgICAgICAgICAxICAgNzY4LjYyICA4NjQuNjJcbjxub25lPiAgICAgICAgICAgICAgICAgICAgICAgICAgIDc2Ny45NyAgODY1Ljk3XG4tIGAyTkRFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3NzAuMzYgIDg2Ni4zNlxuLSBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzcxLjYzICA4NjcuNjNcbi0gYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgIDc3My4xNSAgODY5LjE1XG4tIFRMRV9BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA3NzMuNjQgIDg2OS42NFxuLSBjb2RlRmlsaWVyZV82ICAgICAgICAgICAgICA5ICAgNzkwLjUxICA4NzAuNTFcbi0gVExFX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgIDc3OC40NiAgODc0LjQ2XG4tIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3NzguNjcgIDg3NC42N1xuLSBgMUVSRV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzgwLjMzICA4NzYuMzNcbi0gYDFFUkVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDc4Mi43NyAgODc4Ljc3XG4tIHJhbmdFblRlcm1pbmFsZSAgICAgICAgICAgIDMgICA3OTMuMzggIDg4NS4zOFxuLSBjb2RlRmlsaWVyZV8xICAgICAgICAgICAgICA4ICAgODEyLjU2ICA4OTQuNTZcbi0gcmVkb3VibGVtZW50VGVybWluYWxlICAgICAgMSAgIDgwMS44MiAgODk3LjgyXG4tIFRMRV9NQVRIRU1BVElRVUVTICAgICAgICAgIDEgICA4MDguOTMgIDkwNC45M1xuLSBjb2RlRmlsaWVyZV8yICAgICAgICAgICAgICA5ICAgODM2Ljk1ICA5MTYuOTVcbi0gQkFDX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDk3Ni4xMSAxMDcyLjExXG4tIEJBQ19TVlQgICAgICAgICAgICAgICAgICAgIDEgICA5NzkuMTggMTA3NS4xOFxuLSBCQUNfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAxMTEyLjk3IDEyMDguOTdcbi0gYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgMTM2NS41NCAxNDYxLjU0XG4tIEJBQ19NQVRIRU1BVElRVUVTICAgICAgICAgIDEgIDE3MDIuNDggMTc5OC40OFxuXG5TdGVwOiAgQUlDPTg2NC4zNFxuYWRtaXNzaWJsZSB+IGdlbnJlICsgcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV82ICsgYDFFUkVfQU5HTEFJU2AgKyBcbiAgICBgMUVSRV9NQVRIRU1BVElRVUVTYCArIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMk5ERV9NQVRIRU1BVElRVUVTYCArIFxuICAgIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMk5ERV9TVlRgICsgQkFDX0FOR0xBSVMgKyBCQUNfRlJBTkNBSVMgKyBcbiAgICBCQUNfTUFUSEVNQVRJUVVFUyArIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCArIEJBQ19TVlQgKyBcbiAgICBUTEVfQU5HTEFJUyArIFRMRV9GUkFOQ0FJUyArIFRMRV9NQVRIRU1BVElRVUVTICsgYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgXG4gICAgVExFX1NWVFxuXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRGYgRGV2aWFuY2UgICAgIEFJQ1xuLSBgMk5ERV9TVlRgICAgICAgICAgICAgICAgICAxICAgNzY4LjY3ICA4NjIuNjdcbi0gVExFX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDc2OC43MiAgODYyLjcyXG4tIGdlbnJlICAgICAgICAgICAgICAgICAgICAgIDEgICA3NjkuMDAgIDg2My4wMFxuPG5vbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzY4LjM0ICA4NjQuMzRcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc3MC45NiAgODY0Ljk2XG4tIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3NzIuMDIgIDg2Ni4wMlxuLSBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAgNzczLjY2ICA4NjcuNjZcbi0gVExFX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDc3NC42MiAgODY4LjYyXG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3OTAuNjIgIDg2OC42MlxuLSBUTEVfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAgNzc4Ljk3ICA4NzIuOTdcbi0gYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3OS4wMCAgODczLjAwXG4tIGAxRVJFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3ODAuMzYgIDg3NC4zNlxuLSBgMUVSRV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzg2LjY5ICA4ODAuNjlcbi0gcmFuZ0VuVGVybWluYWxlICAgICAgICAgICAgMyAgIDc5My43OSAgODgzLjc5XG4tIGNvZGVGaWxpZXJlXzEgICAgICAgICAgICAgIDggICA4MTIuNjYgIDg5Mi42NlxuLSByZWRvdWJsZW1lbnRUZXJtaW5hbGUgICAgICAxICAgODAyLjk2ICA4OTYuOTZcbi0gVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgIDgwOS4wNyAgOTAzLjA3XG4tIGNvZGVGaWxpZXJlXzIgICAgICAgICAgICAgIDkgICA4MzcuMDYgIDkxNS4wNlxuLSBCQUNfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgOTc3LjI3IDEwNzEuMjdcbi0gQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDk4MC45MyAxMDc0LjkzXG4tIEJBQ19GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgIDExMTMuNTggMTIwNy41OFxuLSBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAxMzY2LjQwIDE0NjAuNDBcbi0gQkFDX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgMTcwMi41MCAxNzk2LjUwXG5cblN0ZXA6ICBBSUM9ODYyLjY3XG5hZG1pc3NpYmxlIH4gZ2VucmUgKyByZWRvdWJsZW1lbnRUZXJtaW5hbGUgKyByYW5nRW5UZXJtaW5hbGUgKyBcbiAgICBjb2RlRmlsaWVyZV8xICsgY29kZUZpbGllcmVfMiArIGNvZGVGaWxpZXJlXzYgKyBgMUVSRV9BTkdMQUlTYCArIFxuICAgIGAxRVJFX01BVEhFTUFUSVFVRVNgICsgYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAyTkRFX01BVEhFTUFUSVFVRVNgICsgXG4gICAgYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIEJBQ19BTkdMQUlTICsgQkFDX0ZSQU5DQUlTICsgXG4gICAgQkFDX01BVEhFTUFUSVFVRVMgKyBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBCQUNfU1ZUICsgXG4gICAgVExFX0FOR0xBSVMgKyBUTEVfRlJBTkNBSVMgKyBUTEVfTUFUSEVNQVRJUVVFUyArIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFxuICAgIFRMRV9TVlRcblxuICAgICAgICAgICAgICAgICAgICAgICAgICAgIERmIERldmlhbmNlICAgICBBSUNcbi0gVExFX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDc2OC45MiAgODYwLjkyXG4tIGdlbnJlICAgICAgICAgICAgICAgICAgICAgIDEgICA3NjkuMjkgIDg2MS4yOVxuPG5vbmU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzY4LjY3ICA4NjIuNjdcbi0gYDJOREVfTUFUSEVNQVRJUVVFU2AgICAgICAgMSAgIDc3MS4wOCAgODYzLjA4XG4tIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3NzIuMDUgIDg2NC4wNVxuLSBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAgNzczLjk2ICA4NjUuOTZcbi0gVExFX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDc3NC44MCAgODY2LjgwXG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3OTAuODYgIDg2Ni44NlxuLSBUTEVfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAgNzc5LjIyICA4NzEuMjJcbi0gYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3OS4yMyAgODcxLjIzXG4tIGAxRVJFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3ODAuNTcgIDg3Mi41N1xuLSBgMUVSRV9BTkdMQUlTYCAgICAgICAgICAgICAxICAgNzg2Ljc2ICA4NzguNzZcbi0gcmFuZ0VuVGVybWluYWxlICAgICAgICAgICAgMyAgIDc5NC4xOCAgODgyLjE4XG4tIGNvZGVGaWxpZXJlXzEgICAgICAgICAgICAgIDggICA4MTIuNzkgIDg5MC43OVxuLSByZWRvdWJsZW1lbnRUZXJtaW5hbGUgICAgICAxICAgODAyLjk2ICA4OTQuOTZcbi0gVExFX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgIDgxMC4wOSAgOTAyLjA5XG4tIGNvZGVGaWxpZXJlXzIgICAgICAgICAgICAgIDkgICA4MzcuMjUgIDkxMy4yNVxuLSBCQUNfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgOTc3LjI5IDEwNjkuMjlcbi0gQkFDX1NWVCAgICAgICAgICAgICAgICAgICAgMSAgIDk4MS4wMyAxMDczLjAzXG4tIEJBQ19GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgIDExMTMuNjAgMTIwNS42MFxuLSBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAxMzY2LjQwIDE0NTguNDBcbi0gQkFDX01BVEhFTUFUSVFVRVMgICAgICAgICAgMSAgMTcwMi41MCAxNzk0LjUwXG5cblN0ZXA6ICBBSUM9ODYwLjkyXG5hZG1pc3NpYmxlIH4gZ2VucmUgKyByZWRvdWJsZW1lbnRUZXJtaW5hbGUgKyByYW5nRW5UZXJtaW5hbGUgKyBcbiAgICBjb2RlRmlsaWVyZV8xICsgY29kZUZpbGllcmVfMiArIGNvZGVGaWxpZXJlXzYgKyBgMUVSRV9BTkdMQUlTYCArIFxuICAgIGAxRVJFX01BVEhFTUFUSVFVRVNgICsgYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIGAyTkRFX01BVEhFTUFUSVFVRVNgICsgXG4gICAgYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCArIEJBQ19BTkdMQUlTICsgQkFDX0ZSQU5DQUlTICsgXG4gICAgQkFDX01BVEhFTUFUSVFVRVMgKyBgQkFDX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBCQUNfU1ZUICsgXG4gICAgVExFX0FOR0xBSVMgKyBUTEVfRlJBTkNBSVMgKyBUTEVfTUFUSEVNQVRJUVVFUyArIGBUTEVfU0NJRU5DRVMgUEhZU0lRVUVTYFxuXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRGYgRGV2aWFuY2UgICAgIEFJQ1xuLSBnZW5yZSAgICAgICAgICAgICAgICAgICAgICAxICAgNzY5LjY1ICA4NTkuNjVcbjxub25lPiAgICAgICAgICAgICAgICAgICAgICAgICAgIDc2OC45MiAgODYwLjkyXG4tIGAyTkRFX01BVEhFTUFUSVFVRVNgICAgICAgIDEgICA3NzEuMjkgIDg2MS4yOVxuLSBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAxICAgNzcyLjMzICA4NjIuMzNcbi0gYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgIDc3NC43NCAgODY0Ljc0XG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3OTEuMDkgIDg2NS4wOVxuLSBUTEVfQU5HTEFJUyAgICAgICAgICAgICAgICAxICAgNzc1LjE3ICA4NjUuMTdcbi0gYDFFUkVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3OS40NCAgODY5LjQ0XG4tIFRMRV9GUkFOQ0FJUyAgICAgICAgICAgICAgIDEgICA3ODAuMTcgIDg3MC4xN1xuLSBgMUVSRV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzgwLjkxICA4NzAuOTFcbi0gYDFFUkVfQU5HTEFJU2AgICAgICAgICAgICAgMSAgIDc4Ny4zMiAgODc3LjMyXG4tIHJhbmdFblRlcm1pbmFsZSAgICAgICAgICAgIDMgICA3OTguMzAgIDg4NC4zMFxuLSBjb2RlRmlsaWVyZV8xICAgICAgICAgICAgICA4ICAgODE0LjU0ICA4OTAuNTRcbi0gcmVkb3VibGVtZW50VGVybWluYWxlICAgICAgMSAgIDgwNC4xNyAgODk0LjE3XG4tIFRMRV9NQVRIRU1BVElRVUVTICAgICAgICAgIDEgICA4MTAuMzYgIDkwMC4zNlxuLSBjb2RlRmlsaWVyZV8yICAgICAgICAgICAgICA5ICAgODM4LjI1ICA5MTIuMjVcbi0gQkFDX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDk3Ny45OSAxMDY3Ljk5XG4tIEJBQ19TVlQgICAgICAgICAgICAgICAgICAgIDEgICA5OTYuNzUgMTA4Ni43NVxuLSBCQUNfRlJBTkNBSVMgICAgICAgICAgICAgICAxICAxMTE0LjM5IDEyMDQuMzlcbi0gYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICAgMSAgMTM2Ny44MCAxNDU3LjgwXG4tIEJBQ19NQVRIRU1BVElRVUVTICAgICAgICAgIDEgIDE3MDQuMjAgMTc5NC4yMFxuXG5TdGVwOiAgQUlDPTg1OS42NVxuYWRtaXNzaWJsZSB+IHJlZG91YmxlbWVudFRlcm1pbmFsZSArIHJhbmdFblRlcm1pbmFsZSArIGNvZGVGaWxpZXJlXzEgKyBcbiAgICBjb2RlRmlsaWVyZV8yICsgY29kZUZpbGllcmVfNiArIGAxRVJFX0FOR0xBSVNgICsgYDFFUkVfTUFUSEVNQVRJUVVFU2AgKyBcbiAgICBgMUVSRV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgYDJOREVfTUFUSEVNQVRJUVVFU2AgKyBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgICsgXG4gICAgQkFDX0FOR0xBSVMgKyBCQUNfRlJBTkNBSVMgKyBCQUNfTUFUSEVNQVRJUVVFUyArIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCArIFxuICAgIEJBQ19TVlQgKyBUTEVfQU5HTEFJUyArIFRMRV9GUkFOQ0FJUyArIFRMRV9NQVRIRU1BVElRVUVTICsgXG4gICAgYFRMRV9TQ0lFTkNFUyBQSFlTSVFVRVNgXG5cbiAgICAgICAgICAgICAgICAgICAgICAgICAgICBEZiBEZXZpYW5jZSAgICAgQUlDXG48bm9uZT4gICAgICAgICAgICAgICAgICAgICAgICAgICA3NjkuNjUgIDg1OS42NVxuLSBgMk5ERV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzcyLjE1ICA4NjAuMTVcbi0gYDJOREVfU0NJRU5DRVMgUEhZU0lRVUVTYCAgMSAgIDc3Mi45OCAgODYwLjk4XG4tIGNvZGVGaWxpZXJlXzYgICAgICAgICAgICAgIDkgICA3OTEuNTQgIDg2My41NFxuLSBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgICAxICAgNzc1LjYyICA4NjMuNjJcbi0gVExFX0FOR0xBSVMgICAgICAgICAgICAgICAgMSAgIDc3Ni40NSAgODY0LjQ1XG4tIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgIDEgICA3ODAuMTggIDg2OC4xOFxuLSBgMUVSRV9NQVRIRU1BVElRVUVTYCAgICAgICAxICAgNzgxLjQxICA4NjkuNDFcbi0gVExFX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgIDc4MS40MSAgODY5LjQxXG4tIGAxRVJFX0FOR0xBSVNgICAgICAgICAgICAgIDEgICA3ODguMDAgIDg3Ni4wMFxuLSByYW5nRW5UZXJtaW5hbGUgICAgICAgICAgICAzICAgNzk4LjY1ICA4ODIuNjVcbi0gY29kZUZpbGllcmVfMSAgICAgICAgICAgICAgOCAgIDgxNS4wOCAgODg5LjA4XG4tIHJlZG91YmxlbWVudFRlcm1pbmFsZSAgICAgIDEgICA4MDUuOTMgIDg5My45M1xuLSBUTEVfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAgODEwLjc4ICA4OTguNzhcbi0gY29kZUZpbGllcmVfMiAgICAgICAgICAgICAgOSAgIDgzOS4yMyAgOTExLjIzXG4tIEJBQ19BTkdMQUlTICAgICAgICAgICAgICAgIDEgICA5NzguNDggMTA2Ni40OFxuLSBCQUNfU1ZUICAgICAgICAgICAgICAgICAgICAxICAgOTk5Ljc2IDEwODcuNzZcbi0gQkFDX0ZSQU5DQUlTICAgICAgICAgICAgICAgMSAgMTExNS44MyAxMjAzLjgzXG4tIGBCQUNfU0NJRU5DRVMgUEhZU0lRVUVTYCAgIDEgIDEzNjguMjAgMTQ1Ni4yMFxuLSBCQUNfTUFUSEVNQVRJUVVFUyAgICAgICAgICAxICAxNzA0LjM1IDE3OTIuMzVcbiJ9 -->

```
                            Df Deviance     AIC
- mentionAuBac               3   767.74  871.74
- `1ERE_FRANCAIS`            1   766.36  874.36
- `2NDE_FRANCAIS`            1   766.40  874.40
- `1ERE_SVT`                 1   766.53  874.53
- `2NDE_ANGLAIS`             1   766.73  874.73
- TLE_SVT                    1   766.74  874.74
- `2NDE_SVT`                 1   766.76  874.76
- genre                      1   767.08  875.08
<none>                           766.36  876.36
- `2NDE_MATHEMATIQUES`       1   768.68  876.68
- `2NDE_SCIENCES PHYSIQUES`  1   770.41  878.41
- `TLE_SCIENCES PHYSIQUES`   1   771.24  879.24
- codeFiliere_6              9   788.34  880.34
- TLE_ANGLAIS                1   772.36  880.36
- TLE_FRANCAIS               1   775.84  883.84
- `1ERE_SCIENCES PHYSIQUES`  1   776.86  884.86
- `1ERE_MATHEMATIQUES`       1   778.50  886.50
- `1ERE_ANGLAIS`             1   780.26  888.26
- rangEnTerminale            3   790.87  894.87
- codeFiliere_1              8   810.58  904.58
- redoublementTerminale      1   799.36  907.36
- TLE_MATHEMATIQUES          1   807.57  915.57
- codeFiliere_2              9   836.00  928.00
- BAC_SVT                    1   919.89 1027.89
- BAC_ANGLAIS                1   961.24 1069.24
- BAC_FRANCAIS               1  1076.31 1184.31
- `BAC_SCIENCES PHYSIQUES`   1  1218.36 1326.36
- BAC_MATHEMATIQUES          1  1496.64 1604.64

Step:  AIC=871.74
admissible ~ genre + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_FRANCAIS` + `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + 
    `1ERE_SVT` + `2NDE_ANGLAIS` + `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + 
    TLE_SVT

                            Df Deviance     AIC
- `1ERE_FRANCAIS`            1   767.75  869.75
- `2NDE_FRANCAIS`            1   767.78  869.78
- `1ERE_SVT`                 1   767.93  869.93
- TLE_SVT                    1   768.08  870.08
- `2NDE_ANGLAIS`             1   768.14  870.14
- `2NDE_SVT`                 1   768.14  870.14
- genre                      1   768.37  870.37
<none>                           767.74  871.74
- `2NDE_MATHEMATIQUES`       1   770.12  872.12
- `2NDE_SCIENCES PHYSIQUES`  1   771.45  873.45
- `TLE_SCIENCES PHYSIQUES`   1   772.75  874.75
- TLE_ANGLAIS                1   773.35  875.35
- codeFiliere_6              9   790.24  876.24
- TLE_FRANCAIS               1   777.59  879.59
- `1ERE_SCIENCES PHYSIQUES`  1   778.07  880.07
- `1ERE_MATHEMATIQUES`       1   779.78  881.78
- `1ERE_ANGLAIS`             1   781.73  883.73
- rangEnTerminale            3   792.78  890.78
- codeFiliere_1              8   811.53  899.53
- redoublementTerminale      1   800.33  902.33
- TLE_MATHEMATIQUES          1   808.81  910.81
- codeFiliere_2              9   836.64  922.64
- BAC_ANGLAIS                1   974.03 1076.03
- BAC_SVT                    1   978.67 1080.67
- BAC_FRANCAIS               1  1107.63 1209.63
- `BAC_SCIENCES PHYSIQUES`   1  1365.50 1467.50
- BAC_MATHEMATIQUES          1  1700.22 1802.22

Step:  AIC=869.75
admissible ~ genre + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + 
    `2NDE_ANGLAIS` + `2NDE_FRANCAIS` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + 
    TLE_SVT

                            Df Deviance     AIC
- `2NDE_FRANCAIS`            1   767.80  867.80
- `1ERE_SVT`                 1   767.93  867.93
- TLE_SVT                    1   768.09  868.09
- `2NDE_ANGLAIS`             1   768.15  868.15
- `2NDE_SVT`                 1   768.16  868.16
- genre                      1   768.38  868.38
<none>                           767.75  869.75
- `2NDE_MATHEMATIQUES`       1   770.13  870.13
- `2NDE_SCIENCES PHYSIQUES`  1   771.45  871.45
- `TLE_SCIENCES PHYSIQUES`   1   772.77  872.77
- TLE_ANGLAIS                1   773.35  873.35
- codeFiliere_6              9   790.24  874.24
- TLE_FRANCAIS               1   777.77  877.77
- `1ERE_SCIENCES PHYSIQUES`  1   778.08  878.08
- `1ERE_MATHEMATIQUES`       1   779.80  879.80
- `1ERE_ANGLAIS`             1   781.73  881.73
- rangEnTerminale            3   792.80  888.80
- codeFiliere_1              8   811.55  897.55
- redoublementTerminale      1   800.35  900.35
- TLE_MATHEMATIQUES          1   808.81  908.81
- codeFiliere_2              9   836.67  920.67
- BAC_ANGLAIS                1   974.04 1074.04
- BAC_SVT                    1   978.83 1078.83
- BAC_FRANCAIS               1  1107.79 1207.79
- `BAC_SCIENCES PHYSIQUES`   1  1365.50 1465.50
- BAC_MATHEMATIQUES          1  1701.27 1801.27

Step:  AIC=867.8
admissible ~ genre + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `1ERE_SVT` + 
    `2NDE_ANGLAIS` + `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + 
    `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + 
    `BAC_SCIENCES PHYSIQUES` + BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + 
    TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + TLE_SVT

                            Df Deviance     AIC
- `1ERE_SVT`                 1   767.97  865.97
- TLE_SVT                    1   768.15  866.15
- `2NDE_ANGLAIS`             1   768.17  866.17
- `2NDE_SVT`                 1   768.25  866.25
- genre                      1   768.44  866.44
<none>                           767.80  867.80
- `2NDE_MATHEMATIQUES`       1   770.19  868.19
- `2NDE_SCIENCES PHYSIQUES`  1   771.46  869.46
- `TLE_SCIENCES PHYSIQUES`   1   772.96  870.96
- TLE_ANGLAIS                1   773.45  871.45
- codeFiliere_6              9   790.32  872.32
- TLE_FRANCAIS               1   777.93  875.93
- `1ERE_SCIENCES PHYSIQUES`  1   778.12  876.12
- `1ERE_MATHEMATIQUES`       1   779.80  877.80
- `1ERE_ANGLAIS`             1   781.75  879.75
- rangEnTerminale            3   792.81  886.81
- codeFiliere_1              8   811.56  895.56
- redoublementTerminale      1   800.36  898.36
- TLE_MATHEMATIQUES          1   808.92  906.92
- codeFiliere_2              9   836.67  918.67
- BAC_ANGLAIS                1   974.60 1072.60
- BAC_SVT                    1   978.98 1076.98
- BAC_FRANCAIS               1  1108.76 1206.76
- `BAC_SCIENCES PHYSIQUES`   1  1365.52 1463.52
- BAC_MATHEMATIQUES          1  1701.93 1799.93

Step:  AIC=865.97
admissible ~ genre + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `2NDE_ANGLAIS` + 
    `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + `2NDE_SVT` + 
    BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + 
    BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + 
    `TLE_SCIENCES PHYSIQUES` + TLE_SVT

                            Df Deviance     AIC
- `2NDE_ANGLAIS`             1   768.34  864.34
- `2NDE_SVT`                 1   768.35  864.35
- TLE_SVT                    1   768.37  864.37
- genre                      1   768.62  864.62
<none>                           767.97  865.97
- `2NDE_MATHEMATIQUES`       1   770.36  866.36
- `2NDE_SCIENCES PHYSIQUES`  1   771.63  867.63
- `TLE_SCIENCES PHYSIQUES`   1   773.15  869.15
- TLE_ANGLAIS                1   773.64  869.64
- codeFiliere_6              9   790.51  870.51
- TLE_FRANCAIS               1   778.46  874.46
- `1ERE_SCIENCES PHYSIQUES`  1   778.67  874.67
- `1ERE_MATHEMATIQUES`       1   780.33  876.33
- `1ERE_ANGLAIS`             1   782.77  878.77
- rangEnTerminale            3   793.38  885.38
- codeFiliere_1              8   812.56  894.56
- redoublementTerminale      1   801.82  897.82
- TLE_MATHEMATIQUES          1   808.93  904.93
- codeFiliere_2              9   836.95  916.95
- BAC_ANGLAIS                1   976.11 1072.11
- BAC_SVT                    1   979.18 1075.18
- BAC_FRANCAIS               1  1112.97 1208.97
- `BAC_SCIENCES PHYSIQUES`   1  1365.54 1461.54
- BAC_MATHEMATIQUES          1  1702.48 1798.48

Step:  AIC=864.34
admissible ~ genre + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + `2NDE_SVT` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + 
    TLE_SVT

                            Df Deviance     AIC
- `2NDE_SVT`                 1   768.67  862.67
- TLE_SVT                    1   768.72  862.72
- genre                      1   769.00  863.00
<none>                           768.34  864.34
- `2NDE_MATHEMATIQUES`       1   770.96  864.96
- `2NDE_SCIENCES PHYSIQUES`  1   772.02  866.02
- `TLE_SCIENCES PHYSIQUES`   1   773.66  867.66
- TLE_ANGLAIS                1   774.62  868.62
- codeFiliere_6              9   790.62  868.62
- TLE_FRANCAIS               1   778.97  872.97
- `1ERE_SCIENCES PHYSIQUES`  1   779.00  873.00
- `1ERE_MATHEMATIQUES`       1   780.36  874.36
- `1ERE_ANGLAIS`             1   786.69  880.69
- rangEnTerminale            3   793.79  883.79
- codeFiliere_1              8   812.66  892.66
- redoublementTerminale      1   802.96  896.96
- TLE_MATHEMATIQUES          1   809.07  903.07
- codeFiliere_2              9   837.06  915.06
- BAC_ANGLAIS                1   977.27 1071.27
- BAC_SVT                    1   980.93 1074.93
- BAC_FRANCAIS               1  1113.58 1207.58
- `BAC_SCIENCES PHYSIQUES`   1  1366.40 1460.40
- BAC_MATHEMATIQUES          1  1702.50 1796.50

Step:  AIC=862.67
admissible ~ genre + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES` + 
    TLE_SVT

                            Df Deviance     AIC
- TLE_SVT                    1   768.92  860.92
- genre                      1   769.29  861.29
<none>                           768.67  862.67
- `2NDE_MATHEMATIQUES`       1   771.08  863.08
- `2NDE_SCIENCES PHYSIQUES`  1   772.05  864.05
- `TLE_SCIENCES PHYSIQUES`   1   773.96  865.96
- TLE_ANGLAIS                1   774.80  866.80
- codeFiliere_6              9   790.86  866.86
- TLE_FRANCAIS               1   779.22  871.22
- `1ERE_SCIENCES PHYSIQUES`  1   779.23  871.23
- `1ERE_MATHEMATIQUES`       1   780.57  872.57
- `1ERE_ANGLAIS`             1   786.76  878.76
- rangEnTerminale            3   794.18  882.18
- codeFiliere_1              8   812.79  890.79
- redoublementTerminale      1   802.96  894.96
- TLE_MATHEMATIQUES          1   810.09  902.09
- codeFiliere_2              9   837.25  913.25
- BAC_ANGLAIS                1   977.29 1069.29
- BAC_SVT                    1   981.03 1073.03
- BAC_FRANCAIS               1  1113.60 1205.60
- `BAC_SCIENCES PHYSIQUES`   1  1366.40 1458.40
- BAC_MATHEMATIQUES          1  1702.50 1794.50

Step:  AIC=860.92
admissible ~ genre + redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES`

                            Df Deviance     AIC
- genre                      1   769.65  859.65
<none>                           768.92  860.92
- `2NDE_MATHEMATIQUES`       1   771.29  861.29
- `2NDE_SCIENCES PHYSIQUES`  1   772.33  862.33
- `TLE_SCIENCES PHYSIQUES`   1   774.74  864.74
- codeFiliere_6              9   791.09  865.09
- TLE_ANGLAIS                1   775.17  865.17
- `1ERE_SCIENCES PHYSIQUES`  1   779.44  869.44
- TLE_FRANCAIS               1   780.17  870.17
- `1ERE_MATHEMATIQUES`       1   780.91  870.91
- `1ERE_ANGLAIS`             1   787.32  877.32
- rangEnTerminale            3   798.30  884.30
- codeFiliere_1              8   814.54  890.54
- redoublementTerminale      1   804.17  894.17
- TLE_MATHEMATIQUES          1   810.36  900.36
- codeFiliere_2              9   838.25  912.25
- BAC_ANGLAIS                1   977.99 1067.99
- BAC_SVT                    1   996.75 1086.75
- BAC_FRANCAIS               1  1114.39 1204.39
- `BAC_SCIENCES PHYSIQUES`   1  1367.80 1457.80
- BAC_MATHEMATIQUES          1  1704.20 1794.20

Step:  AIC=859.65
admissible ~ redoublementTerminale + rangEnTerminale + codeFiliere_1 + 
    codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + `1ERE_MATHEMATIQUES` + 
    `1ERE_SCIENCES PHYSIQUES` + `2NDE_MATHEMATIQUES` + `2NDE_SCIENCES PHYSIQUES` + 
    BAC_ANGLAIS + BAC_FRANCAIS + BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + 
    BAC_SVT + TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + 
    `TLE_SCIENCES PHYSIQUES`

                            Df Deviance     AIC
<none>                           769.65  859.65
- `2NDE_MATHEMATIQUES`       1   772.15  860.15
- `2NDE_SCIENCES PHYSIQUES`  1   772.98  860.98
- codeFiliere_6              9   791.54  863.54
- `TLE_SCIENCES PHYSIQUES`   1   775.62  863.62
- TLE_ANGLAIS                1   776.45  864.45
- `1ERE_SCIENCES PHYSIQUES`  1   780.18  868.18
- `1ERE_MATHEMATIQUES`       1   781.41  869.41
- TLE_FRANCAIS               1   781.41  869.41
- `1ERE_ANGLAIS`             1   788.00  876.00
- rangEnTerminale            3   798.65  882.65
- codeFiliere_1              8   815.08  889.08
- redoublementTerminale      1   805.93  893.93
- TLE_MATHEMATIQUES          1   810.78  898.78
- codeFiliere_2              9   839.23  911.23
- BAC_ANGLAIS                1   978.48 1066.48
- BAC_SVT                    1   999.76 1087.76
- BAC_FRANCAIS               1  1115.83 1203.83
- `BAC_SCIENCES PHYSIQUES`   1  1368.20 1456.20
- BAC_MATHEMATIQUES          1  1704.35 1792.35
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJldl9zdGVwIDwtIHByZWRpY3QocmVnX2xvZ19zdGVwICxuZXdkYXRhPXRlc3QgLCB0eXBlPVwicmVzcG9uc2VcIilcbmhlYWQocHJldl9zdGVwKVxuYGBgIn0= -->

```r
prev_step <- predict(reg_log_step ,newdata=test , type="response")
head(prev_step)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgICAgICAxICAgICAgICAgICAgMiAgICAgICAgICAgIDMgICAgICAgICAgICA0ICAgICAgICAgICAgNSAgICAgICAgICAgIDYgXG4xLjQ4MzQzOWUtMDUgOS45OTY1MDBlLTAxIDUuOTA3ODQzZS0wMSA2LjYzNjc4MGUtMDEgMS4yNDQ4ODJlLTAzIDkuMzM4MjM1ZS0wOCBcbiJ9 -->

```
           1            2            3            4            5            6 
1.483439e-05 9.996500e-01 5.907843e-01 6.636780e-01 1.244882e-03 9.338235e-08 
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJldl9wcm9iIDwtIGRhdGEuZnJhbWUoc3RlcCA9IHByZWRpY3QocmVnX2xvZ19zdGVwICxuZXdkYXRhPXRlc3QgLCB0eXBlPVwicmVzcG9uc2VcIiksIGNvbXBsZXQgPSBwcmVkaWN0KHJlZ19sb2cgLG5ld2RhdGE9dGVzdCAsIHR5cGU9XCJyZXNwb25zZVwiKSlcbmhlYWQocm91bmQocHJldl9wcm9iLCAyKSlcbmBgYCJ9 -->

```r
prev_prob <- data.frame(step = predict(reg_log_step ,newdata=test , type="response"), complet = predict(reg_log ,newdata=test , type="response"))
head(round(prev_prob, 2))
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImRhdGEuZnJhbWUiXSwibnJvdyI6NiwibmNvbCI6Miwic3VtbWFyeSI6eyJEZXNjcmlwdGlvbiI6WyJkZiBbNiB4IDJdIl19fSwicmRmIjoiSDRzSUFBQUFBQUFBQm0yUXNVN0RNQkNHTDI3U3FwRW9sY29NVDlCSUxlcWNBU1JXWU9xRzNNUXRFYWtkMmE1QTdMd09NdzhCcjRCVUJCTVM0Z2tLNThTVzByUzMrUHlmUDk5L2QzMCtQUTJuSVFDMHdBY0NyUUJUYUo5ZGpzYVRNWUJQOE9aaHBXdk9CM3cxd01TSVBmTU1iTVMvOXZ4WVh6d2ZQYTdqcitPWHErK25FOWlOL2R3N1FrakduNjhtM25heExTTUJwMHVtTU9tWFppclJWNW9WTnU4a1lsbmtURGU0cmhUM2tXTi83Q0N1ZUppeU9aT1NwVGRLeTR3dkdtVi9SaFd6MmtHcFYrMDNOYTF0ZFZLdUV4bmoxZXFPZ1lyWm5pZkpxWEx6T0RGTXFhYlJYS0xkUFVoSEZEb1RIQ0V5c0YzcXNDY2JRbi9GemVEcE1MbGQ4YnZoYUdJNldFdGV6VjdkS3FsNmtqLzdWMkQvYWpPK3lEaHo1bk02WTdtOTlIREQ1WUtqQW5lbzNTaW9xa2dMVGQyN01CRzVVNm9kYnY0QklBMkx5NG9DQUFBPSJ9 -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["step"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["complet"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"0.00","2":"0.00","_rn_":"1"},{"1":"1.00","2":"1.00","_rn_":"2"},{"1":"0.59","2":"0.47","_rn_":"3"},{"1":"0.66","2":"0.65","_rn_":"4"},{"1":"0.00","2":"0.00","_rn_":"5"},{"1":"0.00","2":"0.00","_rn_":"6"}],"options":{"columns":{"min":{},"max":[10],"total":[2]},"rows":{"min":[10],"max":[10],"total":[6]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJldl9jbGFzcyA8LSBhcHBseShwcmV2X3Byb2I+PTAuNSwgMiwgZmFjdG9yLGxhYmVscz1jKDAgLCAxKSlcbmhlYWQocHJldl9jbGFzcyAsIG49NSlcbmBgYCJ9 -->

```r
prev_class <- apply(prev_prob>=0.5, 2, factor,labels=c(0 , 1))
head(prev_class , n=5)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICBzdGVwIGNvbXBsZXRcbjEgXCIwXCIgIFwiMFwiICAgIFxuMiBcIjFcIiAgXCIxXCIgICAgXG4zIFwiMVwiICBcIjBcIiAgICBcbjQgXCIxXCIgIFwiMVwiICAgIFxuNSBcIjBcIiAgXCIwXCIgICAgXG4ifQ== -->

```
  step complet
1 "0"  "0"    
2 "1"  "1"    
3 "1"  "0"    
4 "1"  "1"    
5 "0"  "0"    
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubWF0cmljZV9jb25mdXNpb24gPSB0YWJsZShwcmV2X3N0ZXAgPj0gMC41LCB0ZXN0JGFkbWlzc2libGUpXG5tYXRyaWNlX2NvbmZ1c2lvblxuYGBgIn0= -->

```r
matrice_confusion = table(prev_step >= 0.5, test$admissible)
matrice_confusion
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiICAgICAgIFxuICAgICAgICAgICAwICAgIDFcbiAgRkFMU0UgMTU1NCAgIDIwXG4gIFRSVUUgICAgMzkgIDEyNlxuIn0= -->

```
       
           0    1
  FALSE 1554   20
  TRUE    39  126
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucm91bmQoKHN1bShkaWFnKG1hdHJpY2VfY29uZnVzaW9uKSkvc3VtKG1hdHJpY2VfY29uZnVzaW9uKSkqMTAwLDIpXG5gYGAifQ== -->

```r
round((sum(diag(matrice_confusion))/sum(matrice_confusion))*100,2)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiWzFdIDk2LjYxXG4ifQ== -->

```
[1] 96.61
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJldl9jbGFzcyA8LSBkYXRhLmZyYW1lKHByZXZfY2xhc3MpXG5wcmV2X2NsYXNzJT4lbXV0YXRlKG9icz10ZXN0JGFkbWlzc2libGUpJT4lc3VtbWFyaXNlX2FsbChmdW5zKGVycj1tZWFuKG9icyE9LikpKSU+JXNlbGVjdCgtb2JzX2VyciklPiVyb3VuZCgzKSoxMDBcbmBgYCJ9 -->

```r
prev_class <- data.frame(prev_class)
prev_class%>%mutate(obs=test$admissible)%>%summarise_all(funs(err=mean(obs!=.)))%>%select(-obs_err)%>%round(3)*100
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogYGZ1bnMoKWAgd2FzIGRlcHJlY2F0ZWQgaW4gZHBseXIgMC44LjAuXG5QbGVhc2UgdXNlIGEgbGlzdCBvZiBlaXRoZXIgZnVuY3Rpb25zIG9yIGxhbWJkYXM6IFxuXG4gICMgU2ltcGxlIG5hbWVkIGxpc3Q6IFxuICBsaXN0KG1lYW4gPSBtZWFuLCBtZWRpYW4gPSBtZWRpYW4pXG5cbiAgIyBBdXRvIG5hbWVkIHdpdGggYHRpYmJsZTo6bHN0KClgOiBcbiAgdGliYmxlOjpsc3QobWVhbiwgbWVkaWFuKVxuXG4gICMgVXNpbmcgbGFtYmRhc1xuICBsaXN0KH4gbWVhbiguLCB0cmltID0gLjIpLCB+IG1lZGlhbiguLCBuYS5ybSA9IFRSVUUpKVxuVGhpcyB3YXJuaW5nIGlzIGRpc3BsYXllZCBvbmNlIGV2ZXJ5IDggaG91cnMuXG5DYWxsIGBsaWZlY3ljbGU6Omxhc3Rfd2FybmluZ3MoKWAgdG8gc2VlIHdoZXJlIHRoaXMgd2FybmluZyB3YXMgZ2VuZXJhdGVkLlxuIn0= -->

```
Warning: `funs()` was deprecated in dplyr 0.8.0.
Please use a list of either functions or lambdas: 

  # Simple named list: 
  list(mean = mean, median = median)

  # Auto named with `tibble::lst()`: 
  tibble::lst(mean, median)

  # Using lambdas
  list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
This warning is displayed once every 8 hours.
Call `lifecycle::last_warnings()` to see where this warning was generated.
```



<!-- rnb-output-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImRhdGEuZnJhbWUiXSwibnJvdyI6MSwibmNvbCI6Miwic3VtbWFyeSI6eyJEZXNjcmlwdGlvbiI6WyJkZiBbMSB4IDJdIl19fSwicmRmIjoiSDRzSUFBQUFBQUFBQmwxUDJ3ckNNQXlOMVhuWmNBejhEZ2ZlSG53VDlBUEVwNzFKblZXSHRSMWRoMzY5bXRaVzJBS2xPU2M1U2M1aGx5M0NMQVNBTHZTQVFEZkFGUHJiL1d5K21nUDBDS0lPVmtibWYySFhCQk5EeG9iWVJBc1R5ejlPd0VWREdBajZZQlVtaVJYL3lHR2xXWGxrU2prYzVmSlJjcVl0MWRTUGxIeW1mc2JZRnV4ckxzazVyZndTVDRabnFtbDZVYWhGOUc1SkJyTFVoUlFvSXNaVzBCSjNWSXRJYW1HdU9FL3pXeTN1MDluYWJIRG5RUE8wZjA1K084bkh6UXJjckQ0VDEwSXdmenluSjhZZGlOR3VkWnVXcWhEYVcwRzJTclhVMVBlRnVlU2VzZWJnL1FVaVVySXJ6d0VBQUE9PSJ9 -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["step_err"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["complet_err"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"3.4","2":"4"}],"options":{"columns":{"min":{},"max":[10],"total":[2]},"rows":{"min":[10],"max":[10],"total":[1]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGZfcm9jIDwtIHByZXZfcHJvYiU+JW11dGF0ZShvYnM9dGVzdCRhZG1pc3NpYmxlKSU+JWdhdGhlcihrZXk9bWV0aG9kZSAsIHZhbHVlPXNjb3JlICwgY29tcGxldCAsc3RlcClcbmdncGxvdChkZl9yb2MsIGFlcyhkPW9icywgbT1zY29yZSwgY29sb3I9bWV0aG9kZSkpICsgZ2VvbV9yb2MoKSArIHRoZW1lX2NsYXNzaWMoKVxuYGBgIn0= -->

```r
df_roc <- prev_prob%>%mutate(obs=test$admissible)%>%gather(key=methode , value=score , complet ,step)
ggplot(df_roc, aes(d=obs, m=score, color=methode)) + geom_roc() + theme_classic()
```

<!-- rnb-source-end -->

<!-- rnb-plot-begin eyJoZWlnaHQiOjQzMi42MzI5LCJ3aWR0aCI6NzAwLCJzaXplX2JlaGF2aW9yIjowLCJjb25kaXRpb25zIjpbXX0= -->

<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAD3CAMAAAAE5/KoAAACAVBMVEUAAAAAADoAAGYAOpAAZrYAqIsAt5oAt78At80AupoAv6gAv7EAv7kAv7oAv8QAv8gAv9gAwrIAwuIAxsIAyuIA1ewzMzM4vuI4v7Y4v7o4v744v8Q5v7Y5v885yfU6AAA6ADo6AGY6OpA6kNs6v886v9g64PVNTU1NTW5NTY5NbqtNjshjj21jn7ljv8Rkvuhkv8Rkzf9lv8Rl2/9l6v9mAABmADpmAGZmZjpmtv9m6v9uTU1uTW5uTY5ubqtuq+SMgm2Ms8SMusSN0P+OTU2OTW6OTY6Ot8SOxsSOyP+OysSO4v+O9P+QOgCQOjqQkDqQkGaQtpCQysSQ27aQ29uQ2/+Q9P+rbk2rbm6rbo6ryKur5P+xqMSxr8Szt8Sz1P+z6f+z//+2ZgC21cS22/+24r+2///Ijk3I///Vdm3VdqDVnLbVptHXnLbXyc/bkDrbvrrb4M/b/7bb/9vb/+jb///kq27k///4dm34dn34dof4gpr4j7n4l6f4ptH4qsv4rsj5dof5dqf5gqf5vej7dov71P/8j238j338j4v8n6j8pm386f/8///+vYf+////tmb/yI7/zbn/0LL/1KD/1Kz/25D/27b/29v/4r//5Kv/6bn/6bz/6sj/9Mv/9OL//7b//8j//83//9H//9v//+L//+T//+j//+z///X////lRZiTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAN2klEQVR4nO2djX8cRRnHL+0hqHCiYrW+XWrEFlRM1RQDahTxpdZAW40oFZSICb4eooGgVRSFqsU29eWwrdq0xFb3r3SemWdfZl9n9569myS/76e52+7Ms3s7v52XnZl9phMAr+hM+gcAGwjiGRDEMyCIZ0AQz4AgntFYECjZDhDEMyCIZ0AQz4AgngFBPKM0XS996in9ffXBg3c/F305GLrR69UNKA5ZLwopDCgJKfkBrVOWrhcO3qUFuf7I0eDZD4ZfDoYW6+vpPY/3ejev0VVnrtuE5ASc/Vavd0duiDFZz4YYk5yAYpOSHzA2StJ19dCjJodc/cJTlFn4q9qQObu+fvo8XTcpsq7pbSMEErcJLkXWpU8/F1z9/Cn+Ujv2KSoFOfdYr/e6H2kNtpUQIUIJXBcXQS7crZXgLxdDxWs/fsva85/NucqL+48FwbXZw9mCIQzJBFz+3Xu+Hrz20ux9hSaZ8ic0+ZC7SckPGCONckiloeKfsx/Lv93+cusTRpBM1RmFpAP+dvr2FS1IsUm6ho5MMlV3oUnJDxgjLoI0qkP++s6vkBLZu42v+u1Zk8KQMHU/0KpJadDYcBHk+iMLppW1UKOVpYW4NvuR4ps6Q2FInEPaNCkNGhuVgtBf3eeQqJy6NvveTGBUh7iHRHVIqyalQWOjjSd1I8cbv5N/cXqfvhedQ3TC6nu+TZPSoLEhLwiJoZ48/v3uzwXB3+/5eDbC4zev/eeLt+SZFoacfeyOn//hgbe1bFIaNC7EBWE9gv9+9MPnb/zpTdk7VD8OF1x0YQg9duclrqxJadCYkBaE5DCdJd99/fefz71DQRnCgsR6KEWK7lBQgqwgvaQgoAlygigduPoAIyAmiOnLHfHXgBEEOX0+2r7821dM5zryx8g0F+TMr8PNG2d+8QoyiBDNBXnzD/7Mm+d+tf9Y/gAcqE1zQU7e9LLZuvzil247Fkx0VGcH0VyQf73h23rjxpmfvHU/BJGiuSDUtU6ce+HO71EvKfQQwRJk2O8Qe/I6oDKG3JN7+cUv36e7rUtm1QB3koJsLXZrGPJYx7kf3rT+y3d85uVJDnvuJJKCbM7N1zDkrvUrd67ogR08hMhg55A6gvzxHj0a99NJz5vZYVh1yIZT7cGGv7l95caZ3+vti/shiBR2kdWpUamfjPvWr7yfOnnFf9uupHmzV+nxv5Nmls0VdPOKIdPbiwwihi3IgEqsmfqGEEQMK10HVHtszjkpAkHaIec5xK2tBUHaAYJ4Boosz0Cl7hlo9noGBPGMKF1VjV6v6yT5HwgiBnKIZ4g1eyV/1G4GgnhGnK6DTojTQC4EaYeSIdzolcJnDxJH9fdduW/hQhAxiit127UJeQ1YPVpkCEHEsNJ1a3EmnnpivZZODgOuf+NUkSHGb8Ww0nWZtAgVsRw3UFZRRRgVXEGOrxMIIkZxKyvp2kR/X/pkMpdAkHYoFiSZQy5EDgOieiRpiCknchR3vyfrkNWFMEqBIKjTpbBbWRuJ7veEaxNTUFE2uf7NvGYvBJGjpC/LPIdoXyem5FLPIYdO5RlCEDlEOhchiBzNX0dIbEMQOezJ1jNbi/OOc+BtQWR/1G4m3exdngk29q7VNIQgcqQFGXQbdL9DEDnSXSdKjQFyyATJdC4ud6aWahriQV0QiWYvGlmCNH+lLd6EICGvPhkMp3MKmBqvpjV/6TPehCAMiSEpSOBWnWcMIQgjLUjTiXK7UZDh9Il+pzNDfRvzVNhTqg31nunjnWgfDfWpVJ06rpLUxKk8MCr1Zgz7qjQZdOhjz4oeZFXFi84h/Xgf/dFoxuZcHKfqwPZUUtQhrgz78+HH9NKGGUeaN4Ik9qkP/T3gb4cUlhGk3sXsBHRVEX7wlLaZqA4hQSgzUJj+PrASxqk6cN5Eufp1SJNL2t7YgnBJVCqIY4NJptnrbrZTsATZ4M4NSxDaFxZZ9O3WAVJQqW/eW5lJIEj8sbWobn+V4nRHx/vCSr3LlbqJU3VgCNIMSxDdpKW0Xu50rX3pZq9DLoEgniEgCDp7JRERZPc9hrQHBPEMCOIZEMQzBDoXIYgkGdca847P+BCkHexZJ3ufmZt39N4LQdoh1ZdFD/9152VBEEkgiGekxtSfIU1q+suCIJIUv7DjbIieE0lEmr0ivwRoIIhn2JW6W2mVMoQgktiVuplRxMTLp7OTk4L11He5IA08hQ0PrGS2QtJF1nI0rJXwdWLehbadn0AQw3qDpWbrCKJYNs8h8Xvq7L7Bcn4CQdYzJAJp3HaJPmns9qHjqum6Qc3XzXsfpv0kgw4zESxycghHiT05sJOTeIft6wSCZASh9wg29q6Z9wOpL2rY75IMm3N719RzNwmiwgbdqhyynByGj32dsJOTpPMT5JCQ3CLLpDMNYmweWdp6aCmgP7VJHSFqk6Q5skTh5YLY87Isb0BUj9g7IAiTV4UM30c95pTaKvmTghyhqSnzOq906O53qkMYu8pQgqAOcaYwhxxZCnOIGQIsESTjtzf2dcJOThLOTwIIUgrVISqtuQ5JFlld2sN1CG/ZOPk6YScneA5xxm5lJXLIJxKtrCmaTVfWymroJhaCOKPrkHIgyDipJUhjv70QRBKB1xEgiCTofvcMgeUqIIgkyCGeAUE8wxLEFFtuXgcgSDuk/WUN9qwM0OydIKlmL/Xd48FwkmRmLs5AkImS8kpK7+0uo8iaIGm/vd1guf7rCMK/aVeDZu+olFx+drSjGggyIr2St8JHF6TR4sS7VJBehkTgRiec5GMe7Hj+jwPF64c4G0KQjCA0Ys6TfMx0H57/43BYDFCNSG6RxQNR8XQfnv/jcDwIMiq5l6/aq2bsnKf78Pwfh8OhyGoLM6eEp/vw/B8HM1TqbUDu5KzpPjz/x8EUzd5WMFOkaZIPTwgy838cgCBjwWG6CZNTZLnNdIAgdWgoCCr1yYNmr2dAEM+wiiztxRRF1kTJWx3BaWoWBGkHNHs9Q8TFn9zPARDEMyCIZ0AQz4AgnlEiSPyO56X7yZND6IMmbQhBJCkWJPY1Q94CyJuD8UGTMYQgkhQLEvsJuECyrB5lHzQZQwgiSfGDoe1JQ22xD5oAzmfapNizteVrhrw4sA+ajCEEkaTYs3Uyh1x9cIGjRPUIBGmHYkfKCV8zl+6PqnMI0jLFgsS+ZlgP9kGTMYQgkpR4to6cz9DzB1Xn7IMmbQhBJIFna8/AeIhnQBDPyBvCxSSHCZLNIY5zuiBIO+QUWXUnBUMQSfIEQZE1QfJcjSOHTJCcSr3utHkIIgmavZ5hu9aAz8WJAyeYnpHqXHRyc5IyhCCS4EndM1CpewZe2PEMCOIZ8P3uGWj2egYqdc+AIJ4BQTwDgngGBPEMCOIZEMQzIIhnQBDPgCCeAUE8A4J4BgTxDAjiGRDEMyCIZ5QIEvs64S0scD8GigWJfZ3wVrwjMny6d9uxsiVmQG2KBYnfU+etxIvrbHht9nCQWVwGjISLrxPeineEvk4u7j8GQYQpFiT2dcJblvOToNM7fPFdvd4tpatigdo0yiHa8Olbn6AcgkpdluZ1iFLDCAIkKWtlLUStrAXTylpItrIgSCtUPodQnsh9DoEgrdD8SR2CtAIE8QwI4hnNBYnZ16lPE5vJGEmmtku6Chxj35hsfDcSAYLIGYkAQeSMRBh3EQkqgCCeAUE8A4J4BgTxjMaClE+BqLLJWyKm0ohjO5wojpNwAl15piAaXXC/JHGaClIxBaLCJneJmCojju1wolQcGup0OJOKyJq5X5I8TQWpGL6qsMldIqbKiGM7nMiOQ+q7nClYPfSosXG/JHmaClIxwFthQ1hLxLgYcWyHE9lx6CZ3OVMQFVnulyRPU0EqpkBU2AR5S8RUGXFshxNZZ9LfLmcKIkHcL0meSeWQnCViqo107Lo55EJUL1fXI9s4h4xWh+QuEVNpZGLXrUNWQ+XdBdmOdUjFFIgKm9wlYqqMOLbDiZI/xhRULmcKIkHcL0meEZ9DiqZAVNjkLhFTeSKO7f4con+dKXNczmQEqXdJ4uBJ3TMgiGdAEM+AIJ4BQTwDgnjGeAQZxGtgDKedVsNIQiavPllmOShaY6PczEfGIkjS3Wmz9Cm3KnSnus3EIMYiSDJd2hCkMBSC5DLsk3Nm+uzM6DTSm/O0YInl+X84fbzToQUaaH+XDVW84fQJtTEznP7aIq1COtizYhvq4w8PPKx28Un4CENjthQe0ByohnPiCTC2HKKLFZWWalvft8O+WSg8sUTGsE9J3Q3CvzAem6g/iry1OJMx1CJ3g+gkFIG22Sw6YF/ZDJw8qU+MsQnyjzWzQf8OmCTRTuYT5b9Kex1F71cfYbxYEP7KGGpB1H8TJ4kDEgfkE4zjmpsyxjqEVj6e0mm1bEok9jY/Y0VT6awXUkzEi5VQuYNyRp4hp7M5SbieQCgIH9BkOQjCRdbUUnzzbs6pAj+9oE9GEI4XCxJs7P2Z0SRjyMZTcZYIIEgRJilVomxMRaUJJXzq4cGUKAdW9P4wTVW8hCCbR06ocixjGAqSPkkoCB8QgjBaELp3+zqtdFrrAkilXyJx05V6GE/9C2toVYp1qQ2VMowE4ZOER2Azu5UAQcKk7Ex9Vd/uXNCbxmniZtfNXqo0wmYvxzPVSdckuW61ZgzDOoRPEh2BzaJmLwSpg+dJNR4giGd4IIh+uqbC6URNQSLDnaSjB4KAJBDEMyCIZ0AQz4AgngFBPAOCeMb/AWxVJEzHKz+SAAAAAElFTkSuQmCC" />

<!-- rnb-plot-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuY29tcGxldCA9IGRmX3JvYyU+JWZpbHRlcihtZXRob2RlPT1cImNvbXBsZXRcIilcbnN0ZXAgPSBkZl9yb2MlPiVmaWx0ZXIobWV0aG9kZT09XCJzdGVwXCIpXG5cbmNvbXBsZXQgPSBwUk9DOjphdWMoY29tcGxldCRvYnMsIGNvbXBsZXQkc2NvcmUpXG5gYGAifQ== -->

```r
complet = df_roc%>%filter(methode=="complet")
step = df_roc%>%filter(methode=="step")

complet = pROC::auc(complet$obs, complet$score)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiU2V0dGluZyBsZXZlbHM6IGNvbnRyb2wgPSAwLCBjYXNlID0gMVxuU2V0dGluZyBkaXJlY3Rpb246IGNvbnRyb2xzIDwgY2FzZXNcbiJ9 -->

```
Setting levels: control = 0, case = 1
Setting direction: controls < cases
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc3RlcCA9IHBST0M6OmF1YyhzdGVwJG9icywgc3RlcCRzY29yZSlcbmBgYCJ9 -->

```r
step = pROC::auc(step$obs, step$score)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiU2V0dGluZyBsZXZlbHM6IGNvbnRyb2wgPSAwLCBjYXNlID0gMVxuU2V0dGluZyBkaXJlY3Rpb246IGNvbnRyb2xzIDwgY2FzZXNcbiJ9 -->

```
Setting levels: control = 0, case = 1
Setting direction: controls < cases
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGF0YS5mcmFtZShhdWNfY29tcGxldCA9IHJvdW5kKGNvbXBsZXQsIDUpLCBhdWNfc3RlcCA9IHJvdW5kKHN0ZXAsIDUpKVxuYGBgIn0= -->

```r
data.frame(auc_complet = round(complet, 5), auc_step = round(step, 5))
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImRhdGEuZnJhbWUiXSwibnJvdyI6MSwibmNvbCI6Miwic3VtbWFyeSI6eyJEZXNjcmlwdGlvbiI6WyJkZiBbMSB4IDJdIl19fSwicmRmIjoiSDRzSUFBQUFBQUFBQmd0eWlURG1pdUJpWUdCZ1ptQmhZR0pnWmdVeUdkaWNBd3lOVEkwWUdGaVlnRHhHb0F3bmlLNEFxaElHTWtDQ2ZDQUIrL2NkTzh0YmkyWWorSlBPZk50bmZoOU5JMnRlWW01cU1aQWhBTllNRWVST0xFMk9UODdQTGNoSkxZRUtjWUNFaWt0U0M5RDBjeGJsbCt2QnpPQUZTNEF4cWlYSk9ZbkZNRXRnZ2x3cGlTV0plbWxGUUwxQTNqODBMZXo1QlNXWitYbEFUVXdnYjdHaWFXWXNRaE1RS00wRHVTSkZOem1qTkM5YjE4Z1FaQVBVT1F5b1RvT3ptU0IyTXYySG1zVUtOWXN0TlM4OU15OFY1dmljeEtUVUhDaUhEK2hkc0cvMUNvb3k4MkNCd3dVVUxkWXJ5UzlKaEtualNzN1BnWW1BUGNmd0R3RFFFV0srendFQUFBPT0ifQ== -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["auc_complet"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["auc_step"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"0.98544","2":"0.98667"}],"options":{"columns":{"min":{},"max":[10],"total":[2]},"rows":{"min":[10],"max":[10],"total":[1]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmVnX2ZpbmFsID0gZ2xtKGZvcm11bGEgPSBhZG1pc3NpYmxlIH4gcmVkb3VibGVtZW50VGVybWluYWxlICsgcmFuZ0VuVGVybWluYWxlICsgXG4gICAgY29kZUZpbGllcmVfMSArIGNvZGVGaWxpZXJlXzIgKyBjb2RlRmlsaWVyZV82ICsgYDFFUkVfQU5HTEFJU2AgKyBcbiAgICBgMUVSRV9NQVRIRU1BVElRVUVTYCArIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBgMk5ERV9NQVRIRU1BVElRVUVTYCArIFxuICAgIGAyTkRFX1NDSUVOQ0VTIFBIWVNJUVVFU2AgKyBCQUNfQU5HTEFJUyArIEJBQ19GUkFOQ0FJUyArIFxuICAgIEJBQ19NQVRIRU1BVElRVUVTICsgYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgICsgQkFDX1NWVCArIFxuICAgIFRMRV9BTkdMQUlTICsgVExFX0ZSQU5DQUlTICsgVExFX01BVEhFTUFUSVFVRVMgKyBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AsIFxuICAgIGZhbWlseSA9IGJpbm9taWFsKGxvZ2l0KSwgZGF0YSA9IGRmKVxuYGBgIn0= -->

```r
reg_final = glm(formula = admissible ~ redoublementTerminale + rangEnTerminale + 
    codeFiliere_1 + codeFiliere_2 + codeFiliere_6 + `1ERE_ANGLAIS` + 
    `1ERE_MATHEMATIQUES` + `1ERE_SCIENCES PHYSIQUES` + `2NDE_MATHEMATIQUES` + 
    `2NDE_SCIENCES PHYSIQUES` + BAC_ANGLAIS + BAC_FRANCAIS + 
    BAC_MATHEMATIQUES + `BAC_SCIENCES PHYSIQUES` + BAC_SVT + 
    TLE_ANGLAIS + TLE_FRANCAIS + TLE_MATHEMATIQUES + `TLE_SCIENCES PHYSIQUES`, 
    family = binomial(logit), data = df)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiV2FybmluZzogZ2xtLmZpdDogZGVzIHByb2JhYmlsaXTDqXMgb250IMOpdMOpIGFqdXN0w6llcyBudW3DqXJpcXVlbWVudCDDoCAwIG91IDFcbiJ9 -->

```
Warning: glm.fit: des probabilités ont été ajustées numériquement à 0 ou 1
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc2F2ZVJEUyhyZWdfZmluYWwsIGZpbGUgPSBcInJlZ3Jlc3Npb25fbG9naXN0aXF1ZV9zdWNjZXNfZWNoZWMucmRzXCIpXG5gYGAifQ== -->

```r
saveRDS(reg_final, file = "regression_logistique_succes_echec.rds")
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->





<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJldmlzaW9uID0gZnVuY3Rpb24oZHQpIHtcbiAgZHQgPSBkdCU+JXNlbGVjdChnZW5yZSwgbWVudGlvbkF1QmFjLCByZWRvdWJsZW1lbnRUZXJtaW5hbGUsIHJhbmdFblRlcm1pbmFsZSwgYWdlLCBhbm5lZSwgY29kZUZpbGllcmVfMSwgY29kZUZpbGllcmVfMiwgY29kZUZpbGllcmVfMywgY29kZUZpbGllcmVfNCwgY29kZUZpbGllcmVfNSwgY29kZUZpbGllcmVfNiwgY29kZUZpbGllcmVfNywgY29kZUZpbGllcmVfOCwgY29kZUZpbGllcmVfOSwgYDFFUkVfQU5HTEFJU2AsIGAxRVJFX0ZSQU5DQUlTYCwgYDFFUkVfTUFUSEVNQVRJUVVFU2AsIGAxRVJFX1NDSUVOQ0VTIFBIWVNJUVVFU2AsIGAxRVJFX1NWVGAsIGAyTkRFX0FOR0xBSVNgLCBgMk5ERV9GUkFOQ0FJU2AsIGAyTkRFX01BVEhFTUFUSVFVRVNgLCBgMk5ERV9TQ0lFTkNFUyBQSFlTSVFVRVNgLCBgMk5ERV9TVlRgLCBgQkFDX0FOR0xBSVNgLCBgQkFDX0ZSQU5DQUlTYCwgYEJBQ19NQVRIRU1BVElRVUVTYCwgYEJBQ19TQ0lFTkNFUyBQSFlTSVFVRVNgLCBgQkFDX1NWVGAsIFRMRV9BTkdMQUlTLCBUTEVfRlJBTkNBSVMsIFRMRV9NQVRIRU1BVElRVUVTLCBgVExFX1NDSUVOQ0VTIFBIWVNJUVVFU2AsIFRMRV9TVlQpXG4gIFxuICBjb2xuYW1lcyhkdClcbiAgXG4gIGsgPSAxXG4gIGZvciAoaSBpbiBjb2xuYW1lcyhkdCkpIHtcbiAgICAgIGlmKGsgPiAxNSkge1xuICAgICAgICBkdFtpcy5uYShkdFssIGldKSwgaV0gPSBcIjBcIlxuICAgICAgICBkdFssIGNvbG5hbWVzKGRmJT4lc2VsZWN0KGkpKVsxXV0gPSBhcy5kb3VibGUodW5saXN0KGR0JT4lc2VsZWN0KGkpKSlcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIGR0W2lzLm5hKGR0WywgaV0pLCBpXSA9IFwiYXVjdW5cIlxuICAgICAgICBkdFssIGNvbG5hbWVzKGR0JT4lc2VsZWN0KGkpKVsxXV0gPSBhcy5mYWN0b3IodW5saXN0KGR0JT4lc2VsZWN0KGkpKSlcbiAgICAgIH1cbiAgICBcbiAgICBrID0gayArIDFcbiAgfVxuICBcbiAgbW9kZWwgPSByZWFkUkRTKGZpbGUgPSBcInJlZ3Jlc3Npb25fbG9naXN0aXF1ZV9zdWNjZXNfZWNoZWMucmRzXCIpXG4gIHByZXYgPSBwcmVkaWN0KG1vZGVsLCBuZXdkYXRhPWR0ICwgdHlwZT1cInJlc3BvbnNlXCIpXG4gIHByZXZfcHJvYiA8LSBkYXRhLmZyYW1lKHByb2JhYmlsdGUgPSByb3VuZChwcmV2LCA1KSlcbiAgcHJldl9jbGFzcyA8LSBhcHBseShwcmV2X3Byb2I+PTAuNSwgMiwgZmFjdG9yLGxhYmVscz1jKDAsIDEpKVxuICBwcmV2X2NsYXNzIDwtIGRhdGEuZnJhbWUocHJldmlzaW9uID0gcHJldl9jbGFzcylcbiAgXG4gIHJlcyA9IChjYmluZChwcmV2X3Byb2IsIHByZXZfY2xhc3MpKVxuICBjb2xuYW1lcyhyZXMpID0gYyhcInByb2JcIiwgXCJwcmV2XCIpXG4gIHJldHVybihyZXMpXG59XG5WaWV3KHByZXZpc2lvbihkZiU+JXNlbGVjdCgtYWRtaXNzaWJsZSkpKVxuYGBgIn0= -->

```r
prevision = function(dt) {
  dt = dt%>%select(genre, mentionAuBac, redoublementTerminale, rangEnTerminale, age, annee, codeFiliere_1, codeFiliere_2, codeFiliere_3, codeFiliere_4, codeFiliere_5, codeFiliere_6, codeFiliere_7, codeFiliere_8, codeFiliere_9, `1ERE_ANGLAIS`, `1ERE_FRANCAIS`, `1ERE_MATHEMATIQUES`, `1ERE_SCIENCES PHYSIQUES`, `1ERE_SVT`, `2NDE_ANGLAIS`, `2NDE_FRANCAIS`, `2NDE_MATHEMATIQUES`, `2NDE_SCIENCES PHYSIQUES`, `2NDE_SVT`, `BAC_ANGLAIS`, `BAC_FRANCAIS`, `BAC_MATHEMATIQUES`, `BAC_SCIENCES PHYSIQUES`, `BAC_SVT`, TLE_ANGLAIS, TLE_FRANCAIS, TLE_MATHEMATIQUES, `TLE_SCIENCES PHYSIQUES`, TLE_SVT)
  
  colnames(dt)
  
  k = 1
  for (i in colnames(dt)) {
      if(k > 15) {
        dt[is.na(dt[, i]), i] = "0"
        dt[, colnames(df%>%select(i))[1]] = as.double(unlist(dt%>%select(i)))
      } else {
        dt[is.na(dt[, i]), i] = "aucun"
        dt[, colnames(dt%>%select(i))[1]] = as.factor(unlist(dt%>%select(i)))
      }
    
    k = k + 1
  }
  
  model = readRDS(file = "regression_logistique_succes_echec.rds")
  prev = predict(model, newdata=dt , type="response")
  prev_prob <- data.frame(probabilte = round(prev, 5))
  prev_class <- apply(prev_prob>=0.5, 2, factor,labels=c(0, 1))
  prev_class <- data.frame(prevision = prev_class)
  
  res = (cbind(prev_prob, prev_class))
  colnames(res) = c("prob", "prev")
  return(res)
}
View(prevision(df%>%select(-admissible)))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->







<!-- rnb-text-end -->

