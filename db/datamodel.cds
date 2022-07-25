namespace ProjectDefination.db;


using {managed} from '@sap/cds/common';

type projectID : String;

aspect CommonService {
    companyID : String;
    plantID   : String;
}

/*--------------STO Projects (Events)--------------------*/

entity STOProjectEvent : managed, CommonService {
    key projectID                               : projectID;
        projectName                             : String;
        projectDescription                      : String;
        projectCategory                         : Association to one ProjectCategorie { categoryName };
        projectType                             : ProjectType;
        estimateProductionLoss                  : Integer;
        STOCostEstimate                         : Integer;
        projectComplexity                       : Association to one ProjectComplexity {projectComplexity};
        SAPProjectNumber                        : String;
        primaveraProjectName                    : String;
        primaveraProjectLocation                : String;

        /*---------------- Templates-------------------- */
        projectWBSTemplate                      : String;
        projectOBSTemplate                      : String;
        projectMilestonesTemplate               : String;
        projectValidationCriteriaTemplate       : String;
        projectResourceTemplate                 : String;
        projectRiskMatrixID                     : Integer;
        projectAlternativeCostStructureTemplate : String;
        systemStatus                            : Association to one SystemStatus { statusID };
        projectManager                          : Integer;

        /*-----------------Dates-------------------- */
        scopeFreezeDate                         : Date;
        STOEventStart                           : Date;
        STOEventFinish                          : Date;
        plannedOffStreamStartDate               : Date;
        plannedOffStreamFinishDate              : Date;
        plannedOffStreamDuration                : Date;
        plannedMechanicalStartDate              : Date;
        plannedMechanicalFinishDate             : Date;
        plannedMechanicalDuration               : Date;
        plannedAcceptanceStartDate              : Date;
        plannedAcceptanceFinishDate             : Date;
        plannedAcceptanceDuration               : Date;
        plannedOnStreamStartDate                : Date;
        plannedOnStreamFinishDate               : Date;
        plannedOnStreamDuration                 : Date;
        acualOffStreamStartDate                 : Date;
        actualOffStreamFinishDate               : Date;
        actualOffStreamDuration                 : Date;
        actualMechanicalStartDate               : Date;
        actualMechanicalFinishDate              : Date;
        actualMechanicalDuration                : Date;
        actualAcceptanceStartDate               : Date;
        actualAcceptanceFinishDate              : Date;
        actualAcceptanceDuration                : Date;
        actualOffStreamStartDate                : Date;
        /*-------------Budgets-------------------- */
        originalBudget                          : Integer;
        controlBudget                           : Integer;
        budgetVersion                           : Integer;
        plannedEstimate                         : Integer;
        numberofBudgetSupplements               : Integer;
        totalBudgetSupplementValue              : Integer;
        actualCostToDate                        : Integer;
        forecatedCostatCompletion               : Integer;
        actualCostAtCompletion                  : Integer;
}

/*----------------------Project Complexities--------------------*/

entity ProjectComplexity : managed {
    key projectComplexity : String;
        complexityName    : String;
}

/*------------------------Project Categories------------------*/

entity ProjectCategorie : managed {
        projectCategory : String; //Oil Supply Planning and Scheduling (OSPAS)
    key categoryName    : String;
}

/*----------------------System Status------------------------*/

entity SystemStatus : managed {
    key statusID   : String;
        statusName : String;
}

/*--------------------Project Organizations (OBS)----------------*/

entity ProjectOrganizationOBS : managed, CommonService {
    key projectID          : projectID;
        OBSRoleID          : Integer;
        OBSRoleName        : String;
        reportsTO          : String;
        assignment         : String;
        employeeID         : Integer;
        employeeName       : String;
        authorizationGroup : String;
}

/*--------------------Project Role Responsibilities--------------------*/

entity ProjectRoleResponsibility : managed, CommonService {
    key projectID        : projectID;
        OBSRoleID        : Integer;
        OBSRoleName      : String;
        responsibilityID : Integer;
}

/*------------------------STO Projects Public Permits--------------------*/

entity STOProjectPublicPermit : managed, CommonService {
    key projectID               : projectID;
        publicPermitType        : Association to one PublicPermitType {
                                      publicPermitType
                                  };
        publicPermitTypeName    : String;
        permitName              : String;
        permitDescription       : String;
        issuingOrganization     : String;
        requiredByDate          : Date;
        leadTimeDays            : Date;
        responsiblePerson       : String;
        rejectedOnDate          : Date;
        reasonforRejection      : String;
        resubmittedOn           : Date;
        issuedOnDate            : Date;
        permitStatus            : Association to one PublicPermitStatus {
                                      statusID
                                  };
        permitApplicationURL    : String;
        permitPermitDocumentURL : String;
}

/*-----------------------Public Permit Types----------------------*/

entity PublicPermitType : managed {
    key publicPermitType     : String;
        publicPermitTypeName : String;
}

/*--------------------------Public Permit Status-----------------*/

entity PublicPermitStatus : managed {
    key statusID   : String;
        statusName : String;
}

type ProjectType : String enum {
    Shutdown;
    Turnaround;
    Outage
}
