export declare enum Visibility {
    None = 0,
    Public = 1,
    External = 2,
    Internal = 3,
    Private = 4
}
export declare enum ClassStereotype {
    None = 0,
    Library = 1,
    Interface = 2,
    Abstract = 3,
    Contract = 4,
    Struct = 5,
    Enum = 6
}
export declare enum OperatorStereotype {
    None = 0,
    Modifier = 1,
    Event = 2,
    Payable = 3,
    Fallback = 4,
    Abstract = 5
}
export declare enum AttributeType {
    Elementary = 0,
    UserDefined = 1,
    Function = 2,
    Array = 3,
    Mapping = 4
}
export interface Attribute {
    visibility?: Visibility;
    name: string;
    type?: string;
    attributeType?: AttributeType;
    compiled?: boolean;
}
export interface Parameter {
    name?: string;
    type: string;
}
export interface Operator extends Attribute {
    stereotype?: OperatorStereotype;
    parameters?: Parameter[];
    returnParameters?: Parameter[];
    isPayable?: boolean;
}
export declare enum ReferenceType {
    Memory = 0,
    Storage = 1
}
export interface Association {
    referenceType: ReferenceType;
    targetUmlClassName: string;
    targetUmlClassStereotype?: ClassStereotype;
    realization?: boolean;
}
export interface ClassProperties {
    name: string;
    absolutePath: string;
    relativePath: string;
    importedFileNames?: string[];
    stereotype?: ClassStereotype;
    enums?: {
        [name: string]: string[];
    };
    structs?: {
        [name: string]: Attribute[];
    };
    attributes?: Attribute[];
    operators?: Operator[];
    associations?: {
        [name: string]: Association;
    };
}
export declare class UmlClass implements ClassProperties {
    static idCounter: number;
    id: number;
    name: string;
    absolutePath: string;
    relativePath: string;
    importedPaths?: string[];
    stereotype?: ClassStereotype;
    attributes: Attribute[];
    operators: Operator[];
    enums: {
        [name: string]: string[];
    };
    structs: {
        [name: string]: Attribute[];
    };
    associations: {
        [name: string]: Association;
    };
    constructor(properties: ClassProperties);
    addAssociation(association: Association): void;
    /**
     * Gets the immediate parent contracts this class inherits from.
     * Does not include any grand parent associations. That has to be done recursively.
     */
    getParentContracts(): Association[];
}
