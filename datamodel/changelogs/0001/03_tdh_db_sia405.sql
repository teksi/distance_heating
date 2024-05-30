------ This file generates the postgres database (Modul fernwaerme (based on SIA405_FERNWAERME_3D_2015_LV95 (Version 20.10.2021) in en for QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 30.05.2024 21:01:35
------ with 3D coordinates
BEGIN;

---- 03_tdh_db_dss.sql ----------



-------
CREATE TABLE tdh_od.pipe_section
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_pipe_section_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_pipe_section_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE tdh_od.pipe_section ALTER COLUMN obj_id SET DEFAULT tdh_sys.generate_oid('tdh_od','pipe_section');
COMMENT ON COLUMN tdh_od.pipe_section.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN name_number text;
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT ps_name_number_length_max_40 CHECK(char_length(name_number)<=40);
COMMENT ON COLUMN tdh_od.pipe_section.name_number IS '';
-- ALTER TABLE tdh_od.pipe_section ADD COLUMN geometry_geometry geometry('COMPOUNDCURVE', :SRID);
-- CREATE INDEX in_tdh_pipe_section_geometry_geometry ON tdh_od.pipe_section USING gist (geometry_geometry );
-- COMMENT ON COLUMN tdh_od.pipe_section.geometry_geometry IS ' / avec points d’appuis en coordonnées nationales [mm]';
ALTER TABLE tdh_od.pipe_section ADD COLUMN geometry3d_geometry geometry('COMPOUNDCURVEZ', :SRID);
CREATE INDEX in_tdh_pipe_section_geometry3d_geometry ON tdh_od.pipe_section USING gist (geometry3d_geometry );
COMMENT ON COLUMN tdh_od.pipe_section.geometry3d_geometry IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.horizontal_positioning IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN status  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.status IS 'Operating and planning status of the structure / Betriebs- bzw. Planungszustand des Bauwerks / Etat de fonctionnement et de planification de l’ouvrage';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN function  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.function IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN pipe_type  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.pipe_type IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN fluent  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.fluent IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN temperature  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.temperature IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN nominal_pressure  smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.nominal_pressure IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN operating_pressure  smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.operating_pressure IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN insulation_thickness  smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.insulation_thickness IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN insulation_kind  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.insulation_kind IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN coating  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.coating IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN diameter_inner  smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.diameter_inner IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN diameter_outer  smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.diameter_outer IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN nominal_diameter text;
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT ps_nominal_diameter_length_max_10 CHECK(char_length(nominal_diameter)<=10);
COMMENT ON COLUMN tdh_od.pipe_section.nominal_diameter IS 'yyy_als TEXT, da zum Teil auch Doppelwerte mit Schrägstrich (eg. 1500/800) / als TEXT, da zum Teil auch Doppelwerte mit Schrägstrich (z.B. 1500/800) / comme TEXTE, parcequ''on a aussi des valeurs doubles (par example 1500/800)';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN length1  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.length1 IS 'yyy_Laenge_abgewickelt / Laenge_abgewickelt / longueur développée';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN length2  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.length2 IS 'yyy_Laenge_berechnet / Laenge_berechnet / longueur calculée';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN pipe_brand text;
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT ps_pipe_brand_length_max_40 CHECK(char_length(pipe_brand)<=40);
COMMENT ON COLUMN tdh_od.pipe_section.pipe_brand IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN pipeline_quality  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.pipeline_quality IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN installation_year  smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.installation_year IS '';
 -- Attribute with relation to class organisation - relation will be added instead of text attribute
 -- ALTER TABLE tdh_od.pipe_section ADD COLUMN owner text;
-- COMMENT ON COLUMN tdh_od.pipe_section.owner IS '';
 -- Attribute with relation to class organisation - relation will be added instead of text attribute
 -- ALTER TABLE tdh_od.pipe_section ADD COLUMN pipeline_company text;
-- COMMENT ON COLUMN tdh_od.pipe_section.pipeline_company IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN documentation text;
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT ps_documentation_length_max_40 CHECK(char_length(documentation)<=40);
COMMENT ON COLUMN tdh_od.pipe_section.documentation IS 'yyy_Zeichnungsnummer / Dossiernummer / Zeichnungsnummer / Dossiernummer / numéro de dessin / numéro de dossier';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN mandate text;
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT ps_mandate_length_max_40 CHECK(char_length(mandate)<=40);
COMMENT ON COLUMN tdh_od.pipe_section.mandate IS 'zzz_désignation du mandat / Bezeichnung des Auftrags / désignation du mandat';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN remark text;
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT ps_remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN tdh_od.pipe_section.remark IS 'General remarks';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.pipe_section.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN tdh_od.pipe_section.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN tdh_od.pipe_section.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_pipe_section
BEFORE UPDATE OR INSERT ON
 tdh_od.pipe_section
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified();

-------
-------
CREATE TABLE tdh_od.pipe_point
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_pipe_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_pipe_point_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE tdh_od.pipe_point ALTER COLUMN obj_id SET DEFAULT tdh_sys.generate_oid('tdh_od','pipe_point');
COMMENT ON COLUMN tdh_od.pipe_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
--ALTER TABLE tdh_od.pipe_point ADD COLUMN geometry_geometry geometry('POINT', :SRID);
-- CREATE INDEX in_tdh_pipe_point_geometry_geometry ON tdh_od.pipe_point USING gist (geometry_geometry );
-- COMMENT ON COLUMN tdh_od.pipe_point.geometry_geometry IS '';
ALTER TABLE tdh_od.pipe_point ADD COLUMN geometry3d_geometry geometry('POINTZ', :SRID);
CREATE INDEX in_tdh_pipe_point_geometry3d_geometry ON tdh_od.pipe_point USING gist (geometry3d_geometry );
COMMENT ON COLUMN tdh_od.pipe_point.geometry3d_geometry IS '';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN symbolori  decimal(4,1) ;
COMMENT ON COLUMN tdh_od.pipe_point.symbolori IS 'Default: 90 degree';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN tdh_od.pipe_point.horizontal_positioning IS '';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN altitude1  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.pipe_point.altitude1 IS ' / OK Mantelrohr / bord supérieur tube préisolé';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN altitude2  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.pipe_point.altitude2 IS 'yyy_Rohrachse / Rohrachse / axe du tube';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN elevation_determination  integer ;
COMMENT ON COLUMN tdh_od.pipe_point.elevation_determination IS '';
 -- Attribute with relation to class organisation - relation will be added instead of text attribute
 -- ALTER TABLE tdh_od.pipe_point ADD COLUMN owner text;
-- COMMENT ON COLUMN tdh_od.pipe_point.owner IS '';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN remark text;
 ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT pp_remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN tdh_od.pipe_point.remark IS 'General remarks';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.pipe_point.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN tdh_od.pipe_point.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE tdh_od.pipe_point ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN tdh_od.pipe_point.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_pipe_point
BEFORE UPDATE OR INSERT ON
 tdh_od.pipe_point
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified();

-------
-------
CREATE TABLE tdh_od.pipe_point_normal
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_pipe_point_normal_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_pipe_point_normal_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE tdh_od.pipe_point_normal ALTER COLUMN obj_id SET DEFAULT tdh_sys.generate_oid('tdh_od','pipe_point_normal');
COMMENT ON COLUMN tdh_od.pipe_point_normal.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.pipe_point_normal ADD COLUMN kind  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_normal.kind IS '';
 ALTER TABLE tdh_od.pipe_point_normal ADD COLUMN armature_setting  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_normal.armature_setting IS '';
 ALTER TABLE tdh_od.pipe_point_normal ADD COLUMN material  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_normal.material IS '';
-------
CREATE TRIGGER
update_last_modified_pipe_point_normal
BEFORE UPDATE OR INSERT ON
 tdh_od.pipe_point_normal
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified_parent("tdh_od.pipe_point");

-------
-------
CREATE TABLE tdh_od.pipe_point_feed
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_pipe_point_feed_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_pipe_point_feed_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE tdh_od.pipe_point_feed ALTER COLUMN obj_id SET DEFAULT tdh_sys.generate_oid('tdh_od','pipe_point_feed');
COMMENT ON COLUMN tdh_od.pipe_point_feed.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN kind  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.kind IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN power_output_ordered  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.power_output_ordered IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN power_output_installed  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.power_output_installed IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN aperture_value  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.aperture_value IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN q_subscribed  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.q_subscribed IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN category  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.category IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN start_year  smallint ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.start_year IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN reconstruction  smallint ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.reconstruction IS '';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN pressure  smallint ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.pressure IS ' / Primaerer_Konstruktionsdruck (bar_Ue) / pression de construction primaire [bar]';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN flow_temperature  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.flow_temperature IS ' / température';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN return_flow_temperature  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.return_flow_temperature IS ' / température';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN heated_volume  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.heated_volume IS 'yyy_Beheiztes Volumen / Beheiztes Volumen / xxx_Beheiztes Volumen';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN heat_consumption  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.heat_consumption IS 'per year / Pro Jahr / par année';
 ALTER TABLE tdh_od.pipe_point_feed ADD COLUMN power_output  integer ;
COMMENT ON COLUMN tdh_od.pipe_point_feed.power_output IS '';
-------
CREATE TRIGGER
update_last_modified_pipe_point_feed
BEFORE UPDATE OR INSERT ON
 tdh_od.pipe_point_feed
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified_parent("tdh_od.pipe_point");

-------
-------
CREATE TABLE tdh_od.structure
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_structure_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE tdh_od.structure ALTER COLUMN obj_id SET DEFAULT tdh_sys.generate_oid('tdh_od','structure');
COMMENT ON COLUMN tdh_od.structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.structure ADD COLUMN name_number text;
 ALTER TABLE tdh_od.structure ADD CONSTRAINT st_name_number_length_max_40 CHECK(char_length(name_number)<=40);
COMMENT ON COLUMN tdh_od.structure.name_number IS ' / z.B. Bauwerksname / par ex. nom de l’ouvrage';
-- ALTER TABLE tdh_od.structure ADD COLUMN geometry_geometry geometry('CURVEPOLYGON', :SRID);
-- CREATE INDEX in_tdh_structure_geometry_geometry ON tdh_od.structure USING gist (geometry_geometry );
-- COMMENT ON COLUMN tdh_od.structure.geometry_geometry IS ' / offener oder geschlossener Linienzug, Stützpunkte in Landeskoordinaten / polyligne ouverte ou fermée avec des points d’appui en coordonnées nationales';
ALTER TABLE tdh_od.structure ADD COLUMN geometry3d_geometry geometry('CURVEPOLYGONZ', :SRID);
CREATE INDEX in_tdh_structure_geometry3d_geometry ON tdh_od.structure USING gist (geometry3d_geometry );
COMMENT ON COLUMN tdh_od.structure.geometry3d_geometry IS 'yyyy_geschlossener Linienzug, Stützpunkte in Landeskoordinaten / geschlossener Linienzug, Stützpunkte in Landeskoordinaten / polyligne fermée avec points d’appui en coordonnées nationales';
 ALTER TABLE tdh_od.structure ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN tdh_od.structure.horizontal_positioning IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN status  integer ;
COMMENT ON COLUMN tdh_od.structure.status IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN network_area text;
 ALTER TABLE tdh_od.structure ADD CONSTRAINT st_network_area_length_max_40 CHECK(char_length(network_area)<=40);
COMMENT ON COLUMN tdh_od.structure.network_area IS ' / Ortsbezeichnung / désignation du lieu';
 ALTER TABLE tdh_od.structure ADD COLUMN kind  integer ;
COMMENT ON COLUMN tdh_od.structure.kind IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN structure_sur_plus_cover  decimal(4,1) ;
COMMENT ON COLUMN tdh_od.structure.structure_sur_plus_cover IS ' / Mittlere Überdeckung / valeur moyenne de l’objet';
 ALTER TABLE tdh_od.structure ADD COLUMN installation_year  smallint ;
COMMENT ON COLUMN tdh_od.structure.installation_year IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN venting  integer ;
COMMENT ON COLUMN tdh_od.structure.venting IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN discharge_type  integer ;
COMMENT ON COLUMN tdh_od.structure.discharge_type IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN grid_type  integer ;
COMMENT ON COLUMN tdh_od.structure.grid_type IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN drainage_pump  integer ;
COMMENT ON COLUMN tdh_od.structure.drainage_pump IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN power_connection  integer ;
COMMENT ON COLUMN tdh_od.structure.power_connection IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN measuring_system  integer ;
COMMENT ON COLUMN tdh_od.structure.measuring_system IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN condition  integer ;
COMMENT ON COLUMN tdh_od.structure.condition IS '';
 -- Attribute with relation to class organisation - relation will be added instead of text attribute
 -- ALTER TABLE tdh_od.structure ADD COLUMN owner text;
-- COMMENT ON COLUMN tdh_od.structure.owner IS '';
 -- Attribute with relation to class organisation - relation will be added instead of text attribute
 -- ALTER TABLE tdh_od.structure ADD COLUMN construction_company text;
-- COMMENT ON COLUMN tdh_od.structure.construction_company IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN schema_indication text;
 ALTER TABLE tdh_od.structure ADD CONSTRAINT st_schema_indication_length_max_40 CHECK(char_length(schema_indication)<=40);
COMMENT ON COLUMN tdh_od.structure.schema_indication IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN last_maintenance  timestamp without time zone ;
COMMENT ON COLUMN tdh_od.structure.last_maintenance IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN documentation text;
 ALTER TABLE tdh_od.structure ADD CONSTRAINT st_documentation_length_max_40 CHECK(char_length(documentation)<=40);
COMMENT ON COLUMN tdh_od.structure.documentation IS ' / z.B. Dossiernummer / par ex. numéro de dossier';
 ALTER TABLE tdh_od.structure ADD COLUMN mandate text;
 ALTER TABLE tdh_od.structure ADD CONSTRAINT st_mandate_length_max_40 CHECK(char_length(mandate)<=40);
COMMENT ON COLUMN tdh_od.structure.mandate IS ' / z.B. Auftragsnummer / par ex. numéro du mandat';
 ALTER TABLE tdh_od.structure ADD COLUMN pps text;
 ALTER TABLE tdh_od.structure ADD CONSTRAINT st_pps_length_max_40 CHECK(char_length(pps)<=40);
COMMENT ON COLUMN tdh_od.structure.pps IS 'Power plant marking system no. / Kraftwerk Kennzeichnung System Nr. / n° du système d’identification des centrales';
 ALTER TABLE tdh_od.structure ADD COLUMN remark text;
 ALTER TABLE tdh_od.structure ADD CONSTRAINT st_remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN tdh_od.structure.remark IS 'General remarks';
 ALTER TABLE tdh_od.structure ADD COLUMN upper_elevation  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.structure.upper_elevation IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN depth  smallint ;
COMMENT ON COLUMN tdh_od.structure.depth IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN bottom_level  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.structure.bottom_level IS '';
 ALTER TABLE tdh_od.structure ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.structure.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE tdh_od.structure ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN tdh_od.structure.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE tdh_od.structure ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN tdh_od.structure.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_structure
BEFORE UPDATE OR INSERT ON
 tdh_od.structure
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified();

-------
-- corresponding structure_line table
CREATE TABLE tdh_od.structure_line
(
   id uuid NOT NULL DEFAULT uuid_generate_v4(),
   CONSTRAINT pkey_tdh_od_structure_line_id PRIMARY KEY (id)
);
-- ALTER TABLE tdh_od.structure_line ADD COLUMN geometry_geometry geometry('COMPOUNDCURVE', :SRID);
-- COMMENT ON COLUMN tdh_od.structure_line.geometry_geometry IS '';
--CREATE INDEX in_tdh_structure_line_geometry_geometry ON tdh_od.structure_line USING gist (geometry_geometry );
ALTER TABLE tdh_od.structure_line ADD COLUMN geometry3d_geometry geometry('COMPOUNDCURVEZ', :SRID);
CREATE INDEX in_tdh_structure_line_geometry3d_geometry ON tdh_od.structure_line USING gist (geometry3d_geometry );
ALTER TABLE tdh_od.structure_line ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.structure_line.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
-------
CREATE TRIGGER
update_last_modified_structure_line
BEFORE UPDATE OR INSERT ON
 tdh_od.structure_line
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified();
-------

ALTER TABLE tdh_od.structure_line ADD COLUMN fk_structure varchar(16);
ALTER TABLE tdh_od.structure_line ADD CONSTRAINT rel_structure_line_structure FOREIGN KEY (fk_structure) REFERENCES tdh_od.structure(obj_id) ON UPDATE CASCADE ON DELETE CASCADE;

-------
CREATE TABLE tdh_od.trench
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_trench_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_trench_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE tdh_od.trench ALTER COLUMN obj_id SET DEFAULT tdh_sys.generate_oid('tdh_od','trench');
COMMENT ON COLUMN tdh_od.trench.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.trench ADD COLUMN name_number text;
 ALTER TABLE tdh_od.trench ADD CONSTRAINT tr_name_number_length_max_40 CHECK(char_length(name_number)<=40);
COMMENT ON COLUMN tdh_od.trench.name_number IS ' / Eindeutige Bezeichnung / désignation univoque';
-- ALTER TABLE tdh_od.trench ADD COLUMN geometry_geometry geometry('CURVEPOLYGON', :SRID);
-- CREATE INDEX in_tdh_trench_geometry_geometry ON tdh_od.trench USING gist (geometry_geometry );
-- COMMENT ON COLUMN tdh_od.trench.geometry_geometry IS 'yyy_offener oder geschlossener Linienzug, Stützpunkte in Landeskoordinaten / offener oder geschlossener Linienzug, Stützpunkte in Landeskoordinaten / polyligne ouverte ou fermée avec des points d’appui en coordonnées nationales';
ALTER TABLE tdh_od.trench ADD COLUMN geometry3d_geometry geometry('CURVEPOLYGONZ', :SRID);
CREATE INDEX in_tdh_trench_geometry3d_geometry ON tdh_od.trench USING gist (geometry3d_geometry );
COMMENT ON COLUMN tdh_od.trench.geometry3d_geometry IS 'yyyy_offener oder geschlossener Linienzug, Stützpunkte in Landeskoordinaten / offener oder geschlossener Linienzug, Stützpunkte in Landeskoordinaten / polyligne fermée ou ouverte avec des points d’appui en coordonnées nationales';
 ALTER TABLE tdh_od.trench ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN tdh_od.trench.horizontal_positioning IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN status  integer ;
COMMENT ON COLUMN tdh_od.trench.status IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN trench_type  integer ;
COMMENT ON COLUMN tdh_od.trench.trench_type IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN trench_width  smallint ;
COMMENT ON COLUMN tdh_od.trench.trench_width IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN installation_year  smallint ;
COMMENT ON COLUMN tdh_od.trench.installation_year IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN embedding  integer ;
COMMENT ON COLUMN tdh_od.trench.embedding IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN control_system  integer ;
COMMENT ON COLUMN tdh_od.trench.control_system IS '';
 -- Attribute with relation to class organisation - relation will be added instead of text attribute
 -- ALTER TABLE tdh_od.trench ADD COLUMN owner text;
-- COMMENT ON COLUMN tdh_od.trench.owner IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN cable_conduits  integer ;
COMMENT ON COLUMN tdh_od.trench.cable_conduits IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN construction_company text;
 ALTER TABLE tdh_od.trench ADD CONSTRAINT tr_construction_company_length_max_40 CHECK(char_length(construction_company)<=40);
COMMENT ON COLUMN tdh_od.trench.construction_company IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN repair  timestamp without time zone ;
COMMENT ON COLUMN tdh_od.trench.repair IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN documentation text;
 ALTER TABLE tdh_od.trench ADD CONSTRAINT tr_documentation_length_max_40 CHECK(char_length(documentation)<=40);
COMMENT ON COLUMN tdh_od.trench.documentation IS '';
 ALTER TABLE tdh_od.trench ADD COLUMN mandate text;
 ALTER TABLE tdh_od.trench ADD CONSTRAINT tr_mandate_length_max_40 CHECK(char_length(mandate)<=40);
COMMENT ON COLUMN tdh_od.trench.mandate IS ' / z.B. Auftragsnummer / par ex. numéro du mandat';
 ALTER TABLE tdh_od.trench ADD COLUMN remark text;
 ALTER TABLE tdh_od.trench ADD CONSTRAINT tr_remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN tdh_od.trench.remark IS 'General remarks';
 ALTER TABLE tdh_od.trench ADD COLUMN depth  smallint ;
COMMENT ON COLUMN tdh_od.trench.depth IS 'yyy_Mächtigkeit (Höhe) eines Objektes [mm]. Differenz Sohlenkote minus Deckenkote. Vorzeichen abhängig von der Referenzebenen / Referenzpunkt des LKObjektes. / Mächtigkeit (Höhe) eines Objektes [mm]. Differenz Sohlenkote minus Deckenkote. Vorzeichen abhängig von der Referenzebenen / Referenzpunkt des LKObjektes. / xxx_Mächtigkeit (Höhe) eines Objektes [mm]. Differenz Sohlenkote minus Deckenkote. Vorzeichen abhängig von der Referenzebenen / Referenzpunkt des LKObjektes.';
 ALTER TABLE tdh_od.trench ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.trench.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE tdh_od.trench ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN tdh_od.trench.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE tdh_od.trench ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN tdh_od.trench.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_trench
BEFORE UPDATE OR INSERT ON
 tdh_od.trench
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified();

-------
-- corresponding trench_line table
CREATE TABLE tdh_od.trench_line
(
   id uuid NOT NULL DEFAULT uuid_generate_v4(),
   CONSTRAINT pkey_tdh_od_trench_line_id PRIMARY KEY (id)
);
-- ALTER TABLE tdh_od.trench_line ADD COLUMN geometry_geometry geometry('COMPOUNDCURVE', :SRID);
-- COMMENT ON COLUMN tdh_od.trench_line.geometry_geometry IS '';
--CREATE INDEX in_tdh_trench_line_geometry_geometry ON tdh_od.trench_line USING gist (geometry_geometry );
ALTER TABLE tdh_od.trench_line ADD COLUMN geometry3d_geometry geometry('COMPOUNDCURVEZ', :SRID);
CREATE INDEX in_tdh_trench_line_geometry3d_geometry ON tdh_od.trench_line USING gist (geometry3d_geometry );
ALTER TABLE tdh_od.trench_line ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.trench_line.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
-------
CREATE TRIGGER
update_last_modified_trench_line
BEFORE UPDATE OR INSERT ON
 tdh_od.trench_line
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified();
-------

ALTER TABLE tdh_od.trench_line ADD COLUMN fk_trench varchar(16);
ALTER TABLE tdh_od.trench_line ADD CONSTRAINT rel_trench_line_trench FOREIGN KEY (fk_trench) REFERENCES tdh_od.trench(obj_id) ON UPDATE CASCADE ON DELETE CASCADE;

-------
CREATE TABLE tdh_od.trench_point
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_trench_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_trench_point_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE tdh_od.trench_point ALTER COLUMN obj_id SET DEFAULT tdh_sys.generate_oid('tdh_od','trench_point');
COMMENT ON COLUMN tdh_od.trench_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.trench_point ADD COLUMN name_number text;
 ALTER TABLE tdh_od.trench_point ADD CONSTRAINT tp_name_number_length_max_40 CHECK(char_length(name_number)<=40);
COMMENT ON COLUMN tdh_od.trench_point.name_number IS ' / désignation univoque';
--ALTER TABLE tdh_od.trench_point ADD COLUMN geometry_geometry geometry('POINT', :SRID);
-- CREATE INDEX in_tdh_trench_point_geometry_geometry ON tdh_od.trench_point USING gist (geometry_geometry );
-- COMMENT ON COLUMN tdh_od.trench_point.geometry_geometry IS '';
ALTER TABLE tdh_od.trench_point ADD COLUMN geometry3d_geometry geometry('POINTZ', :SRID);
CREATE INDEX in_tdh_trench_point_geometry3d_geometry ON tdh_od.trench_point USING gist (geometry3d_geometry );

 ALTER TABLE tdh_od.trench_point ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN tdh_od.trench_point.horizontal_positioning IS '';
 ALTER TABLE tdh_od.trench_point ADD COLUMN kind  integer ;
COMMENT ON COLUMN tdh_od.trench_point.kind IS '';
 ALTER TABLE tdh_od.trench_point ADD COLUMN altitude_channel_bottom  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.trench_point.altitude_channel_bottom IS '';
 ALTER TABLE tdh_od.trench_point ADD COLUMN altitude_channel_cover  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.trench_point.altitude_channel_cover IS '';
 ALTER TABLE tdh_od.trench_point ADD COLUMN altitude_entry_cover  decimal(7,3) ;
COMMENT ON COLUMN tdh_od.trench_point.altitude_entry_cover IS '';
 ALTER TABLE tdh_od.trench_point ADD COLUMN sur_plus_cover  decimal(4,1) ;
COMMENT ON COLUMN tdh_od.trench_point.sur_plus_cover IS '';
 ALTER TABLE tdh_od.trench_point ADD COLUMN elevation_determination  integer ;
COMMENT ON COLUMN tdh_od.trench_point.elevation_determination IS '';
 -- Attribute with relation to class organisation - relation will be added instead of text attribute
 -- ALTER TABLE tdh_od.trench_point ADD COLUMN owner text;
-- COMMENT ON COLUMN tdh_od.trench_point.owner IS '';
 ALTER TABLE tdh_od.trench_point ADD COLUMN remark text;
 ALTER TABLE tdh_od.trench_point ADD CONSTRAINT tp_remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN tdh_od.trench_point.remark IS 'General remarks';
 ALTER TABLE tdh_od.trench_point ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN tdh_od.trench_point.dimension1 IS 'yyy_Dimension1 für Schachtöffnung, Montageeinstieg / Dimension1 für Schachtöffnung, Montageeinstieg / pour chambre d’accès et ouverture de montage';
 ALTER TABLE tdh_od.trench_point ADD COLUMN depth  smallint ;
COMMENT ON COLUMN tdh_od.trench_point.depth IS 'yyy_Funktionsattribut Mächtigkeit (Höhe) eines Objektes [mm]. Vorzeichen abhängig von der Referenzebenen / Referenzpunkt des LKObjektes. / Funktionsattribut Mächtigkeit (Höhe) eines Objektes [mm]. Vorzeichen abhängig von der Referenzebenen / Referenzpunkt des LKObjektes. / xxx_ALTITUDE_REGARD_CANIVEAU moins ALTITUDE_RADIER_CANIVEAU pour ventilation, drainage et points fixes fonction (valeur calculée) = ALTITUDE_REGARD_ACCES moins ALTITUDE_REGARD_CANIVEAU pour chambre d’accès et ouverture demontage';
 ALTER TABLE tdh_od.trench_point ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.trench_point.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE tdh_od.trench_point ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN tdh_od.trench_point.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE tdh_od.trench_point ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN tdh_od.trench_point.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_trench_point
BEFORE UPDATE OR INSERT ON
 tdh_od.trench_point
FOR EACH ROW EXECUTE PROCEDURE
 tdh_sys.update_last_modified();

-------
------------ Relationships and Value Tables ----------- ;
-- Class tdh_od.hydraulic_line_section is not yet supported and therefore relation is commented out
-- ALTER TABLE tdh_od.pipe_section ADD COLUMN fk_hydraulic_line_section varchar(16);
-- ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT rel_pipe_section_hydraulic_line_section FOREIGN KEY (fk_hydraulic_line_section) REFERENCES tdh_od.hydraulic_line_section(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
-- Class tdh_od.static_line_section is not yet supported and therefore relation is commented out
-- ALTER TABLE tdh_od.pipe_section ADD COLUMN fk_static_line_section varchar(16);
-- ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT rel_pipe_section_static_line_section FOREIGN KEY (fk_static_line_section) REFERENCES tdh_od.static_line_section(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.pipe_section ADD COLUMN fk_owner varchar(16);
ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT rel_pipe_section_owner FOREIGN KEY (fk_owner) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.pipe_section ADD COLUMN fk_pipeline_company varchar(16);
ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT rel_pipe_section_pipeline_company FOREIGN KEY (fk_pipeline_company) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE tdh_vl.pipe_section_horizontal_positioning () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_horizontal_positioning ADD CONSTRAINT pkey_tdh_vl_pipe_section_horizontal_positioning_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8008,8008,'accurate','genau','precise', 'precisa', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8006,8006,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8007,8007,'inaccurate','ungenau','imprecise', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES tdh_vl.pipe_section_horizontal_positioning (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_section_status () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_status ADD CONSTRAINT pkey_tdh_vl_pipe_section_status_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9470,9470,'inoperative','ausser_Betrieb','hors_service', 'fuori_servizio', 'rrr_ausser_Betrieb', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8011,8011,'inoperative.reserve','ausser_Betrieb.Reserve','hors_service.en_reserve', 'fuori_servizio.riserva', 'rrr_ausser_Betrieb.Reserve', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9471,9471,'operational','in_Betrieb','en_service', 'in_funzione', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8013,8013,'operational.tentative','in_Betrieb.provisorisch','en_service.provisoire', 'in_funzione.provvisorio', 'functionala.provizoriu', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8014,8014,'dead','tot','abandonne', 'zzz_tot', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8015,8015,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8016,8016,'other.planned','weitere.geplant','autre.planifie', 'altro.previsto', 'rrr_weitere.geplant', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8017,8017,'other.project','weitere.Projekt','autre.projet', 'altro.progetto', 'alta.proiect', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_status FOREIGN KEY (status)
 REFERENCES tdh_vl.pipe_section_status (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_section_function () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_function ADD CONSTRAINT pkey_tdh_vl_pipe_section_function_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8021,8021,'connection_pipe','Anschlussleitung','conduite_de_raccordement', 'condotta_raccordo', 'rrr_Anschlussleitung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8019,8019,'transport_pipe','Transportleitung','conduite_de_transport', 'zzz_Transportleitung', 'rrr_Transportleitung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8020,8020,'supply_pipe','Versorgungsleitung','conduite_de_distribution', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_function FOREIGN KEY (function)
 REFERENCES tdh_vl.pipe_section_function (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_section_pipe_type () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_pipe_type ADD CONSTRAINT pkey_tdh_vl_pipe_section_pipe_type_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_pipe_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8024,8024,'return_flow','Ruecklauf','retour', 'zzz_Ruecklauf', 'rrr_Ruecklauf', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_pipe_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8023,8023,'flow_pipe','Vorlauf','aller', 'zzz_Vorlauf', 'rrr_Vorlauf', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_pipe_type FOREIGN KEY (pipe_type)
 REFERENCES tdh_vl.pipe_section_pipe_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_section_fluent () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_fluent ADD CONSTRAINT pkey_tdh_vl_pipe_section_fluent_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_fluent (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8028,8028,'steam','Dampf','vapeur', 'zzz_Dampf', 'rrr_Dampf', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_fluent (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8026,8026,'hot_water','Heisswasser','eau_surchauffee', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_fluent (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8029,8029,'condensate','Kondensat','condensat', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_fluent (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8027,8027,'warm_water','Warmwasser','eau_chaude', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_fluent (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8030,8030,'others','weitere','autre', 'di_piu', 'rrr_altul', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_fluent FOREIGN KEY (fluent)
 REFERENCES tdh_vl.pipe_section_fluent (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_section_insulation_kind () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_insulation_kind ADD CONSTRAINT pkey_tdh_vl_pipe_section_insulation_kind_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_insulation_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8041,8041,'glass_or_rock_wool','Glas_oder_Steinwolle','laine_de_verre_ou_de_roche', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_insulation_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8040,8040,'channel_individual_insulation','Kanal_Einzelisolation','caniveau_isolation_individuelle', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_insulation_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8042,8042,'channel_loose_fill_insulation_glass_wool','Kanal_Stopfisolation_Glaswolle','caniveau_remplissage_bourre_laine_verre', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_insulation_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8044,8044,'vacuum','Vakuum','vide', 'zzz_Vakuum', 'rrr_Vakuum', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_insulation_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8043,8043,'bonded_pipe_system','Verbundmantelrohre','tube_preisole', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_insulation_kind FOREIGN KEY (insulation_kind)
 REFERENCES tdh_vl.pipe_section_insulation_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_section_coating () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_coating ADD CONSTRAINT pkey_tdh_vl_pipe_section_coating_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8048,8048,'aluminum','Aluminium','aluminium', 'zzz_Aluminium', 'rrr_Aluminium', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8053,8053,'strip','Band','bande', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8052,8052,'sheet_galvanized','Blech_verzinkt','tole_zinguee', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8051,8051,'chrome_steel','Chromstahl','acier_inoxydable', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8050,8050,'roofing_felt','Dachpappe','carton_bitume', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8049,8049,'fiber_cement','Faserzement','fibrociment', 'fibrocemento', 'fibrociment', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8047,8047,'polyethylene','Polyethylen','PE', 'polietilene', 'rrr_Polyethylen', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8046,8046,'PVC','Polyvinilchlorid','PVC', 'zzz_Polyvinilchlorid', 'PVC', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_coating (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8054,8054,'steel_tube','Stahlrohr','tube_acier', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_coating FOREIGN KEY (coating)
 REFERENCES tdh_vl.pipe_section_coating (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_section_pipeline_quality () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_pipeline_quality ADD CONSTRAINT pkey_tdh_vl_pipe_section_pipeline_quality_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_pipeline_quality (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8074,8074,'chrome_steel','Chromstahl','acier_chrome', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_pipeline_quality (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8073,8073,'plastic','Kunststoff','matiere_synthetique', 'materiale_sintetico', 'materie_sintetica', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_pipeline_quality (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8072,8072,'copper','Kupfer','cuivre', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_pipeline_quality (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8068,8068,'steel_35','Stahl_35','acier_35', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_pipeline_quality (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8069,8069,'steel_35_8','Stahl_35_8','acier_35_8', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_pipeline_quality (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8070,8070,'steel_37','Stahl_37','acier_37', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_pipeline_quality (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8071,8071,'steel_52','Stahl_52','acier_52', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_pipeline_quality FOREIGN KEY (pipeline_quality)
 REFERENCES tdh_vl.pipe_section_pipeline_quality (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
-- Class tdh_od.hydraulic_node is not yet supported and therefore relation is commented out
-- ALTER TABLE tdh_od.pipe_point ADD COLUMN fk_hydraulic_node varchar(16);
-- ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT rel_pipe_point_hydraulic_node FOREIGN KEY (fk_hydraulic_node) REFERENCES tdh_od.hydraulic_node(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
-- Class tdh_od.static_node is not yet supported and therefore relation is commented out
-- ALTER TABLE tdh_od.pipe_point ADD COLUMN fk_static_node varchar(16);
-- ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT rel_pipe_point_static_node FOREIGN KEY (fk_static_node) REFERENCES tdh_od.static_node(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.pipe_point ADD COLUMN fk_owner varchar(16);
ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT rel_pipe_point_owner FOREIGN KEY (fk_owner) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE tdh_vl.pipe_point_horizontal_positioning () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_point_horizontal_positioning ADD CONSTRAINT pkey_tdh_vl_pipe_point_horizontal_positioning_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8094,8094,'accurate','genau','precise', 'precisa', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8092,8092,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8093,8093,'inaccurate','ungenau','imprecise', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT fkey_vl_pipe_point_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES tdh_vl.pipe_point_horizontal_positioning (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_point_elevation_determination () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_point_elevation_determination ADD CONSTRAINT pkey_tdh_vl_pipe_point_elevation_determination_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8102,8102,'accurate','genau','precis', 'preciso', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8100,8100,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8101,8101,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT fkey_vl_pipe_point_elevation_determination FOREIGN KEY (elevation_determination)
 REFERENCES tdh_vl.pipe_point_elevation_determination (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE tdh_od.pipe_point_normal ADD CONSTRAINT oorel_od_pipe_point_normal_pipe_point FOREIGN KEY (obj_id) REFERENCES tdh_od.pipe_point(obj_id) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE TABLE tdh_vl.pipe_point_normal_kind () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_point_normal_kind ADD CONSTRAINT pkey_tdh_vl_pipe_point_normal_kind_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8122,8122,'armatures.bypass','Armaturen.Bypass','armatures.bypass', 'zzz_Armaturen.Bypass', 'rrr_Armaturen.Bypass', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8127,8127,'armatures.installations.seperator','Armaturen.Einbauten.Abscheider','armatures.equipements.separateur', 'zzz_Armaturen.Einbauten.Abscheider', 'rrr_Armaturen.Einbauten.Abscheider', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8128,8128,'armatures.installations.condensate_seperator','Armaturen.Einbauten.Kondensatabscheider','armatures.equipements.separateur_de_condensats', 'zzz_Armaturen.Einbauten.Kondensatabscheider', 'rrr_Armaturen.Einbauten.Kondensatabscheider', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8126,8126,'armatures.installations.condenser','Armaturen.Einbauten.Kondenser','armatures.equipements.condenseur', 'zzz_Armaturen.Einbauten.Kondenser', 'rrr_Armaturen.Einbauten.Kondenser', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8129,8129,'armatures.installations.metal_hose','Armaturen.Einbauten.Metallschlauch','armatures.equipements.tuyeau_metallique', 'zzz_Armaturen.Einbauten.Metallschlauch', 'rrr_Armaturen.Einbauten.Metallschlauch', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8130,8130,'armatures.installations.station_valve','Armaturen.Einbauten.Stationsventil','armatures.equipements.vanne_de_reglage', 'zzz_Armaturen.Einbauten.Stationsventil', 'rrr_Armaturen.Einbauten.Stationsventil', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8120,8120,'armatures.emptying','Armaturen.Entleerung','armatures.vidange', 'zzz_Armaturen.Entleerung', 'rrr_Armaturen.Entleerung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8121,8121,'armatures.venting','Armaturen.Entlueftung','armatures.purge', 'zzz_Armaturen.Entlueftung', 'rrr_Armaturen.Entlueftung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8125,8125,'armatures.shaped_piece.arc','Armaturen.Formstuecke.Bogen','armatures.pieces_moulees.coude', 'zzz_Armaturen.Formstuecke.Bogen', 'rrr_Armaturen.Formstuecke.Bogen', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8123,8123,'armatures.shaped_piece.reduction','Armaturen.Formstuecke.Reduktion','armatures.pieces_moulees.reduction', 'zzz_Armaturen.Formstuecke.Reduktion', 'rrr_Armaturen.Formstuecke.Reduktion', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8124,8124,'armatures.shaped_piece.t_piece','Armaturen.Formstuecke.T_Stueck','armatures.pieces_moulees.te', 'zzz_Armaturen.Formstuecke.T_Stueck', 'rrr_Armaturen.Formstuecke.T_Stueck', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8114,8114,'armatures.flap_with_motor.with_remote_control','Armaturen.Klappe_mit_Motor.mit_Fernsteuerung','armatures.clapet_motorise.avec_commande_a_distance', 'zzz_Armaturen.Klappe_mit_Motor.mit_Fernsteuerung', 'rrr_Armaturen.Klappe_mit_Motor.mit_Fernsteuerung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8115,8115,'armatures.flap_with_motor.without_remote_control','Armaturen.Klappe_mit_Motor.ohne_Fernsteuerung','armatures.clapet_motorise.sans_commande_a_distance', 'zzz_Armaturen.Klappe_mit_Motor.ohne_Fernsteuerung', 'rrr_Armaturen.Klappe_mit_Motor.ohne_Fernsteuerung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8113,8113,'armatures.flap_without_motor','Armaturen.Klappe_ohne_Motor','armatures.clapet_non_motorise', 'zzz_Armaturen.Klappe_ohne_Motor', 'rrr_Armaturen.Klappe_ohne_Motor', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8135,8135,'armatures.pipe_point.orifice','Armaturen.Leitungspunkt.Blende','armatures.point_de_conduite.diaphragme', 'zzz_Armaturen.Leitungspunkt.Blende', 'rrr_Armaturen.Leitungspunkt.Blende', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8131,8131,'armatures.pipe_point.geometry_point','Armaturen.Leitungspunkt.Geometriepunkt','armatures.point_de_conduite.point_de_geometrie', 'zzz_Armaturen.Leitungspunkt.Geometriepunkt', 'rrr_Armaturen.Leitungspunkt.Geometriepunkt', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8133,8133,'armatures.pipe_point.change_of_material','Armaturen.Leitungspunkt.Materialwechsel','armatures.point_de_conduite.changement_de_materiau', 'zzz_Armaturen.Leitungspunkt.Materialwechsel', 'rrr_Armaturen.Leitungspunkt.Materialwechsel', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8134,8134,'armatures.pipe_point.sleeve','Armaturen.Leitungspunkt.Muffe','armatures.point_de_conduite.manchon', 'zzz_Armaturen.Leitungspunkt.Muffe', 'rrr_Armaturen.Leitungspunkt.Muffe', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8132,8132,'armatures.pipe_point.weld_seam','Armaturen.Leitungspunkt.Schweissnaht','armatures.point_de_conduite.soudure', 'zzz_Armaturen.Leitungspunkt.Schweissnaht', 'rrr_Armaturen.Leitungspunkt.Schweissnaht', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8116,8116,'armatures.backflow_flap','Armaturen.Rueckschlagklappe','armatures.clapet_anti_retour', 'zzz_Armaturen.Rueckschlagklappe', 'rrr_Armaturen.Rueckschlagklappe', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8111,8111,'armatures.valve_with_motor.with_remote_control','Armaturen.Schieber_mit_Motor.mit_Fernsteuerung','armatures.vanne_motorisee.avec_commande_a_distance', 'zzz_Armaturen.Schieber_mit_Motor.mit_Fernsteuerung', 'rrr_Armaturen.Schieber_mit_Motor.mit_Fernsteuerung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8112,8112,'armatures.valve_with_motor.without_remote_control','Armaturen.Schieber_mit_Motor.ohne_Fernsteuerung','armatures.vanne_motorisee.sans_commande_a_distance', 'zzz_Armaturen.Schieber_mit_Motor.ohne_Fernsteuerung', 'rrr_Armaturen.Schieber_mit_Motor.ohne_Fernsteuerung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8110,8110,'armatures.valve_without_motor','Armaturen.Schieber_ohne_Motor','armatures.vanne_non_motorisee', 'zzz_Armaturen.Schieber_ohne_Motor', 'rrr_Armaturen.Schieber_ohne_Motor', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8139,8139,'armatures.static_point.suspension','Armaturen.Statikpunkt.Aufhaengung','armatures.point_statique.suspension', 'zzz_Armaturen.Statikpunkt.Aufhaengung', 'rrr_Armaturen.Statikpunkt.Aufhaengung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8137,8137,'armatures.static_point.uplift_protection','Armaturen.Statikpunkt.Auftriebssicherung','armatures.point_statique.butee_superieure', 'zzz_Armaturen.Statikpunkt.Auftriebssicherung', 'rrr_Armaturen.Statikpunkt.Auftriebssicherung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8140,8140,'armatures.static_point.axial_compensator','Armaturen.Statikpunkt.Axialkompensator','armatures.point_statique.compensateur_axial', 'zzz_Armaturen.Statikpunkt.Axialkompensator', 'rrr_Armaturen.Statikpunkt.Axialkompensator', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8136,8136,'armatures.static_point.fixed_point','Armaturen.Statikpunkt.Fixpunkt','armatures.point_statique.point_fixe', 'zzz_Armaturen.Statikpunkt.Fixpunkt', 'rrr_Armaturen.Statikpunkt.Fixpunkt', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8144,8144,'armatures.static_point.guide_bearing_close_before_compensators','Armaturen.Statikpunkt.Fuehrungslager_eng_vor_Kompensatoren','armatures.point_statique.guidage_proche_des_compensateurs', 'zzz_Armaturen.Statikpunkt.Fuehrungslager_eng_vor_Kompensatoren', 'rrr_Armaturen.Statikpunkt.Fuehrungslager_eng_vor_Kompensatoren', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8145,8145,'armatures.static_point.guide_bearing_far_in_front_of_bend','Armaturen.Statikpunkt.Fuehrungslager_weit_vor_LT_Bogen','armatures.point_statique.guidage_eloigne_du_coude_conduite', 'zzz_Armaturen.Statikpunkt.Fuehrungslager_weit_vor_LT_Bogen', 'rrr_Armaturen.Statikpunkt.Fuehrungslager_weit_vor_LT_Bogen', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8141,8141,'armatures.static_point.joint_compensator','Armaturen.Statikpunkt.Gelenkkompensator','armatures.point_statique.compensateur_articule', 'zz_Armaturen.Statikpunkt.Gelenkkompensator', 'rrr_Armaturen.Statikpunkt.Gelenkkompensator', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8142,8142,'armatures.static_point.plain_roller_bearings','Armaturen.Statikpunkt.Gleitrollenlager','armatures.point_statique.support_a_rouleaux', 'zzz_Armaturen.Statikpunkt.Gleitrollenlager', 'rrr_Armaturen.Statikpunkt.Gleitrollenlager', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8146,8146,'armatures.static_point.compensator','Armaturen.Statikpunkt.Kompensator','armatures.point_statique.compensateur', 'zzz_Armaturen.Statikpunkt.Kompensator', 'rrr_Armaturen.Statikpunkt.Kompensator', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8143,8143,'armatures.static_point.transverse_ball_bearings','Armaturen.Statikpunkt.Kugelquerlager','armatures.point_statique.support_transversal_a_billes', 'zzz_Armaturen.Statikpunkt.Kugelquerlager', 'rrr_Armaturen.Statikpunkt.Kugelquerlager', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8138,8138,'armatures.static_point.transverse_roller_bearings','Armaturen.Statikpunkt.Querrollenlager','armatures.point_statique.guidage_lateral_a_rouleau', 'zzz_Armaturen.Statikpunkt.Querrollenlager', 'rrr_Armaturen.Statikpunkt.Querrollenlager', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8118,8118,'armatures.valve_with_motor.with_remote_control','Armaturen.Ventil_mit_Motor.mit_Fernsteuerung','armatures.soupape_motorisee.avec_commande_a_distance', 'zzz_Armaturen.Ventil_mit_Motor.mit_Fernsteuerung', 'rrr_Armaturen.Ventil_mit_Motor.mit_Fernsteuerung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8119,8119,'armatures.valve_with_motor.without_remote_control','Armaturen.Ventil_mit_Motor.ohne_Fernsteuerung','armatures.soupape_motorisee.sans_commande_a_distance', 'zzz_Armaturen.Ventil_mit_Motor.ohne_Fernsteuerung', 'rrr_Armaturen.Ventil_mit_Motor.ohne_Fernsteuerung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8117,8117,'armatures.valve_without_motor','Armaturen.Ventil_ohne_Motor','armatures.soupape_non_motorisee', 'zzz_Armaturen.Ventil_ohne_Motor', 'rrr_Armaturen.Ventil_ohne_Motor', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8109,8109,'network.leak_detection_transmitter','Netz.Leckortung_Endbuechse','reseau.detection_de_fuites_boite_terminale', 'zzz_Netz.Leckortung_Endbuechse', 'rrr_Netz.Leckortung_Endbuechse', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8108,8108,'network.leak_detection_receiver','Netz.Leckortung_Messbuechse','reseau.boite_de_mesure_et_detection_de_fuites', 'zzz_Netz.Leckortung_Messbuechse', 'rrr_Netz.Leckortung_Messbuechse', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_point_normal ADD CONSTRAINT fkey_vl_pipe_point_normal_kind FOREIGN KEY (kind)
 REFERENCES tdh_vl.pipe_point_normal_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_point_normal_armature_setting () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_point_normal_armature_setting ADD CONSTRAINT pkey_tdh_vl_pipe_point_normal_armature_setting_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_point_normal_armature_setting (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8149,8149,'closed','geschlossen','fermee', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_armature_setting (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8148,8148,'open','offen','ouverte', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_point_normal ADD CONSTRAINT fkey_vl_pipe_point_normal_armature_setting FOREIGN KEY (armature_setting)
 REFERENCES tdh_vl.pipe_point_normal_armature_setting (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_point_normal_material () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_point_normal_material ADD CONSTRAINT pkey_tdh_vl_pipe_point_normal_material_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_point_normal_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8153,8153,'cast_iron','Guss','fonte', 'ghisa', 'fonta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8154,8154,'plastic','Kunststoff','matiere_synthetique', 'materiale_sintetico', 'materie_sintetica', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8152,8152,'steel','Stahl','acier', 'acciaio', 'otel', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_normal_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8151,8151,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_point_normal ADD CONSTRAINT fkey_vl_pipe_point_normal_material FOREIGN KEY (material)
 REFERENCES tdh_vl.pipe_point_normal_material (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE tdh_od.pipe_point_feed ADD CONSTRAINT oorel_od_pipe_point_feed_pipe_point FOREIGN KEY (obj_id) REFERENCES tdh_od.pipe_point(obj_id) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE TABLE tdh_vl.pipe_point_feed_kind () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_point_feed_kind ADD CONSTRAINT pkey_tdh_vl_pipe_point_feed_kind_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_point_feed_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8158,8158,'house_transfer_station','Hausuebergabestation','poste_de_raccordement', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8156,8156,'network_supply','Netzeinspeisung','alimentation_du_reseau', 'zzz_Netzeinspeisung', 'rrr_Netzeinspeisung', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8157,8157,'network_interconnection','Netzuebergabe','derivation', 'zzz_Netzuebergabe', 'rrr_Netzuebergabe', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8159,8159,'others','weitere','autre', 'di_piu', 'rrr_altul', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_point_feed ADD CONSTRAINT fkey_vl_pipe_point_feed_kind FOREIGN KEY (kind)
 REFERENCES tdh_vl.pipe_point_feed_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.pipe_point_feed_category () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_point_feed_category ADD CONSTRAINT pkey_tdh_vl_pipe_point_feed_category_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_point_feed_category (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8173,8173,'service_provider','Dienstleister','prestataire_de_services', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_category (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8169,8169,'single_family_house','EFH','MI', 'zzz_EFH', 'rrr_EFH', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_category (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8174,8174,'enterprise_industry','Gewerbe_Industrie','artisanat_industrie', 'zzz_Gewerbe_Industrie', 'rrr_Gewerbe_Industrie', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_category (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8170,8170,'apartment_building','MFH','IL', 'zzz_MFH', 'rrr_MFH', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_category (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8172,8172,'public_building','Oeffentliche_Gebaeude','batiments_publics', 'zzz_Oeffentliche_Gebaeude', 'rrr_Oeffentliche_Gebaeude', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_category (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8175,8175,'special_client','Spez_Kunden','clients_speciaux', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_point_feed_category (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8171,8171,'hospital','Spital','hopital', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_point_feed ADD CONSTRAINT fkey_vl_pipe_point_feed_category FOREIGN KEY (category)
 REFERENCES tdh_vl.pipe_point_feed_category (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE tdh_od.structure ADD COLUMN fk_owner varchar(16);
ALTER TABLE tdh_od.structure ADD CONSTRAINT rel_structure_owner FOREIGN KEY (fk_owner) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.structure ADD COLUMN fk_construction_company varchar(16);
ALTER TABLE tdh_od.structure ADD CONSTRAINT rel_structure_construction_company FOREIGN KEY (fk_construction_company) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE tdh_vl.structure_horizontal_positioning () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_horizontal_positioning ADD CONSTRAINT pkey_tdh_vl_structure_horizontal_positioning_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8207,8207,'accurate','genau','precis', 'preciso', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8206,8206,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8208,8208,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES tdh_vl.structure_horizontal_positioning (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_status () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_status ADD CONSTRAINT pkey_tdh_vl_structure_status_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9468,9468,'inoperative','ausser_Betrieb','hors_service', 'fuori_servizio', 'rrr_ausser_Betrieb', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8210,8210,'inoperative.reserve','ausser_Betrieb.Reserve','hors_service.en_reserve', 'fuori_servizio.riserva', 'rrr_ausser_Betrieb.Reserve', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9469,9469,'operational','in_Betrieb','en_service', 'in_funzione', 'rrr_in_Betrieb', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8212,8212,'operational.tentative','in_Betrieb.provisorisch','en_service.provisoire', 'in_funzione.provvisorio', 'functionala.provizoriu', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8213,8213,'dead','tot','abandonne', 'zzz_tot', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8214,8214,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8215,8215,'other.planned','weitere.geplant','autre.planifie', 'altro.previsto', 'rrr_weitere.geplant', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8216,8216,'other.project','weitere.Projekt','autre.projet', 'altro.progetto', 'alta.proiect', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_status FOREIGN KEY (status)
 REFERENCES tdh_vl.structure_status (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_kind () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_kind ADD CONSTRAINT pkey_tdh_vl_structure_kind_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8226,8226,'pressure_reducing_station','Druckreduzierstation','reducteur_de_pression', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8222,8222,'emptying_chamber','Entleeerungskammer','chambre_de_vidange', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8220,8220,'venting_chamber','Entlueftungskammer','chambre_de_purge', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8224,8224,'main_chamber','Hauptkammer','chambre_principale', 'zzz_Hauptkammer', 'rrr_Hauptkammer', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8225,8225,'compensator_chamber','Kompensatorenkammer','chambre_des_compensateurs', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8219,8219,'control_chamber','Kontrollkammer','chambre_de_controle', 'zzz_Kontrollkammer', 'rrr_Kontrollkammer', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8223,8223,'measuring_chamber','Messkammer','chambre_de_mesure', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8228,8228,'special_structure','Spezialbauwerk','ouvrage_special', 'zzz_Spezialbauwerk', 'rrr_Spezialbauwerk', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8221,8221,'control_chamber','Steuerkammer','chambre_de_commande', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8227,8227,'transformer_station','Umformerstation','poste_de_transformation', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8218,8218,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_kind FOREIGN KEY (kind)
 REFERENCES tdh_vl.structure_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_venting () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_venting ADD CONSTRAINT pkey_tdh_vl_structure_venting_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_venting (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8236,8236,'none','keine','aucune', 'nessuno', 'inexistent', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_venting (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8234,8234,'mechanical','mechanisch','mecanique', 'zzz_mechanisch', 'rrr_mechanisch', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_venting (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8235,8235,'natural','natuerlich','naturelle', 'zzz_natuerlich', 'rrr_natuerlich', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_venting (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8233,8233,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_venting FOREIGN KEY (venting)
 REFERENCES tdh_vl.structure_venting (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_discharge_type () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_discharge_type ADD CONSTRAINT pkey_tdh_vl_structure_discharge_type_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_discharge_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8237,8237,'wastewater','Abwasser','eaux_usees', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_discharge_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8238,8238,'soil','Boden','sol', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_discharge_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8240,8240,'sump','Pumpensumpf','puisard_d_aspiration', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_discharge_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8239,8239,'clean_water','Sauberwasser','eau_propre', 'zzz_Sauberwasser', 'rrr_Sauberwasser', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_discharge_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8241,8241,'weep_hole','Sickerloch','puits_perdu', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_discharge_type FOREIGN KEY (discharge_type)
 REFERENCES tdh_vl.structure_discharge_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_grid_type () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_grid_type ADD CONSTRAINT pkey_tdh_vl_structure_grid_type_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_grid_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8245,8245,'with_emptying','mit_Entleerung','avec_vidange', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_grid_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8243,8243,'with_syphon','mit_Syphon','avec_siphon', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_grid_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8246,8246,'without_emptying','ohne_Entleerung','sans_vidange', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_grid_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8244,8244,'without_syphon','ohne_Syphon','sans_siphon', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_grid_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8247,8247,'special_grid_type','spez_Gittertyp','grille_de_type_special', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_grid_type FOREIGN KEY (grid_type)
 REFERENCES tdh_vl.structure_grid_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_drainage_pump () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_drainage_pump ADD CONSTRAINT pkey_tdh_vl_structure_drainage_pump_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_drainage_pump (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8252,8252,'fixed_installed','fest_installiert','installation_fixe', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_drainage_pump (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8254,8254,'none','keine','aucune', 'nessuno', 'inexistent', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_drainage_pump (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8253,8253,'mobile','mobil','mobile', '', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_drainage_pump FOREIGN KEY (drainage_pump)
 REFERENCES tdh_vl.structure_drainage_pump (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_power_connection () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_power_connection ADD CONSTRAINT pkey_tdh_vl_structure_power_connection_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_power_connection (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8257,8257,'yes','ja','oui', 'si', 'da', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_power_connection (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8258,8258,'no','nein','non', 'no', 'nu', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_power_connection FOREIGN KEY (power_connection)
 REFERENCES tdh_vl.structure_power_connection (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_measuring_system () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_measuring_system ADD CONSTRAINT pkey_tdh_vl_structure_measuring_system_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_measuring_system (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8262,8262,'none','keine','aucune', 'nessuno', 'inexistent', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_measuring_system (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8263,8263,'with_remote_reading','mit_Fernablesung','avec_telemesure', 'zzz_mit_Fernablesung', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_measuring_system (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8264,8264,'without_remote_reading','ohne_Fernablesung','sans_telemesure', 'zzz_ohne_Fernablesung', '', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_measuring_system FOREIGN KEY (measuring_system)
 REFERENCES tdh_vl.structure_measuring_system (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.structure_condition () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.structure_condition ADD CONSTRAINT pkey_tdh_vl_structure_condition_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.structure_condition (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8265,8265,'good','gut','bon', 'zzz_gut', 'rrr_gut', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_condition (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8267,8267,'wet','nass','humide', 'zzz_nass', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.structure_condition (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8266,8266,'dry','trocken','sec', 'zzz_trocken', 'rrr_trocken', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.structure ADD CONSTRAINT fkey_vl_structure_condition FOREIGN KEY (condition)
 REFERENCES tdh_vl.structure_condition (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE tdh_od.trench ADD COLUMN fk_owner varchar(16);
ALTER TABLE tdh_od.trench ADD CONSTRAINT rel_trench_owner FOREIGN KEY (fk_owner) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.trench ADD COLUMN fk_construction_company varchar(16);
ALTER TABLE tdh_od.trench ADD CONSTRAINT rel_trench_construction_company FOREIGN KEY (fk_construction_company) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE tdh_vl.trench_horizontal_positioning () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_horizontal_positioning ADD CONSTRAINT pkey_tdh_vl_trench_horizontal_positioning_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8296,8296,'accurate','genau','precis', 'preciso', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8297,8297,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8298,8298,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench ADD CONSTRAINT fkey_vl_trench_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES tdh_vl.trench_horizontal_positioning (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.trench_status () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_status ADD CONSTRAINT pkey_tdh_vl_trench_status_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8299,8299,'inoperative','ausser_Betrieb','hors_service', 'fuori_servizio', 'rrr_ausser_Betrieb', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8300,8300,'inoperative.reserve','ausser_Betrieb.Reserve','hors_service.en_reserve', 'fuori_servizio.riserva', 'rrr_ausser_Betrieb.Reserve', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8301,8301,'operational','in_Betrieb','en_service', 'in_funzione.in_funzione', 'functionala.functionala', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8302,8302,'operational.tentative','in_Betrieb.provisorisch','en_service.provisoire', 'in_funzione.provvisorio', 'functionala.provizoriu', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8303,8303,'dead','tot','abandonne', 'zzz_tot', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8304,8304,'other.planned','weitere.geplant','autre.planifie', 'altro.previsto', 'rrr_weitere.geplant', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8305,8305,'other.project','weitere.Projekt','autre.projet', 'altro.progetto', 'alta.proiect', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench ADD CONSTRAINT fkey_vl_trench_status FOREIGN KEY (status)
 REFERENCES tdh_vl.trench_status (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.trench_trench_type () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_trench_type ADD CONSTRAINT pkey_tdh_vl_trench_trench_type_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8311,8311,'walkable_channel','begehbarer_Kanal','canal_accessible', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8317,8317,'buried.expansion_pads','erdverlegt.Dehnungspolster','enterre.matelas_de_dilatation', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8316,8316,'buried.normal','erdverlegt.normal','enterre.normale', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8313,8313,'overhead_line','Freileitung','conduite_aerienne', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8312,8312,'vault','Gewoelbe','voute', 'zzz_Gewoelbe', 'rrr_Gewoelbe', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8309,8309,'hooded_channel','Haubenkanal','caniveau', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8310,8310,'insitu_concrete_channel','Ortsbetonkanal','caniveau_en_beton', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8314,8314,'hydraulic_pressure_pipe','Pressrohr','pousse_tube', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8315,8315,'protection_tube','Schutzrohr','fourreau', 'zzz_Schutzrohr', 'rrr_Schutzrohr', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8308,8308,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench ADD CONSTRAINT fkey_vl_trench_trench_type FOREIGN KEY (trench_type)
 REFERENCES tdh_vl.trench_trench_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.trench_embedding () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_embedding ADD CONSTRAINT pkey_tdh_vl_trench_embedding_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_embedding (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8324,8324,'groundwater','Grundwasser','nappe_phreatique', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_embedding (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8323,8323,'normal','normal','normal', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_embedding (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8325,8325,'landslip_area','Rutschgebiet','zone_de_glissement_de_terrain', 'zzz_Rutschgebiet', 'rrr_Rutschgebiet', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench ADD CONSTRAINT fkey_vl_trench_embedding FOREIGN KEY (embedding)
 REFERENCES tdh_vl.trench_embedding (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.trench_control_system () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_control_system ADD CONSTRAINT pkey_tdh_vl_trench_control_system_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_control_system (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8329,8329,'Brandes','Brandes','Brandes', 'Brandes', 'Brandes', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_control_system (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8328,8328,'Isovit','Isovit','Isovit', 'Isovit', 'Isovit', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_control_system (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8327,8327,'none','keines','aucun', 'nessuno', 'inexistent', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_control_system (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8330,8330,'others','weitere','autre', 'di_piu', 'rrr_weitere', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench ADD CONSTRAINT fkey_vl_trench_control_system FOREIGN KEY (control_system)
 REFERENCES tdh_vl.trench_control_system (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.trench_cable_conduits () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_cable_conduits ADD CONSTRAINT pkey_tdh_vl_trench_cable_conduits_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_cable_conduits (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8336,8336,'yes.inside','ja.Lage_innen','oui.position_interieure', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_cable_conduits (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8334,8334,'yes.top','ja.Lage_oben','oui.position_superieure', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_cable_conduits (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8335,8335,'yes.lateral','ja.Lage_seitlich','oui.position_laterale', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_cable_conduits (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8337,8337,'no','nein','non', 'no', 'nu', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench ADD CONSTRAINT fkey_vl_trench_cable_conduits FOREIGN KEY (cable_conduits)
 REFERENCES tdh_vl.trench_cable_conduits (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE tdh_od.trench_point ADD COLUMN fk_owner varchar(16);
ALTER TABLE tdh_od.trench_point ADD CONSTRAINT rel_trench_point_owner FOREIGN KEY (fk_owner) REFERENCES tdh_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE tdh_vl.trench_point_horizontal_positioning () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_point_horizontal_positioning ADD CONSTRAINT pkey_tdh_vl_trench_point_horizontal_positioning_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8357,8357,'accurate','genau','precis', 'preciso', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8355,8355,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8356,8356,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench_point ADD CONSTRAINT fkey_vl_trench_point_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES tdh_vl.trench_point_horizontal_positioning (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.trench_point_kind () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_point_kind ADD CONSTRAINT pkey_tdh_vl_trench_point_kind_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8365,8365,'support','Abstuetzung','support', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8362,8362,'venting','Ent_Belueftung','xxx_ventilation_drainage', 'zzz_Be_Entlueftung', 'aerisire', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8363,8363,'drainage','Entwaesserung','drainage', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8364,8364,'fixed_point','Fixpunkt','point_fixe', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8366,8366,'geometry_point','Geometriepunkt','point_de_geometrie', 'zzz_Geometriepunkt', 'rrr_Geometriepunkt', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8361,8361,'mounting_opening','Montageoeffnung','ouverture_de_montage', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8360,8360,'manhole_access','Schachteinstieg','acces_de_chambre', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8359,8359,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench_point ADD CONSTRAINT fkey_vl_trench_point_kind FOREIGN KEY (kind)
 REFERENCES tdh_vl.trench_point_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE tdh_vl.trench_point_elevation_determination () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.trench_point_elevation_determination ADD CONSTRAINT pkey_tdh_vl_trench_point_elevation_determination_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.trench_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8376,8376,'accurate','genau','precis', 'preciso', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8377,8377,'unknown','unbekannt','imprecis', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.trench_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8378,8378,'inaccurate','ungenau','imprecise', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.trench_point ADD CONSTRAINT fkey_vl_trench_point_elevation_determination FOREIGN KEY (elevation_determination)
 REFERENCES tdh_vl.trench_point_elevation_determination (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;

--------- Relations to class organisation for dataowner and provider (new 3.11.2014);

ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT rel_od_pipe_section_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT rel_od_pipe_section_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT rel_od_pipe_point_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.pipe_point ADD CONSTRAINT rel_od_pipe_point_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.structure ADD CONSTRAINT rel_od_structure_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.structure ADD CONSTRAINT rel_od_structure_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.trench ADD CONSTRAINT rel_od_trench_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.trench ADD CONSTRAINT rel_od_trench_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.trench_point ADD CONSTRAINT rel_od_trench_point_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE tdh_od.trench_point ADD CONSTRAINT rel_od_trench_point_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES tdh_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;

------ Indexes on identifiers

 CREATE UNIQUE INDEX in_od_pipe_section_name_number ON tdh_od.pipe_section USING btree (name_number ASC NULLS LAST, fk_dataowner ASC NULLS LAST);
 CREATE UNIQUE INDEX in_od_structure_name_number ON tdh_od.structure USING btree (name_number ASC NULLS LAST, fk_dataowner ASC NULLS LAST);
 CREATE UNIQUE INDEX in_od_trench_name_number ON tdh_od.trench USING btree (name_number ASC NULLS LAST, fk_dataowner ASC NULLS LAST);
 CREATE UNIQUE INDEX in_od_trench_point_name_number ON tdh_od.trench_point USING btree (name_number ASC NULLS LAST, fk_dataowner ASC NULLS LAST);

COMMIT;
