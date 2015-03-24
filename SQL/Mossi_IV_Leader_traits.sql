-- Insert SQL Rules Here 

CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_DOBROWSKI',	 'POLICY_EXPANSIVE_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_EXPANSIVE_X' )
	THEN 'Dobrowski [ICON_FOOD][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_DOBROWSKI' END) 
WHERE Type = 'LEADER_DOBROWSKI';

CREATE TRIGGER CivIVTraitsMilan
AFTER INSERT ON Leaders WHEN 'LEADER_DOBROWSKI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_SPIRITUAL_X' )
		THEN 'Dobrowski [ICON_FOOD][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_DOBROWSKI' END) 
	WHERE Type = 'LEADER_DOBROWSKI';
END;	