from pyparsing import *

headers = """
OMSAPI const char* OMSCALL oms_getVersion();
OMSAPI oms_status_enu_t OMSCALL oms_addBus(const char* cref);
OMSAPI oms_status_enu_t OMSCALL oms_addConnection(const char* crefA, const char* crefB);
OMSAPI oms_status_enu_t OMSCALL oms_addConnector(const char* cref, oms_causality_enu_t causality, oms_signal_type_enu_t type);
OMSAPI oms_status_enu_t OMSCALL oms_addConnectorToBus(const char* busCref, const char* connectorCref);
OMSAPI oms_status_enu_t OMSCALL oms_addConnectorToTLMBus(const char* busCref, const char* connectorCref, const char *type);
OMSAPI oms_status_enu_t OMSCALL oms_addDynamicValueIndicator(const char* signal, const char* lower, const char* upper, double stepSize);
OMSAPI oms_status_enu_t OMSCALL oms_addEventIndicator(const char* signal);
OMSAPI oms_status_enu_t OMSCALL oms_addExternalModel(const char* cref, const char* path, const char* startscript);
OMSAPI oms_status_enu_t OMSCALL oms_addSignalsToResults(const char* cref, const char* regex);
OMSAPI oms_status_enu_t OMSCALL oms_addStaticValueIndicator(const char* signal, double lower, double upper, double stepSize);
OMSAPI oms_status_enu_t OMSCALL oms_addSubModel(const char* cref, const char* fmuPath);
OMSAPI oms_status_enu_t OMSCALL oms_addSystem(const char* cref, oms_system_enu_t type);
OMSAPI oms_status_enu_t OMSCALL oms_addTimeIndicator(const char* signal);
OMSAPI oms_status_enu_t OMSCALL oms_addTLMBus(const char* cref, oms_tlm_domain_t domain, const int dimensions, const oms_tlm_interpolation_t interpolation);
OMSAPI oms_status_enu_t OMSCALL oms_addTLMConnection(const char* crefA, const char* crefB, double delay, double alpha, double linearimpedance, double angularimpedance);
OMSAPI oms_status_enu_t OMSCALL oms_cancelSimulation_asynchronous(const char* cref);
OMSAPI int OMSCALL oms_compareSimulationResults(const char* filenameA, const char* filenameB, const char* var, double relTol, double absTol);
OMSAPI oms_status_enu_t OMSCALL oms_copySystem(const char* source, const char* target);
OMSAPI oms_status_enu_t OMSCALL oms_delete(const char* cref);
OMSAPI oms_status_enu_t OMSCALL oms_deleteConnection(const char* crefA, const char* crefB);
OMSAPI oms_status_enu_t OMSCALL oms_deleteConnectorFromBus(const char* busCref, const char* connectorCref);
OMSAPI oms_status_enu_t OMSCALL oms_deleteConnectorFromTLMBus(const char* busCref, const char* connectorCref);
OMSAPI oms_status_enu_t OMSCALL oms_export(const char* cref, const char* filename);
OMSAPI oms_status_enu_t OMSCALL oms_exportDependencyGraphs(const char* cref, const char* initialization, const char* simulation);
OMSAPI oms_status_enu_t OMSCALL oms_extractFMIKind(const char* filename, oms_fmi_kind_enu_t* kind);

OMSAPI oms_status_enu_t OMSCALL oms_getBoolean(const char* cref, bool* value);
OMSAPI oms_status_enu_t OMSCALL oms_getFixedStepSize(const char* cref, double* stepSize);
OMSAPI oms_status_enu_t OMSCALL oms_getInteger(const char* cref, int* value);
OMSAPI oms_status_enu_t OMSCALL oms_getModelState(const char* cref, oms_modelState_enu_t* modelState);
OMSAPI oms_status_enu_t OMSCALL oms_getReal(const char* cref, double* value);
OMSAPI oms_status_enu_t OMSCALL oms_getSolver(const char* cref, oms_solver_enu_t* solver);
OMSAPI oms_status_enu_t OMSCALL oms_getStartTime(const char* cref, double* startTime);
OMSAPI oms_status_enu_t OMSCALL oms_getStopTime(const char* cref, double* stopTime);
OMSAPI oms_status_enu_t OMSCALL oms_getSubModelPath(const char* cref, char** path);
OMSAPI oms_status_enu_t OMSCALL oms_getSystemType(const char* cref, oms_system_enu_t* type);
OMSAPI oms_status_enu_t OMSCALL oms_getTolerance(const char* cref, double* absoluteTolerance, double* relativeTolerance);
OMSAPI oms_status_enu_t OMSCALL oms_getVariableStepSize(const char* cref, double* initialStepSize, double* minimumStepSize, double* maximumStepSize);

OMSAPI oms_status_enu_t OMSCALL oms_faultInjection(const char* signal, oms_fault_type_enu_t faultType, double faultValue);
OMSAPI oms_status_enu_t OMSCALL oms_importFile(const char* filename, char** cref);
OMSAPI oms_status_enu_t OMSCALL oms_initialize(const char* cref);
OMSAPI oms_status_enu_t OMSCALL oms_instantiate(const char* cref);
OMSAPI oms_status_enu_t OMSCALL oms_list(const char* cref, char** contents);
OMSAPI oms_status_enu_t OMSCALL oms_listUnconnectedConnectors(const char* cref, char** contents);
OMSAPI oms_status_enu_t OMSCALL oms_loadSnapshot(const char* cref, const char* snapshot);
OMSAPI oms_status_enu_t OMSCALL oms_newModel(const char* cref);
OMSAPI oms_status_enu_t OMSCALL oms_parseModelName(const char* contents, char** cref);
OMSAPI oms_status_enu_t OMSCALL oms_removeSignalsFromResults(const char* cref, const char* regex);
OMSAPI oms_status_enu_t OMSCALL oms_rename(const char* cref, const char* newCref);
OMSAPI oms_status_enu_t OMSCALL oms_reset(const char* cref);
OMSAPI oms_status_enu_t OMSCALL oms_RunFile(const char* filename);

OMSAPI oms_status_enu_t OMSCALL oms_setBoolean(const char* cref, bool value);
OMSAPI oms_status_enu_t OMSCALL oms_setCommandLineOption(const char* cmd);
OMSAPI oms_status_enu_t OMSCALL oms_setFixedStepSize(const char* cref, double stepSize);
OMSAPI oms_status_enu_t OMSCALL oms_setInteger(const char* cref, int value);
OMSAPI oms_status_enu_t OMSCALL oms_setLogFile(const char* filename);

OMSAPI oms_status_enu_t OMSCALL oms_setLoggingInterval(const char* cref, double loggingInterval);
OMSAPI oms_status_enu_t OMSCALL oms_setLoggingLevel(int logLevel);
OMSAPI void OMSCALL oms_setMaxLogFileSize(const unsigned long size);
OMSAPI oms_status_enu_t OMSCALL oms_setReal(const char* cref, double value);
OMSAPI oms_status_enu_t OMSCALL oms_setRealInputDerivative(const char* cref, double value);
OMSAPI oms_status_enu_t OMSCALL oms_setResultFile(const char* cref, const char* filename, int bufferSize);
OMSAPI oms_status_enu_t OMSCALL oms_setSignalFilter(const char* cref, const char* regex);
OMSAPI oms_status_enu_t OMSCALL oms_setSolver(const char* cref, oms_solver_enu_t solver);
OMSAPI oms_status_enu_t OMSCALL oms_setStartTime(const char* cref, double startTime);
OMSAPI oms_status_enu_t OMSCALL oms_setStopTime(const char* cref, double stopTime);
OMSAPI oms_status_enu_t OMSCALL oms_setTempDirectory(const char* newTempDir);
OMSAPI oms_status_enu_t OMSCALL oms_setTLMPositionAndOrientation(const char *cref, double x1, double x2, double x3, double A11, double A12, double A13, double A21, double A22, double A23, double A31, double A32, double A33);
OMSAPI oms_status_enu_t OMSCALL oms_setTLMSocketData(const char* cref, const char* address, int managerPort, int monitorPort);
OMSAPI oms_status_enu_t OMSCALL oms_setTolerance(const char* cref, double absoluteTolerance, double relativeTolerance);
OMSAPI oms_status_enu_t OMSCALL oms_setVariableStepSize(const char* cref, double initialStepSize, double minimumStepSize, double maximumStepSize);
OMSAPI oms_status_enu_t OMSCALL oms_setWorkingDirectory(const char* newWorkingDir);
OMSAPI oms_status_enu_t OMSCALL oms_simulate(const char* cref);
OMSAPI oms_status_enu_t OMSCALL oms_stepUntil(const char* cref, double stopTime);
OMSAPI oms_status_enu_t OMSCALL oms_terminate(const char* cref);

"""

