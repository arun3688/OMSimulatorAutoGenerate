
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
      String cref,crefA,crefB,busCref,connectorCref,type_,signal,lower,upper,path,startscript,regex,fmuPath,filenameA,filenameB,var,source,target,filename,initialization,simulation,contents,snapshot,newCref,cmd,newTempDir,address,newWorkingDir;
      Real stepSize,lower,upper,delay,alpha,linearimpedance,angularimpedance,relTol,absTol,faultValue,loggingInterval,value,startTime,stopTime,x1,x2,x3,A11,A12,A13,A21,A22,A23,A31,A32,A33,absoluteTolerance,relativeTolerance,initialStepSize,minimumStepSize,maximumStepSize;
      Integer status,causality,type_,domain,kind,faultType,value,logLevel,bufferSize,solver,managerPort,monitorPort;



    case("oms_addBus",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_addBus(cref);
      then
        Values.INTEGER(status);

    case("oms_addConnection",{Values.STRING(crefA), Values.STRING(crefB)})
      equation
        status = OMSimulator.oms_addConnection(crefA,crefB);
      then
        Values.INTEGER(status);

    case("oms_addConnector",{Values.STRING(cref), Values.ENUM_LITERAL(index=causality), Values.ENUM_LITERAL(index=type_)})
      equation
        status = OMSimulator.oms_addConnector(cref,causality-1,type_-1);
      then
        Values.INTEGER(status);

    case("oms_addConnectorToBus",{Values.STRING(busCref), Values.STRING(connectorCref)})
      equation
        status = OMSimulator.oms_addConnectorToBus(busCref,connectorCref);
      then
        Values.INTEGER(status);

    case("oms_addConnectorToTLMBus",{Values.STRING(busCref), Values.STRING(connectorCref), Values.STRING(type_)})
      equation
        status = OMSimulator.oms_addConnectorToTLMBus(busCref,connectorCref,type_);
      then
        Values.INTEGER(status);

    case("oms_addDynamicValueIndicator",{Values.STRING(signal), Values.STRING(lower), Values.STRING(upper), Values.REAL(stepSize)})
      equation
        status = OMSimulator.oms_addDynamicValueIndicator(signal,lower,upper,stepSize);
      then
        Values.INTEGER(status);

    case("oms_addEventIndicator",{Values.STRING(signal)})
      equation
        status = OMSimulator.oms_addEventIndicator(signal);
      then
        Values.INTEGER(status);

    case("oms_addExternalModel",{Values.STRING(cref), Values.STRING(path), Values.STRING(startscript)})
      equation
        status = OMSimulator.oms_addExternalModel(cref,path,startscript);
      then
        Values.INTEGER(status);

    case("oms_addSignalsToResults",{Values.STRING(cref), Values.STRING(regex)})
      equation
        status = OMSimulator.oms_addSignalsToResults(cref,regex);
      then
        Values.INTEGER(status);

    case("oms_addStaticValueIndicator",{Values.STRING(signal), Values.REAL(lower), Values.REAL(upper), Values.REAL(stepSize)})
      equation
        status = OMSimulator.oms_addStaticValueIndicator(signal,lower,upper,stepSize);
      then
        Values.INTEGER(status);

    case("oms_addSubModel",{Values.STRING(cref), Values.STRING(fmuPath)})
      equation
        status = OMSimulator.oms_addSubModel(cref,fmuPath);
      then
        Values.INTEGER(status);

    case("oms_addSystem",{Values.STRING(cref), Values.ENUM_LITERAL(index=type_)})
      equation
        status = OMSimulator.oms_addSystem(cref,type_-1);
      then
        Values.INTEGER(status);

    case("oms_addTimeIndicator",{Values.STRING(signal)})
      equation
        status = OMSimulator.oms_addTimeIndicator(signal);
      then
        Values.INTEGER(status);

    case("oms_addTLMBus",{Values.STRING(cref), Values.ENUM_LITERAL(index=domain)})
      equation
        status = OMSimulator.oms_addTLMBus(cref,domain-1);
      then
        Values.INTEGER(status);

    case("oms_addTLMConnection",{Values.STRING(crefA), Values.STRING(crefB), Values.REAL(delay), Values.REAL(alpha), Values.REAL(linearimpedance), Values.REAL(angularimpedance)})
      equation
        status = OMSimulator.oms_addTLMConnection(crefA,crefB,delay,alpha,linearimpedance,angularimpedance);
      then
        Values.INTEGER(status);

    case("oms_cancelSimulation_asynchronous",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_cancelSimulation_asynchronous(cref);
      then
        Values.INTEGER(status);

    case("oms_compareSimulationResults",{Values.STRING(filenameA), Values.STRING(filenameB), Values.STRING(var), Values.REAL(relTol), Values.REAL(absTol)})
      equation
        status = OMSimulator.oms_compareSimulationResults(filenameA,filenameB,var,relTol,absTol);
      then
        Values.INTEGER(status);

    case("oms_copySystem",{Values.STRING(source), Values.STRING(target)})
      equation
        status = OMSimulator.oms_copySystem(source,target);
      then
        Values.INTEGER(status);

    case("oms_delete",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_delete(cref);
      then
        Values.INTEGER(status);

    case("oms_deleteConnection",{Values.STRING(crefA), Values.STRING(crefB)})
      equation
        status = OMSimulator.oms_deleteConnection(crefA,crefB);
      then
        Values.INTEGER(status);

    case("oms_deleteConnectorFromBus",{Values.STRING(busCref), Values.STRING(connectorCref)})
      equation
        status = OMSimulator.oms_deleteConnectorFromBus(busCref,connectorCref);
      then
        Values.INTEGER(status);

    case("oms_deleteConnectorFromTLMBus",{Values.STRING(busCref), Values.STRING(connectorCref)})
      equation
        status = OMSimulator.oms_deleteConnectorFromTLMBus(busCref,connectorCref);
      then
        Values.INTEGER(status);

    case("oms_export",{Values.STRING(cref), Values.STRING(filename)})
      equation
        status = OMSimulator.oms_export(cref,filename);
      then
        Values.INTEGER(status);

    case("oms_exportDependencyGraphs",{Values.STRING(cref), Values.STRING(initialization), Values.STRING(simulation)})
      equation
        status = OMSimulator.oms_exportDependencyGraphs(cref,initialization,simulation);
      then
        Values.INTEGER(status);

    case("oms_extractFMIKind",{Values.STRING(filename), Values.ENUM_LITERAL(index=kind)})
      equation
        status = OMSimulator.oms_extractFMIKind(filename,kind-1);
      then
        Values.INTEGER(status);

    case("oms_getBoolean",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getBoolean(cref);
      then
        Values.INTEGER(status);

    case("oms_getFixedStepSize",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getFixedStepSize(cref);
      then
        Values.INTEGER(status);

    case("oms_getInteger",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getInteger(cref);
      then
        Values.INTEGER(status);

    case("oms_getModelState",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getModelState(cref);
      then
        Values.INTEGER(status);

    case("oms_getReal",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getReal(cref);
      then
        Values.INTEGER(status);

    case("oms_getSolver",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getSolver(cref);
      then
        Values.INTEGER(status);

    case("oms_getStartTime",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getStartTime(cref);
      then
        Values.INTEGER(status);

    case("oms_getStopTime",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getStopTime(cref);
      then
        Values.INTEGER(status);

    case("oms_getSubModelPath",{Values.STRING(cref), Values.STRING(path)})
      equation
        status = OMSimulator.oms_getSubModelPath(cref,path);
      then
        Values.INTEGER(status);

    case("oms_getSystemType",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getSystemType(cref);
      then
        Values.INTEGER(status);

    case("oms_getTolerance",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getTolerance(cref);
      then
        Values.INTEGER(status);

    case("oms_getVariableStepSize",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_getVariableStepSize(cref);
      then
        Values.INTEGER(status);

    case("oms_faultInjection",{Values.STRING(signal), Values.ENUM_LITERAL(index=faultType), Values.REAL(faultValue)})
      equation
        status = OMSimulator.oms_faultInjection(signal,faultType-1,faultValue);
      then
        Values.INTEGER(status);

    case("oms_importFile",{Values.STRING(filename), Values.STRING(cref)})
      equation
        status = OMSimulator.oms_importFile(filename,cref);
      then
        Values.INTEGER(status);

    case("oms_initialize",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_initialize(cref);
      then
        Values.INTEGER(status);

    case("oms_instantiate",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_instantiate(cref);
      then
        Values.INTEGER(status);

    case("oms_list",{Values.STRING(cref), Values.STRING(contents)})
      equation
        status = OMSimulator.oms_list(cref,contents);
      then
        Values.INTEGER(status);

    case("oms_listUnconnectedConnectors",{Values.STRING(cref), Values.STRING(contents)})
      equation
        status = OMSimulator.oms_listUnconnectedConnectors(cref,contents);
      then
        Values.INTEGER(status);

    case("oms_loadSnapshot",{Values.STRING(cref), Values.STRING(snapshot)})
      equation
        status = OMSimulator.oms_loadSnapshot(cref,snapshot);
      then
        Values.INTEGER(status);

    case("oms_newModel",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_newModel(cref);
      then
        Values.INTEGER(status);

    case("oms_parseModelName",{Values.STRING(contents), Values.STRING(cref)})
      equation
        status = OMSimulator.oms_parseModelName(contents,cref);
      then
        Values.INTEGER(status);

    case("oms_removeSignalsFromResults",{Values.STRING(cref), Values.STRING(regex)})
      equation
        status = OMSimulator.oms_removeSignalsFromResults(cref,regex);
      then
        Values.INTEGER(status);

    case("oms_rename",{Values.STRING(cref), Values.STRING(newCref)})
      equation
        status = OMSimulator.oms_rename(cref,newCref);
      then
        Values.INTEGER(status);

    case("oms_reset",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_reset(cref);
      then
        Values.INTEGER(status);

    case("oms_RunFile",{Values.STRING(filename)})
      equation
        status = OMSimulator.oms_RunFile(filename);
      then
        Values.INTEGER(status);

    case("oms_setBoolean",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_setBoolean(cref);
      then
        Values.INTEGER(status);

    case("oms_setCommandLineOption",{Values.STRING(cmd)})
      equation
        status = OMSimulator.oms_setCommandLineOption(cmd);
      then
        Values.INTEGER(status);

    case("oms_setFixedStepSize",{Values.STRING(cref), Values.REAL(stepSize)})
      equation
        status = OMSimulator.oms_setFixedStepSize(cref,stepSize);
      then
        Values.INTEGER(status);

    case("oms_setInteger",{Values.STRING(cref), Values.INTEGER(value)})
      equation
        status = OMSimulator.oms_setInteger(cref,value);
      then
        Values.INTEGER(status);

    case("oms_setLogFile",{Values.STRING(filename)})
      equation
        status = OMSimulator.oms_setLogFile(filename);
      then
        Values.INTEGER(status);

    case("oms_setLoggingInterval",{Values.STRING(cref), Values.REAL(loggingInterval)})
      equation
        status = OMSimulator.oms_setLoggingInterval(cref,loggingInterval);
      then
        Values.INTEGER(status);

    case("oms_setLoggingLevel",{Values.INTEGER(logLevel)})
      equation
        status = OMSimulator.oms_setLoggingLevel(logLevel);
      then
        Values.INTEGER(status);

    case("oms_setReal",{Values.STRING(cref), Values.REAL(value)})
      equation
        status = OMSimulator.oms_setReal(cref,value);
      then
        Values.INTEGER(status);

    case("oms_setRealInputDerivative",{Values.STRING(cref), Values.REAL(value)})
      equation
        status = OMSimulator.oms_setRealInputDerivative(cref,value);
      then
        Values.INTEGER(status);

    case("oms_setResultFile",{Values.STRING(cref), Values.STRING(filename), Values.INTEGER(bufferSize)})
      equation
        status = OMSimulator.oms_setResultFile(cref,filename,bufferSize);
      then
        Values.INTEGER(status);

    case("oms_setSignalFilter",{Values.STRING(cref), Values.STRING(regex)})
      equation
        status = OMSimulator.oms_setSignalFilter(cref,regex);
      then
        Values.INTEGER(status);

    case("oms_setSolver",{Values.STRING(cref), Values.ENUM_LITERAL(index=solver)})
      equation
        status = OMSimulator.oms_setSolver(cref,solver-1);
      then
        Values.INTEGER(status);

    case("oms_setStartTime",{Values.STRING(cref), Values.REAL(startTime)})
      equation
        status = OMSimulator.oms_setStartTime(cref,startTime);
      then
        Values.INTEGER(status);

    case("oms_setStopTime",{Values.STRING(cref), Values.REAL(stopTime)})
      equation
        status = OMSimulator.oms_setStopTime(cref,stopTime);
      then
        Values.INTEGER(status);

    case("oms_setTempDirectory",{Values.STRING(newTempDir)})
      equation
        status = OMSimulator.oms_setTempDirectory(newTempDir);
      then
        Values.INTEGER(status);

    case("oms_setTLMPositionAndOrientation",{Values.STRING(cref), Values.REAL(x1), Values.REAL(x2), Values.REAL(x3), Values.REAL(A11), Values.REAL(A12), Values.REAL(A13), Values.REAL(A21), Values.REAL(A22), Values.REAL(A23), Values.REAL(A31), Values.REAL(A32), Values.REAL(A33)})
      equation
        status = OMSimulator.oms_setTLMPositionAndOrientation(cref,x1,x2,x3,A11,A12,A13,A21,A22,A23,A31,A32,A33);
      then
        Values.INTEGER(status);

    case("oms_setTLMSocketData",{Values.STRING(cref), Values.STRING(address), Values.INTEGER(managerPort), Values.INTEGER(monitorPort)})
      equation
        status = OMSimulator.oms_setTLMSocketData(cref,address,managerPort,monitorPort);
      then
        Values.INTEGER(status);

    case("oms_setTolerance",{Values.STRING(cref), Values.REAL(absoluteTolerance), Values.REAL(relativeTolerance)})
      equation
        status = OMSimulator.oms_setTolerance(cref,absoluteTolerance,relativeTolerance);
      then
        Values.INTEGER(status);

    case("oms_setVariableStepSize",{Values.STRING(cref), Values.REAL(initialStepSize), Values.REAL(minimumStepSize), Values.REAL(maximumStepSize)})
      equation
        status = OMSimulator.oms_setVariableStepSize(cref,initialStepSize,minimumStepSize,maximumStepSize);
      then
        Values.INTEGER(status);

    case("oms_setWorkingDirectory",{Values.STRING(newWorkingDir)})
      equation
        status = OMSimulator.oms_setWorkingDirectory(newWorkingDir);
      then
        Values.INTEGER(status);

    case("oms_simulate",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_simulate(cref);
      then
        Values.INTEGER(status);

    case("oms_stepUntil",{Values.STRING(cref), Values.REAL(stopTime)})
      equation
        status = OMSimulator.oms_stepUntil(cref,stopTime);
      then
        Values.INTEGER(status);

    case("oms_terminate",{Values.STRING(cref)})
      equation
        status = OMSimulator.oms_terminate(cref);
      then
        Values.INTEGER(status);


  end matchcontinue;
end ceval;
annotation(__OpenModelica_Interface="backend");
end CevalScriptOMSimulator;
