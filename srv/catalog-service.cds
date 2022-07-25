using { ProjectDefination.db as db } from '../db/datamodel';

service DefinationService {
    entity STOProjectEvent as projection on db.STOProjectEvent;
    entity ProjectComplexity as projection on db.ProjectComplexity;
    entity ProjectCategorie as projection on db.ProjectCategorie;
    entity SystemStatus as projection on db.SystemStatus;
    entity ProjectOrganizationOBS as projection on db.ProjectOrganizationOBS;
    entity ProjectRoleResponsibility as projection on db.ProjectRoleResponsibility;
    entity STOProjectPublicPermit as projection on db.STOProjectPublicPermit;
    entity PublicPermitType as projection on db.PublicPermitType;
    entity PublicPermitStatus as projection on db.PublicPermitStatus;    

}