ident = Word(alphas, alphanums + "_")
elementRef = Combine( Optional( Word( "const " )) + ident +  Optional( Word( "*" )), adjacent= False )

#vartype = Combine( Oneof("float double int char const") + Optional(Word("*")), adjacent= False)
vartype = elementRef
arglist = delimitedList( Group(vartype.setResultsName("type") + ident.setResultsName("name")))
functionCall = ident + ident.setResultsName("name") + "(" + arglist.setResultsName("args") + ")" + ";"


typeenumlist=["oms_status_enu_t","oms_modelState_enu_t","oms_causality_enu_t","oms_tlm_interpolation_t",
              "oms_fault_type_enu_t","oms_tlm_domain_t","oms_solver_enu_t","oms_element_enu_t","oms_system_enu_t",
              "oms_component_enu_t","oms_signal_type_enu_t","oms_connection_type_enu_t","oms_message_type_enu_t",
              "oms_fmi_kind_enu_t","oms_fmi_kind_enu_t*"]

indent1=" "
indent2="  "
indent4="    "
indent6="      "
indent8="        "
indent10="          "

"""
Function which generates Openmodelica package
Util/OMSimulator.mo, this is a standalone file
"""
def generatePackageOMSimulator():
    OMSimulator=open("OMSimulator.mo","w")

    packheader="""
encapsulated package OMSimulator
" file:         OMSimulator.mo
  package:     OMSimulator
  description: This file contains OMSimulator wrapper functions which are implemented in  C and Linked through DLL.
  "
""" 
    OMSimulator.write(packheader)
    OMSimulator.write("\n")
    for fn,s,e in functionCall.scanString(headers):
        print ("function name : ", fn.name)
        function_header="".join(["function"," ",fn.name,"\n"])
        OMSimulator.write(function_header)
        #indent1=" "
        #indent2="  "
        fnargsname=[]
        for a in fn.args:
            print ("----function type:", a.type);
            print ("----function name:",a.name);
            if(a.name=="type"):
                a.name="type_"
            if (a.type=="const char*" or a.type=="char*" or a.type=="char *" or a.type=="char" or a.type=="const char**" or a.type=="char**"):
                inputargs="".join([indent2,"input",indent1,"String",indent1,a.name,";","\n"])
                fnargsname.append(a.name)
                OMSimulator.write(inputargs)
            elif(a.type== "float" or a.type=="double" or a.type=="double*" or a.type=="float*"):
                inputargs="".join([indent2,"input",indent1,"Real",indent1,a.name,";","\n"])
                fnargsname.append(a.name)
                OMSimulator.write(inputargs)
           # elif(a.type=="oms_status_enu_t" or a.type=="oms_modelstate_enu_t" or a.type=="oms_causality_enu_t" or a.type=="oms_tlm_interpolation_t" or a.type=="oms_fault_type_enu_t" or a.type=="oms_tlm_domain_t"):
               # inputargs="".join([indent2,"input",indent1,"integer",indent1,a.name,";","\n"])
               # fnargsname.append(a.name)             
               # omsimulator.write(inputargs)
            elif(a.type in typeenumlist or a.type=="int" or a.type=="int*"):
                inputargs="".join([indent2,"input",indent1,"Integer",indent1,a.name,";","\n"])
                fnargsname.append(a.name)             
                OMSimulator.write(inputargs)
            else:
                inputargs="".join([indent2,"input",indent1,a.type,indent2,a.name,";","\n"])
                fnargsname.append(a.name)
                OMSimulator.write(inputargs)
        outputargs="".join([indent2,"output",indent1,"Integer",indent1,"status",";","\n"])
        fnarglist=",".join(fnargsname)
        externalargs="".join([indent2,"external \"C\" status = OMSimulator_",fn.name,"(",fnarglist ,")", " annotation(Library = \"omcruntime\");","\n"])
        OMSimulator.write(outputargs)
        OMSimulator.write(externalargs)
        function_end="".join(["end"," ",fn.name,";"])
        OMSimulator.write(function_end)
        OMSimulator.write("\n\n")
    OMSimulator.write("end OMSimulator;")
    OMSimulator.close()

