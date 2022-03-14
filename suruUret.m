function suru = suruUret(Nbirey, Ngen)
% Genetik Algoritma ile kelime bulma uygulamasına ait altprogram.
% Burada her biri Ngen adet gene (harfe) sahip Nbirey adet birey
% (çözüm adayı kelime) üretilir. Üretilen sürü (aday kelime topluluğu)
% "Nbirey x Ngen" boyutlarında bir matris şeklindedir.
%
% Mehmet Emin YÜKSEL, Kasım-2017.

suru = 65 + floor( 26 * rand (Nbirey, Ngen));
suru = char(suru);


end