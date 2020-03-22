--zadanie 1
select  PRACOWNICY.NAZWISKO,
        PRACOWNICY.ETAT,
        PRACOWNICY.ID_ZESP
from    PRACOWNICY
where   PRACOWNICY.ID_ZESP = (
        select  PRACOWNICY.ID_ZESP
        from    PRACOWNICY
        where   PRACOWNICY.NAZWISKO = 'BRZEZINSKI'
    )
order by PRACOWNICY.NAZWISKO;

--zadanie 2
select  PRACOWNICY.NAZWISKO,
        Z.NAZWA
from    PRACOWNICY left join ZESPOLY Z on PRACOWNICY.ID_ZESP = Z.ID_ZESP
where   PRACOWNICY.ID_ZESP = (
        select  PRACOWNICY.ID_ZESP
        from    PRACOWNICY
        where   PRACOWNICY.NAZWISKO = 'BRZEZINSKI'
    )
order by PRACOWNICY.NAZWISKO;

--zadanie 3
select  PRACOWNICY.NAZWISKO,
        PRACOWNICY.ETAT,
        PRACOWNICY.ZATRUDNIONY
from    PRACOWNICY
where   PRACOWNICY.ZATRUDNIONY = (
        select  MIN(PRACOWNICY.ZATRUDNIONY)
        from    PRACOWNICY
        where   PRACOWNICY.ETAT = 'PROFESOR'
    );

--zadanie 4
select  PRACOWNICY.NAZWISKO,
        PRACOWNICY.ZATRUDNIONY,
        PRACOWNICY.ID_ZESP
from    PRACOWNICY
where   PRACOWNICY.ZATRUDNIONY in (
        select  MAX(PRACOWNICY.ZATRUDNIONY)
        from PRACOWNICY
        group by PRACOWNICY.ID_ZESP
    )
order by PRACOWNICY.ZATRUDNIONY;

--zadanie 5
select  ZESPOLY.ID_ZESP,
        ZESPOLY.NAZWA,
        ZESPOLY.ADRES
from    ZESPOLY
where   ZESPOLY.ID_ZESP in (
        select  PRACOWNICY.ID_ZESP
        from    PRACOWNICY
        having  COUNT(PRACOWNICY.NAZWISKO) = 0
        group by PRACOWNICY.ID_ZESP
    )