"""
Function which generates Functions in  ModelicaBuiltin.mo 
Frontend/ModelicaBuiltin.mo
"""
def generateOMSimulatorBuiltin():
    OMSimulatorBuiltinmo=open("ModelicaBuiltin.mo","w")
    for fn,s,e in functionCall.scanString(headers):
        #print ("function name : ", fn.name)
        function_header="".join(["function"," ",fn.name,"\n"])
        OMSimulatorBuiltinmo.write(function_header)
        #indent1=" "
        #indent2="  "
        for a in fn.args:
            #print ("----function type:", a.type);
            #print ("----function name:",a.name);
            if(a.name=="type"):
                a.name="type_"
            if (a.type=="const char*" or a.type=="char*" or a.type=="char *" or a.type=="char" or a.type=="const char**" or a.type=="char**"):
                inputargs="".join([indent2,"input",indent1,"String",indent1,a.name,";","\n"])
                OMSimulatorBuiltinmo.write(inputargs)
            elif(a.type== "float" or a.type=="double"):
                inputargs="".join([indent2,"input",indent1,"Real",indent1,a.name,";","\n"])
                OMSimulatorBuiltinmo.write(inputargs)
            elif(a.type=="int"):
                inputargs="".join([indent2,"input",indent1,"Integer",indent1,a.name,";","\n"])
                OMSimulatorBuiltinmo.write(inputargs)
            else:
                inputargs="".join([indent2,"input",indent1,a.type,indent2,a.name,";","\n"])
                OMSimulatorBuiltinmo.write(inputargs)
        outputargs="".join([indent2,"output",indent1,"Integer",indent1,"status",";","\n"])
        #fnarglist=",".join(fnargsname)
        externalargs="".join(["external \"builtin\"",";","\n","annotation(preferredView=\"text\");","\n"])
        OMSimulatorBuiltinmo.write(outputargs)
        OMSimulatorBuiltinmo.write(externalargs)
        function_end="".join(["end"," ",fn.name,";"])
        OMSimulatorBuiltinmo.write(function_end)
        OMSimulatorBuiltinmo.write("\n\n")
    OMSimulatorBuiltinmo.close()


