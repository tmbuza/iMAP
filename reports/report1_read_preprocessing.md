---
title: "Progress report 1"
bibliography: ../library/imap.bib
date: 'Updated: 2019-02-03 00:17:08'
output:
  html_document:
    css: ../code/css/report.css
    keep_md: yes
link-citations: yes
subtitle: Metadata profiling
biblio-style: apalike

---







<!-- # <mark>Progress report 1</mark> -->

<br>


<!-- # Metadata profiling -->

<!-- <br> -->





```
                variable q_zeros p_zeros q_na p_na q_inf p_inf      type
1               SampleID       0       0    0    0     0     0 character
2        BarcodeSequence       0       0    8  100     0     0   logical
3  ForwardPrimerSequence       0       0    8  100     0     0   logical
4  ReversePrimerSequence       0       0    8  100     0     0   logical
5            ForwardRead       0       0    0    0     0     0 character
6            ReverseRead       0       0    0    0     0     0 character
7              origGroup       0       0    0    0     0     0 character
8                    Sex       0       0    0    0     0     0 character
9                   Time       0       0    0    0     0     0 character
10                 DayID       0       0    0    0     0     0 character
11                   DPW       2      25    0    0     0     0   numeric
12           Description       0       0    0    0     0     0 character
   unique
1       8
2       0
3       0
4       0
5       8
6       8
7       8
8       2
9       2
10      4
11      4
12      1
```


## Status of metadata

<hr>


<table class="table table-striped" style="font-size: 14px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:right;"> q_zeros </th>
   <th style="text-align:right;"> p_zeros </th>
   <th style="text-align:right;"> q_na </th>
   <th style="text-align:right;"> p_na </th>
   <th style="text-align:right;"> q_inf </th>
   <th style="text-align:right;"> p_inf </th>
   <th style="text-align:left;"> type </th>
   <th style="text-align:right;"> unique </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> SampleID </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BarcodeSequence </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> logical </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ForwardPrimerSequence </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> logical </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ReversePrimerSequence </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> logical </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ForwardRead </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ReverseRead </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origGroup </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sex </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Time </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DayID </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DPW </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> numeric </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Description </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

Key: **q_zeros**: quantity of zeros or missing data; **q_na**: quantity of NA; **q_inf**: quantity of infinite values; **type**: factor, character, integer or numeric..; **unique**: quantity of unique values. Percentages are indicated by **p_**.


When reviewing metadata status you may notice that numeric variables are confused with numeric data. For example, variable **DPW** (days post weaning) on Table x shows 12 missing values (3.33%) which is incorrect. As investigators we know that day 1 was coded zero (0) (12 zeros for 12 mouse) which in descriptive statistics is interpreted as missing data. To correct this we re-coded the samples with unique identifies shown as DayID to distinguish them from integers. However, depending of experiment this kind of variables need to be converted to character during analysis. 

<br>

## Subset of the metadata for mapping purposes

<hr>

**First 5 lines of mapping metadata**

<table class="table table-striped" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> SampleID </th>
   <th style="text-align:left;"> origGroup </th>
   <th style="text-align:left;"> Sex </th>
   <th style="text-align:left;"> Time </th>
   <th style="text-align:left;"> DayID </th>
   <th style="text-align:right;"> DPW </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> F3D000 </td>
   <td style="text-align:left;"> F3D0 </td>
   <td style="text-align:left;"> Female </td>
   <td style="text-align:left;"> Early </td>
   <td style="text-align:left;"> D000 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F3D006 </td>
   <td style="text-align:left;"> F3D6 </td>
   <td style="text-align:left;"> Female </td>
   <td style="text-align:left;"> Early </td>
   <td style="text-align:left;"> D006 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F3D142 </td>
   <td style="text-align:left;"> F3D142 </td>
   <td style="text-align:left;"> Female </td>
   <td style="text-align:left;"> Late </td>
   <td style="text-align:left;"> D142 </td>
   <td style="text-align:right;"> 142 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F3D143 </td>
   <td style="text-align:left;"> F3D143 </td>
   <td style="text-align:left;"> Female </td>
   <td style="text-align:left;"> Late </td>
   <td style="text-align:left;"> D143 </td>
   <td style="text-align:right;"> 143 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1D000 </td>
   <td style="text-align:left;"> M1D0 </td>
   <td style="text-align:left;"> Male </td>
   <td style="text-align:left;"> Early </td>
   <td style="text-align:left;"> D000 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

<br>


**Last 5 lines of mapping metadata**

<table class="table table-striped" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> SampleID </th>
   <th style="text-align:left;"> origGroup </th>
   <th style="text-align:left;"> Sex </th>
   <th style="text-align:left;"> Time </th>
   <th style="text-align:left;"> DayID </th>
   <th style="text-align:right;"> DPW </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> F3D143 </td>
   <td style="text-align:left;"> F3D143 </td>
   <td style="text-align:left;"> Female </td>
   <td style="text-align:left;"> Late </td>
   <td style="text-align:left;"> D143 </td>
   <td style="text-align:right;"> 143 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1D000 </td>
   <td style="text-align:left;"> M1D0 </td>
   <td style="text-align:left;"> Male </td>
   <td style="text-align:left;"> Early </td>
   <td style="text-align:left;"> D000 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1D006 </td>
   <td style="text-align:left;"> M1D6 </td>
   <td style="text-align:left;"> Male </td>
   <td style="text-align:left;"> Early </td>
   <td style="text-align:left;"> D006 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1D142 </td>
   <td style="text-align:left;"> M1D142 </td>
   <td style="text-align:left;"> Male </td>
   <td style="text-align:left;"> Late </td>
   <td style="text-align:left;"> D142 </td>
   <td style="text-align:right;"> 142 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1D143 </td>
   <td style="text-align:left;"> M1D143 </td>
   <td style="text-align:left;"> Male </td>
   <td style="text-align:left;"> Late </td>
   <td style="text-align:left;"> D143 </td>
   <td style="text-align:right;"> 143 </td>
  </tr>
</tbody>
</table>

<br>

## Frequency of experimental variables

<hr>


<img src="./figures/var-1.png" width="80%" height="80%" style="display: block; margin: auto;" />

Figure 3. Frequency of experimental variables

<br>





## Posible questions

<hr>

### Metadata profiling 

* QN1: Are there samples to be removed from the analysis based on their frequency?
* QN2: Are there enough variables for downstream diversity and statistical analysis?
* QN3: .......?
* QN4: .......?
* QN5: .......?


<br>



<br>
