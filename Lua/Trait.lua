-- Trait
-- Author: User
-- DateCreated: 3/10/2015 7:18:33 PM
--------------------------------------------------------------

function MossiHorseman(playerID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RMOSSI"] then
        if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_HORSEMAN"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RMOSSI_HORSEMAN"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_KNIGHT"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RMOSSI_KNIGHT"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_LANCER"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RMOSSI_LANCER"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_CAVALRY"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RMOSSI_CAVALRY"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
    end
end
Events.SerialEventUnitCreated.Add(MossiHorseman)

function RMossi_MoghoNaabaCourt(playerID, city)
        local numWorkedMossiResources = 0
        local player = Players[playerID]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RMOSSI"] then
                for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
                        local plot = city:GetCityIndexPlot(cityPlot)
                        if plot then
                                if plot:GetOwner() == playerID then
                                        if city:IsWorkingPlot(plot) then      
                                                if (plot:GetResourceType() == GameInfoTypes["RESOURCE_HORSE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_WHALE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_PEARLS"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_GOLD"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_SILVER"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_GEMS"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_MARBLE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_IVORY"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_FUR"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_DYE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_SPICES"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_SILK"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_SUGAR"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_COTTON"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_WHALE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_WINE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_INCENSE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_COCOA"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_COPPER"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_SALT"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_TRUFFLES"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_CITRUS"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_COFFEE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_TEA"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_TOBACCO"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_AMBER"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_JADE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_OLIVE"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_PERFUME"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_CORAL"] or plot:GetResourceType() == GameInfoTypes["RESOURCE_LAPIS"]) then
                                                        numWorkedMossiResources = numWorkedMossiResources + 1
                                                end
                                        end
                                end
                        end
                end
        end
       
        return numWorkedMossiResources
end
       
function RMossi_MoghoNaabaBonus(playerID)
        local player = Players[playerID]
        if player:IsAlive() then
                for city in player:Cities() do
                        if (city:GetNumBuilding(GameInfoTypes["BUILDING_FRIDAY_COURT"]) > 0) then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_FRIDAY_COURT_DUMMY"], RMossi_MoghoNaabaCourt(playerID, city))
                        end
                        if (city:GetNumBuilding(GameInfoTypes["BUILDING_FRIDAY_COURT_DUMMY"]) > 4) then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_FRIDAY_COURT_DUMMY"], 4)
                        end
                end
        end
end
GameEvents.PlayerDoTurn.Add(RMossi_MoghoNaabaBonus)