"""
Function which generates  c Functions structure 
Compiler/runtime/OMSimulator_omc.c
"""

def generateOMSimulatorExternal():
    OMSimulator_omc=open("OMSimulator_omc.c","w")
    cheaders="""
#include <stdio.h>
#include <stdbool.h>
#include "settingsimpl.h"
#include "meta_modelica.h"
#include "ModelicaUtilities.h"
#include "omc_config.h"

#if defined WIN32
  #include <windows.h>
  static HINSTANCE OMSimulatorDLL = NULL;
  #define AddressOf GetProcAddress
  #define freeDLL FreeLibrary
#else
  #include <dlfcn.h>
  static void * OMSimulatorDLL = NULL;
  #define AddressOf dlsym
  #define freeDLL dlclose
#endif

"""
    OMSimulator_omc.write(cheaders)
    OMSimulator_omc.write("\n\n")
      
    """
    generate function Signature typedef declarations and NULL pointers
    (eg) typedef int (*fnptr_oms_instantiate)(char*);
         static fnptr_oms_instantiate oms_instantiate = NULL;
    """
    for fn,s,e in functionCall.scanString(headers):
        staticdeclaration="".join(["typedef int",indent1,"(*fnptr_",fn.name,")"])
        fntype=[]
        for a in fn.args:
            if(a.type in typeenumlist):
                a.type="int";
            fntype.append(a.type) 
        fnarglist=",".join(fntype)
        fulltypedef="".join([staticdeclaration,"(",fnarglist,");","\n"])
        OMSimulator_omc.write(fulltypedef)
        staticdeclaration1="".join(["static fnptr_",fn.name,indent1,fn.name, " = NULL;","\n"])
        OMSimulator_omc.write(staticdeclaration1)
        OMSimulator_omc.write("\n")
    OMSimulator_omc.write("\n")

    """
    generate void resolveFunctionNames() 
    (eg.) oms_addBus = (fnptr_oms_addBus)AddressOf(OMSimulatorDLL, "oms_addBus");
    """
    functiondef="".join(["void resolveFunctionNames()","\n","{\n"])
    OMSimulator_omc.write(functiondef)
    for fn,s,e in functionCall.scanString(headers):
        functionsignature="".join([indent2,fn.name,indent1,"=",indent1,"(fnptr_",fn.name,")","AddressOf(OMSimulatorDLL,",indent1,"\"",fn.name,"\"",");\n"])
        OMSimulator_omc.write(functionsignature)

    OMSimulator_omc.write("}\n\n")
        
    for fn,s,e in functionCall.scanString(headers):
        print ("function name : ", fn.name)
        function_header="".join(["extern const int OMSimulator_",fn.name,"("])
        OMSimulator_omc.write(function_header)
        fnargsname=[]
        first=True
        for a in fn.args:
            if(first):
                seperator=""
                first=False
            else:
                seperator=", "
            if(a.type in typeenumlist):
                inputargs="".join([seperator,"int",indent1,a.name])
                fnargsname.append(a.name)             
                OMSimulator_omc.write(inputargs)
            else:
                inputargs="".join([seperator,a.type,indent1,a.name])
                fnargsname.append(a.name)
                OMSimulator_omc.write(inputargs)
        function_header_end="".join([")","\n"])
        OMSimulator_omc.write(")\n")
        function_body_start="".join(["{","\n"])
        OMSimulator_omc.write(function_body_start)
        #function_load_statement="".join([indent2,"loadDLL();","\n"])
        #OMSimulator_omc.write(function_load_statement)
        errormsg="".join(["Could not Locate the Function ",fn.name,"\\","n"])
        function_if_statement="".join([indent2,"if","(!",fn.name,")","\n",indent2,"{\n",indent4,"printf(","\"",errormsg, "\"",");","\n",indent4,"exit(0);\n",indent2,"}\n"])
        OMSimulator_omc.write(function_if_statement)
        fnarglist=",".join(fnargsname)
        function_main_statement="".join([indent2,"int status = ",fn.name,"(",fnarglist,");","\n",indent2,"return status;\n"])
        OMSimulator_omc.write(function_main_statement)
        OMSimulator_omc.write("}\n\n")
    OMSimulator_omc.close()

