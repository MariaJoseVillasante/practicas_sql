SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a
    inner join public.pokemones b
    on a.pokedex=b.pokedex;

SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a
    full outer join public.pokemones b
    on a.pokedex=b.pokedex;

SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a
    right join public.pokemones b
    on a.pokedex=b.pokedex;

-- obtener como resultado los nombres de los pokemones que fueron obtenidos por huevos
SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a
    right join public.pokemones b
    on a.pokedex=b.pokedex
    where a.huevo='true';
