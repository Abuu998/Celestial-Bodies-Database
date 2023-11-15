--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(60),
    diameter_in_light_years integer,
    description text,
    distance_from_earth numeric(4,1),
    unique_col character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    planet_id integer,
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean,
    description text,
    distance_from_earth numeric(4,1),
    unique_col character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    star_id integer,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type character varying(60),
    is_spherical boolean,
    has_life boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    unique_col character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_galaxy (
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    planet_galaxy_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.planet_galaxy OWNER TO freecodecamp;

--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_planet_galaxy_id_seq OWNED BY public.planet_galaxy.planet_galaxy_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth integer,
    unique_col character varying(50)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_galaxy planet_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy ALTER COLUMN planet_galaxy_id SET DEFAULT nextval('public.planet_galaxy_planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Comet Galaxy', 'Spiral', NULL, 'The Comet Galaxy, a spiral galaxy located 3.2 billion light-years from Earth, in the galaxy cluster Abell 2667, was found with the Hubble Space Telescope. This galaxy has slightly more mass than our Milky Way. It was detected on 2 March 2007', 3.2, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Barred spiral galaxy', NULL, 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way. It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224. Andromeda has a diameter of about 46.56 kiloparsecs (152,000 light-years)[8] and is approximately 765 kpc (2.5 million light-years) from Earth.', 2.5, NULL);
INSERT INTO public.galaxy VALUES (3, 'Hercules A', 'Elliptical galaxy', NULL, 'The galaxy, 3C 348, is a supergiant elliptical galaxy. It is classified as type E3 to E4 of the updated Hubble-de Vaucouleurs extended galaxy morphological classification scheme. Little else is known about the galaxy.', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Barred spiral galaxy', NULL, 'The Milky Way[c] is the galaxy that includes the Solar System, with the name describing the galaxy"s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Tadpole Galaxy', 'Barred spiral galaxy', NULL, 'The Tadpole Galaxy, also known as UGC 10214[2] and Arp 188,[3] is a disrupted barred spiral galaxy located 420 million light-years from Earth in the northern constellation Draco. Its most dramatic feature is a trail of stars about 280,000 light-years long. Its size has been attributed to a merger with a smaller galaxy that is believed to have occurred about 100 million years ago.', 420.0, NULL);
INSERT INTO public.galaxy VALUES (6, 'Comet Galaxy', 'Spiral', NULL, 'The Comet Galaxy, a spiral galaxy located 3.2 billion light-years from Earth, in the galaxy cluster Abell 2667, was found with the Hubble Space Telescope. This galaxy has slightly more mass than our Milky Way. It was detected on 2 March 2007', 3.2, NULL);
INSERT INTO public.galaxy VALUES (7, 'Andromeda Galaxy', 'Barred spiral galaxy', NULL, 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way. It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224. Andromeda has a diameter of about 46.56 kiloparsecs (152,000 light-years)[8] and is approximately 765 kpc (2.5 million light-years) from Earth.', 2.5, NULL);
INSERT INTO public.galaxy VALUES (8, 'Hercules A', 'Elliptical galaxy', NULL, 'The galaxy, 3C 348, is a supergiant elliptical galaxy. It is classified as type E3 to E4 of the updated Hubble-de Vaucouleurs extended galaxy morphological classification scheme. Little else is known about the galaxy.', NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Milky Way', 'Barred spiral galaxy', NULL, 'The Milky Way[c] is the galaxy that includes the Solar System, with the name describing the galaxy"s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Tadpole Galaxy', 'Barred spiral galaxy', NULL, 'The Tadpole Galaxy, also known as UGC 10214[2] and Arp 188,[3] is a disrupted barred spiral galaxy located 420 million light-years from Earth in the northern constellation Draco. Its most dramatic feature is a trail of stars about 280,000 light-years long. Its size has been attributed to a merger with a smaller galaxy that is believed to have occurred about 100 million years ago.', 420.0, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', true, 'The Moon is Earth"s only natural satellite. It orbits at an average distance of 384400 km (238900 mi), about 30 times the planet"s diameter. The Moon always presents the same side to Earth, because gravitational pull has locked its rotation to the planet. This results in the lunar day of 29.5 days matching the lunar month. The Moon"s gravitational pull – and to a lesser extent the Sun"s – are the main drivers of the tides.', 400.0, NULL);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', NULL, 'Phobos (/ˈfoʊbɒs/; systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars,[9] the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. It is named after Phobos, the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', NULL, NULL);
INSERT INTO public.moon VALUES (3, 3, 'Ganymede', true, 'Ganymede, or Jupiter III, is the largest and most massive natural satellite of Jupiter as well as in the Solar System, being a planetary-mass moon. It is the largest Solar System object without an atmosphere, despite being the only moon in the Solar System with a substantial magnetic field. Like Titan, it is larger than the planet Mercury, but has somewhat less surface gravity than Mercury, Io or the Moon.', NULL, NULL);
INSERT INTO public.moon VALUES (4, 4, 'Titan', true, 'Titan is the largest moon of Saturn, the second-largest in the Solar System and larger than any of the dwarf planets of the Solar System. It is the only moon known to have a dense atmosphere, and is the only known object in space other than Earth on which clear evidence of stable bodies of surface liquid has been found.', NULL, NULL);
INSERT INTO public.moon VALUES (5, 5, 'Proteus', false, 'Proteus (/ˈproʊtiəs/ PROH-tee-əs), also known as Neptune VIII, is the second-largest Neptunian moon, and Neptune"s largest inner satellite. Discovered by Voyager 2 spacecraft in 1989, it is named after Proteus, the shape-changing sea god of Greek mythology.[10] Proteus orbits Neptune in a nearly equatorial orbit at a distance of about 4.75 times the radius of Neptune"s equator.', NULL, NULL);
INSERT INTO public.moon VALUES (1, 6, 'Moon', true, 'The Moon is Earth"s only natural satellite. It orbits at an average distance of 384400 km (238900 mi), about 30 times the planet"s diameter. The Moon always presents the same side to Earth, because gravitational pull has locked its rotation to the planet. This results in the lunar day of 29.5 days matching the lunar month. The Moon"s gravitational pull – and to a lesser extent the Sun"s – are the main drivers of the tides.', 400.0, NULL);
INSERT INTO public.moon VALUES (2, 7, 'Phobos', NULL, 'Phobos (/ˈfoʊbɒs/; systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars,[9] the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. It is named after Phobos, the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', NULL, NULL);
INSERT INTO public.moon VALUES (3, 8, 'Ganymede', true, 'Ganymede, or Jupiter III, is the largest and most massive natural satellite of Jupiter as well as in the Solar System, being a planetary-mass moon. It is the largest Solar System object without an atmosphere, despite being the only moon in the Solar System with a substantial magnetic field. Like Titan, it is larger than the planet Mercury, but has somewhat less surface gravity than Mercury, Io or the Moon.', NULL, NULL);
INSERT INTO public.moon VALUES (4, 9, 'Titan', true, 'Titan is the largest moon of Saturn, the second-largest in the Solar System and larger than any of the dwarf planets of the Solar System. It is the only moon known to have a dense atmosphere, and is the only known object in space other than Earth on which clear evidence of stable bodies of surface liquid has been found.', NULL, NULL);
INSERT INTO public.moon VALUES (5, 10, 'Proteus', false, 'Proteus (/ˈproʊtiəs/ PROH-tee-əs), also known as Neptune VIII, is the second-largest Neptunian moon, and Neptune"s largest inner satellite. Discovered by Voyager 2 spacecraft in 1989, it is named after Proteus, the shape-changing sea god of Greek mythology.[10] Proteus orbits Neptune in a nearly equatorial orbit at a distance of about 4.75 times the radius of Neptune"s equator.', NULL, NULL);
INSERT INTO public.moon VALUES (1, 11, 'Moon', true, 'The Moon is Earth"s only natural satellite. It orbits at an average distance of 384400 km (238900 mi), about 30 times the planet"s diameter. The Moon always presents the same side to Earth, because gravitational pull has locked its rotation to the planet. This results in the lunar day of 29.5 days matching the lunar month. The Moon"s gravitational pull – and to a lesser extent the Sun"s – are the main drivers of the tides.', 400.0, NULL);
INSERT INTO public.moon VALUES (2, 12, 'Phobos', NULL, 'Phobos (/ˈfoʊbɒs/; systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars,[9] the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. It is named after Phobos, the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', NULL, NULL);
INSERT INTO public.moon VALUES (3, 13, 'Ganymede', true, 'Ganymede, or Jupiter III, is the largest and most massive natural satellite of Jupiter as well as in the Solar System, being a planetary-mass moon. It is the largest Solar System object without an atmosphere, despite being the only moon in the Solar System with a substantial magnetic field. Like Titan, it is larger than the planet Mercury, but has somewhat less surface gravity than Mercury, Io or the Moon.', NULL, NULL);
INSERT INTO public.moon VALUES (4, 14, 'Titan', true, 'Titan is the largest moon of Saturn, the second-largest in the Solar System and larger than any of the dwarf planets of the Solar System. It is the only moon known to have a dense atmosphere, and is the only known object in space other than Earth on which clear evidence of stable bodies of surface liquid has been found.', NULL, NULL);
INSERT INTO public.moon VALUES (5, 15, 'Proteus', false, 'Proteus (/ˈproʊtiəs/ PROH-tee-əs), also known as Neptune VIII, is the second-largest Neptunian moon, and Neptune"s largest inner satellite. Discovered by Voyager 2 spacecraft in 1989, it is named after Proteus, the shape-changing sea god of Greek mythology.[10] Proteus orbits Neptune in a nearly equatorial orbit at a distance of about 4.75 times the radius of Neptune"s equator.', NULL, NULL);
INSERT INTO public.moon VALUES (1, 16, 'Moon', true, 'The Moon is Earth"s only natural satellite. It orbits at an average distance of 384400 km (238900 mi), about 30 times the planet"s diameter. The Moon always presents the same side to Earth, because gravitational pull has locked its rotation to the planet. This results in the lunar day of 29.5 days matching the lunar month. The Moon"s gravitational pull – and to a lesser extent the Sun"s – are the main drivers of the tides.', 400.0, NULL);
INSERT INTO public.moon VALUES (2, 17, 'Phobos', NULL, 'Phobos (/ˈfoʊbɒs/; systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars,[9] the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. It is named after Phobos, the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', NULL, NULL);
INSERT INTO public.moon VALUES (3, 18, 'Ganymede', true, 'Ganymede, or Jupiter III, is the largest and most massive natural satellite of Jupiter as well as in the Solar System, being a planetary-mass moon. It is the largest Solar System object without an atmosphere, despite being the only moon in the Solar System with a substantial magnetic field. Like Titan, it is larger than the planet Mercury, but has somewhat less surface gravity than Mercury, Io or the Moon.', NULL, NULL);
INSERT INTO public.moon VALUES (4, 19, 'Titan', true, 'Titan is the largest moon of Saturn, the second-largest in the Solar System and larger than any of the dwarf planets of the Solar System. It is the only moon known to have a dense atmosphere, and is the only known object in space other than Earth on which clear evidence of stable bodies of surface liquid has been found.', NULL, NULL);
INSERT INTO public.moon VALUES (5, 20, 'Proteus', false, 'Proteus (/ˈproʊtiəs/ PROH-tee-əs), also known as Neptune VIII, is the second-largest Neptunian moon, and Neptune"s largest inner satellite. Discovered by Voyager 2 spacecraft in 1989, it is named after Proteus, the shape-changing sea god of Greek mythology.[10] Proteus orbits Neptune in a nearly equatorial orbit at a distance of about 4.75 times the radius of Neptune"s equator.', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 1, 'Earth', 'Terrestrial', true, true, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth"s water is contained in its global ocean, covering 70.8% of Earth"s crust. The remaining 29.2% of Earth"s crust is land, most of which is located in the form of continental landmasses within one hemisphere, Earth"s land hemisphere.', 400, NULL);
INSERT INTO public.planet VALUES (1, 2, 'Mars', 'Terrestrial', true, false, 'Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname "the Red Planet".[21][22] Mars"s radius is second smallest among the planets in the Solar System at 3,389.5 km (2,106 mi). The Martian dichotomy is visible on the surface: on average, the terrain on Mars"s northern hemisphere is flatter and lower than its southern hemisphere. Mars has a thin atmosphere made primarily of carbon dioxide, and two irregularly shaped natural satellites: Phobos and Deimos.', NULL, NULL);
INSERT INTO public.planet VALUES (2, 3, 'Jupiter', 'Gas', true, false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun. Jupiter orbits the Sun at a distance of 5.20 AU (778.5 Gm) with an orbital period of 11.86 years. Jupiter is the third brightest natural object in the Earth"s night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after Jupiter, the chief deity of ancient Roman religion.', NULL, NULL);
INSERT INTO public.planet VALUES (3, 4, 'Saturn', 'Gas', true, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth.[26][27] It has only one-eighth the average density of Earth, but is over 95 times more massive.', NULL, NULL);
INSERT INTO public.planet VALUES (5, 5, 'Neptune', 'Gas And Liquid', true, false, 'Neptune is the eighth and farthest planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere. Being composed primarily of gases and liquids, it has no well-defined solid surface. The planet orbits the Sun once every 164.8 years at an orbital distance of 30.1 astronomical units (4.5 billion kilometres; 2.8 billion miles). It is named after the Roman god of the sea and has the astronomical symbol ♆, representing Neptune"s trident.', NULL, NULL);
INSERT INTO public.planet VALUES (4, 6, 'Earth', 'Terrestrial', true, true, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth"s water is contained in its global ocean, covering 70.8% of Earth"s crust. The remaining 29.2% of Earth"s crust is land, most of which is located in the form of continental landmasses within one hemisphere, Earth"s land hemisphere.', 400, NULL);
INSERT INTO public.planet VALUES (1, 7, 'Mars', 'Terrestrial', true, false, 'Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname "the Red Planet".[21][22] Mars"s radius is second smallest among the planets in the Solar System at 3,389.5 km (2,106 mi). The Martian dichotomy is visible on the surface: on average, the terrain on Mars"s northern hemisphere is flatter and lower than its southern hemisphere. Mars has a thin atmosphere made primarily of carbon dioxide, and two irregularly shaped natural satellites: Phobos and Deimos.', NULL, NULL);
INSERT INTO public.planet VALUES (2, 8, 'Jupiter', 'Gas', true, false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun. Jupiter orbits the Sun at a distance of 5.20 AU (778.5 Gm) with an orbital period of 11.86 years. Jupiter is the third brightest natural object in the Earth"s night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after Jupiter, the chief deity of ancient Roman religion.', NULL, NULL);
INSERT INTO public.planet VALUES (3, 9, 'Saturn', 'Gas', true, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth.[26][27] It has only one-eighth the average density of Earth, but is over 95 times more massive.', NULL, NULL);
INSERT INTO public.planet VALUES (5, 10, 'Neptune', 'Gas And Liquid', true, false, 'Neptune is the eighth and farthest planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere. Being composed primarily of gases and liquids, it has no well-defined solid surface. The planet orbits the Sun once every 164.8 years at an orbital distance of 30.1 astronomical units (4.5 billion kilometres; 2.8 billion miles). It is named after the Roman god of the sea and has the astronomical symbol ♆, representing Neptune"s trident.', NULL, NULL);
INSERT INTO public.planet VALUES (4, 11, 'Earth', 'Terrestrial', true, true, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth"s water is contained in its global ocean, covering 70.8% of Earth"s crust. The remaining 29.2% of Earth"s crust is land, most of which is located in the form of continental landmasses within one hemisphere, Earth"s land hemisphere.', 400, NULL);
INSERT INTO public.planet VALUES (1, 12, 'Mars', 'Terrestrial', true, false, 'Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname "the Red Planet".[21][22] Mars"s radius is second smallest among the planets in the Solar System at 3,389.5 km (2,106 mi). The Martian dichotomy is visible on the surface: on average, the terrain on Mars"s northern hemisphere is flatter and lower than its southern hemisphere. Mars has a thin atmosphere made primarily of carbon dioxide, and two irregularly shaped natural satellites: Phobos and Deimos.', NULL, NULL);
INSERT INTO public.planet VALUES (2, 13, 'Jupiter', 'Gas', true, false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun. Jupiter orbits the Sun at a distance of 5.20 AU (778.5 Gm) with an orbital period of 11.86 years. Jupiter is the third brightest natural object in the Earth"s night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after Jupiter, the chief deity of ancient Roman religion.', NULL, NULL);
INSERT INTO public.planet VALUES (3, 14, 'Saturn', 'Gas', true, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth.[26][27] It has only one-eighth the average density of Earth, but is over 95 times more massive.', NULL, NULL);
INSERT INTO public.planet VALUES (5, 15, 'Neptune', 'Gas And Liquid', true, false, 'Neptune is the eighth and farthest planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere. Being composed primarily of gases and liquids, it has no well-defined solid surface. The planet orbits the Sun once every 164.8 years at an orbital distance of 30.1 astronomical units (4.5 billion kilometres; 2.8 billion miles). It is named after the Roman god of the sea and has the astronomical symbol ♆, representing Neptune"s trident.', NULL, NULL);


--
-- Data for Name: planet_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_galaxy VALUES (4, 1, 1, NULL);
INSERT INTO public.planet_galaxy VALUES (4, 2, 2, NULL);
INSERT INTO public.planet_galaxy VALUES (4, 3, 3, NULL);
INSERT INTO public.planet_galaxy VALUES (1, 10, 4, NULL);
INSERT INTO public.planet_galaxy VALUES (2, 15, 5, NULL);
INSERT INTO public.planet_galaxy VALUES (5, 11, 6, NULL);
INSERT INTO public.planet_galaxy VALUES (4, 5, 7, NULL);
INSERT INTO public.planet_galaxy VALUES (4, 4, 8, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 1, 'Sun', 'The Sun is the star at the center of the Solar System. It is a massive, hot ball of plasma, inflated and heated by energy produced by nuclear fusion reactions at its core. Part of this internal energy is emitted from its surface as light, ultraviolet, and infrared radiation, providing most of the energy for life on Earth.', 8, NULL);
INSERT INTO public.star VALUES (2, 2, 'Arcturus', 'Arcturus is the brightest star in the northern constellation of Boötes. With an apparent visual magnitude of -0.05,[2] it is the fourth-brightest star in the night sky, and the brightest in the northern celestial hemisphere.', NULL, NULL);
INSERT INTO public.star VALUES (3, 3, 'Canopus', 'Canopus is the brightest star in the southern constellation of Carina and the second-brightest star in the night sky. It is also designated α Carinae, which is romanized (transliterated) to Alpha Carinae. With a visual apparent magnitude of −0.74, it is outshone only by Sirius.', NULL, NULL);
INSERT INTO public.star VALUES (1, 4, 'Wezen', 'Delta Canis Majoris (Latinised from δ Canis Majoris, abbreviated Delta CMa, δ CMa), officially named Wezen /ˈwiːzən/,[10] is a star in the constellation of Canis Major. It is a yellow-white F-type supergiant with an apparent magnitude of +1.83. Since 1943, the spectrum of this star has served as one of the stable anchor points by which other stars are classified.', NULL, NULL);
INSERT INTO public.star VALUES (5, 5, 'Suhail', 'Lambda Velorum (λ Velorum, abbreviated Lambda Vel, λ Vel), officially named Suhail /ˈsuːheɪl/,[10] is a star in the southern constellation of Vela. With a mean apparent visual magnitude of 2.21,[2] this is the third-brightest star in the constellation and one of the brighter stars in the sky. The distance to this star can be measured directly using the parallax technique, yielding an estimated 545 light-years (167 parsecs) from the Sun.', NULL, NULL);
INSERT INTO public.star VALUES (4, 6, 'Sun', 'The Sun is the star at the center of the Solar System. It is a massive, hot ball of plasma, inflated and heated by energy produced by nuclear fusion reactions at its core. Part of this internal energy is emitted from its surface as light, ultraviolet, and infrared radiation, providing most of the energy for life on Earth.', 8, NULL);
INSERT INTO public.star VALUES (2, 7, 'Arcturus', 'Arcturus is the brightest star in the northern constellation of Boötes. With an apparent visual magnitude of -0.05,[2] it is the fourth-brightest star in the night sky, and the brightest in the northern celestial hemisphere.', NULL, NULL);
INSERT INTO public.star VALUES (3, 8, 'Canopus', 'Canopus is the brightest star in the southern constellation of Carina and the second-brightest star in the night sky. It is also designated α Carinae, which is romanized (transliterated) to Alpha Carinae. With a visual apparent magnitude of −0.74, it is outshone only by Sirius.', NULL, NULL);
INSERT INTO public.star VALUES (1, 9, 'Wezen', 'Delta Canis Majoris (Latinised from δ Canis Majoris, abbreviated Delta CMa, δ CMa), officially named Wezen /ˈwiːzən/,[10] is a star in the constellation of Canis Major. It is a yellow-white F-type supergiant with an apparent magnitude of +1.83. Since 1943, the spectrum of this star has served as one of the stable anchor points by which other stars are classified.', NULL, NULL);
INSERT INTO public.star VALUES (5, 10, 'Suhail', 'Lambda Velorum (λ Velorum, abbreviated Lambda Vel, λ Vel), officially named Suhail /ˈsuːheɪl/,[10] is a star in the southern constellation of Vela. With a mean apparent visual magnitude of 2.21,[2] this is the third-brightest star in the constellation and one of the brighter stars in the sky. The distance to this star can be measured directly using the parallax technique, yielding an estimated 545 light-years (167 parsecs) from the Sun.', NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_planet_galaxy_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_col_key UNIQUE (unique_col);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_col_key UNIQUE (unique_col);


--
-- Name: planet_galaxy planet_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_name_key UNIQUE (name);


--
-- Name: planet_galaxy planet_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_pkey PRIMARY KEY (planet_galaxy_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_col_key UNIQUE (unique_col);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_col_key UNIQUE (unique_col);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_galaxy planet_galaxy_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_galaxy planet_galaxy_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