"""
Function which generates package CevalScriptOMSimulator.mo
Compiler/Script/CevalScriptOMSimulator.mo, this generates 
around 95 % correect code
"""
def generateCevalScriptOMSimulator():
    OMSimulator_ceval=open("CevalScriptOMSimulator.mo","w")
    packheader="""
encapsulated package CevalScriptOMSimulator
" file:        CevalScript.mo
  package:     CevalScript
  description: Constant propagation of expressions
  This module handles scripting.
  Input:
    String: Function Name
    Value: Function arguments
  Output:
    Value: The evaluated value."

import Values;
import OMSimulator;
import List;

public function ceval
  input String inFunctionName;
  input list<Values.Value> inVals;
  output Values.Value outValue;
algorithm
  (outValue) := matchcontinue (inFunctionName,inVals)
    local
"""
    OMSimulator_ceval.write(packheader)
    stringtypes=[]
    RealTypes=[]
    IntegerTypes=["status"]
    for fn,s,e in functionCall.scanString(headers):
        function_header="".join(["function"," ",fn.name,"\n"])
        #indent1=" "
        #indent2="  "
        for a in fn.args:
            #print ("----function type:", a.type);
            #print ("----function name:",a.name);
            if(a.name=="type"):
                a.name="type_"
            if (a.type=="const char*" or a.type=="char*" or a.type=="char *" or a.type=="char" or a.type=="const char**" or a.type=="char**"):
                inputargs="".join([indent2,"input",indent1,"String",indent1,a.name,";","\n"])
                stringtypes.append(a.name)
            elif(a.type== "float" or a.type=="double"):
                inputargs="".join([indent2,"input",indent1,"Real",indent1,a.name,";","\n"])
                RealTypes.append(a.name)
            elif(a.type in typeenumlist or a.type=="int"):
                inputargs="".join([indent2,"input",indent1,"Integer",indent1,a.name,";","\n"])
                IntegerTypes.append(a.name)   
    stringtypes = list(dict.fromkeys(stringtypes))
    RealTypes = list(dict.fromkeys(RealTypes))
    IntegerTypes = list(dict.fromkeys(IntegerTypes))

    print(stringtypes)
    print(RealTypes)
    print(IntegerTypes)

    stringtemp="".join([indent6,"String",indent1,",".join(stringtypes),";\n"])
    Realtemp="".join([indent6,"Real",indent1,",".join(RealTypes),";\n"])
    IntegerTypes="".join([indent6,"Integer",indent1,",".join(IntegerTypes),";\n"])

    OMSimulator_ceval.write(stringtemp)
    OMSimulator_ceval.write(Realtemp)
    OMSimulator_ceval.write(IntegerTypes)
    OMSimulator_ceval.write("\n\n\n");


    ## write match continue cases here
    for fn,s,e in functionCall.scanString(headers):
        case_header="".join([indent4,"case(","\"",fn.name,"\"",",","{"])
        OMSimulator_ceval.write(case_header)
        fnargsname=[]
        first=True
        for a in fn.args:
            #print ("----function type:", a.type);
            #print ("----function name:",a.name);
            if(first):
                seperator=""
                first=False
            else:
                seperator=", "
            if(a.name=="type"):
                a.name="type_"
            if (a.type=="const char*" or a.type=="char*" or a.type=="char *" or a.type=="char" or a.type=="const char**" or a.type=="char**"):
                inputargs="".join([seperator,"Values.STRING(",a.name,")"])
                fnargsname.append(a.name)
                OMSimulator_ceval.write(inputargs)
            elif(a.type== "float" or a.type=="double"):
                inputargs="".join([seperator,"Values.REAL(",a.name,")"])
                fnargsname.append(a.name)
                OMSimulator_ceval.write(inputargs)
            elif(a.type=="int"):
                inputargs="".join([seperator,"Values.INTEGER(",a.name,")"])
                fnargsname.append(a.name)
                OMSimulator_ceval.write(inputargs)
            elif(a.type in typeenumlist):
                inputargs="".join([seperator,"Values.ENUM_LITERAL(index=",a.name,")"])
                fnargsname.append(a.name+"-"+"1")
                OMSimulator_ceval.write(inputargs)
        OMSimulator_ceval.write("})\n");
        case_statements="".join([indent6,"equation","\n",indent8,"status = ","OMSimulator.",fn.name,"(",",".join(fnargsname),");\n"]) 
        OMSimulator_ceval.write(case_statements)
        then_statements="".join([indent6,"then","\n",indent8,"Values.INTEGER(status);","\n\n"])
        OMSimulator_ceval.write(then_statements)
        end_statements="""
  end matchcontinue;
end ceval;
annotation(__OpenModelica_Interface="backend");
end CevalScriptOMSimulator;
"""       
    OMSimulator_ceval.write(end_statements)
    OMSimulator_ceval.close()

if __name__ == "__main__":
    generatePackageOMSimulator() ## OMSimulator.mo
    generateOMSimulatorBuiltin() ## generate functions in ModelicaBuiltin.mo
    generateOMSimulatorExternal()  ## generate c file OMSimulator_omc.c
    generateCevalScriptOMSimulator() ## generate 95% package CevalScriptOMSimulator.mo  correctly 
    
    
    
    
    
    
    