function oms_addBus
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addBus;

function oms_addConnection
  input String crefA;
  input String crefB;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addConnection;

function oms_addConnector
  input String cref;
  input oms_causality_enu_t  causality;
  input oms_signal_type_enu_t  type_;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addConnector;

function oms_addConnectorToBus
  input String busCref;
  input String connectorCref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addConnectorToBus;

function oms_addConnectorToTLMBus
  input String busCref;
  input String connectorCref;
  input String type_;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addConnectorToTLMBus;

function oms_addDynamicValueIndicator
  input String signal;
  input String lower;
  input String upper;
  input Real stepSize;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addDynamicValueIndicator;

function oms_addEventIndicator
  input String signal;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addEventIndicator;

function oms_addExternalModel
  input String cref;
  input String path;
  input String startscript;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addExternalModel;

function oms_addSignalsToResults
  input String cref;
  input String regex;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addSignalsToResults;

function oms_addStaticValueIndicator
  input String signal;
  input Real lower;
  input Real upper;
  input Real stepSize;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addStaticValueIndicator;

function oms_addSubModel
  input String cref;
  input String fmuPath;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addSubModel;

function oms_addSystem
  input String cref;
  input oms_system_enu_t  type_;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addSystem;

function oms_addTimeIndicator
  input String signal;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addTimeIndicator;

function oms_addTLMBus
  input String cref;
  input oms_tlm_domain_t  domain;
  input const int  dimensions;
  input const oms_tlm_interpolation_t  interpolation;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addTLMBus;

function oms_addTLMConnection
  input String crefA;
  input String crefB;
  input Real delay;
  input Real alpha;
  input Real linearimpedance;
  input Real angularimpedance;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_addTLMConnection;

function oms_cancelSimulation_asynchronous
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_cancelSimulation_asynchronous;

function oms_compareSimulationResults
  input String filenameA;
  input String filenameB;
  input String var;
  input Real relTol;
  input Real absTol;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_compareSimulationResults;

function oms_copySystem
  input String source;
  input String target;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_copySystem;

function oms_delete
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_delete;

function oms_deleteConnection
  input String crefA;
  input String crefB;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_deleteConnection;

function oms_deleteConnectorFromBus
  input String busCref;
  input String connectorCref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_deleteConnectorFromBus;

function oms_deleteConnectorFromTLMBus
  input String busCref;
  input String connectorCref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_deleteConnectorFromTLMBus;

function oms_export
  input String cref;
  input String filename;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_export;

function oms_exportDependencyGraphs
  input String cref;
  input String initialization;
  input String simulation;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_exportDependencyGraphs;

function oms_extractFMIKind
  input String filename;
  input oms_fmi_kind_enu_t*  kind;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_extractFMIKind;

function oms_getBoolean
  input String cref;
  input bool*  value;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getBoolean;

function oms_getFixedStepSize
  input String cref;
  input double*  stepSize;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getFixedStepSize;

function oms_getInteger
  input String cref;
  input int*  value;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getInteger;

function oms_getModelState
  input String cref;
  input oms_modelState_enu_t*  modelState;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getModelState;

function oms_getReal
  input String cref;
  input double*  value;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getReal;

function oms_getSolver
  input String cref;
  input oms_solver_enu_t*  solver;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getSolver;

function oms_getStartTime
  input String cref;
  input double*  startTime;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getStartTime;

function oms_getStopTime
  input String cref;
  input double*  stopTime;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getStopTime;

function oms_getSubModelPath
  input String cref;
  input String path;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getSubModelPath;

function oms_getSystemType
  input String cref;
  input oms_system_enu_t*  type_;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getSystemType;

function oms_getTolerance
  input String cref;
  input double*  absoluteTolerance;
  input double*  relativeTolerance;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getTolerance;

function oms_getVariableStepSize
  input String cref;
  input double*  initialStepSize;
  input double*  minimumStepSize;
  input double*  maximumStepSize;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_getVariableStepSize;

function oms_faultInjection
  input String signal;
  input oms_fault_type_enu_t  faultType;
  input Real faultValue;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_faultInjection;

function oms_importFile
  input String filename;
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_importFile;

function oms_initialize
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_initialize;

function oms_instantiate
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_instantiate;

function oms_list
  input String cref;
  input String contents;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_list;

function oms_listUnconnectedConnectors
  input String cref;
  input String contents;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_listUnconnectedConnectors;

function oms_loadSnapshot
  input String cref;
  input String snapshot;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_loadSnapshot;

function oms_newModel
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_newModel;

function oms_parseModelName
  input String contents;
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_parseModelName;

function oms_removeSignalsFromResults
  input String cref;
  input String regex;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_removeSignalsFromResults;

function oms_rename
  input String cref;
  input String newCref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_rename;

function oms_reset
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_reset;

function oms_RunFile
  input String filename;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_RunFile;

function oms_setBoolean
  input String cref;
  input bool  value;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setBoolean;

function oms_setCommandLineOption
  input String cmd;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setCommandLineOption;

function oms_setFixedStepSize
  input String cref;
  input Real stepSize;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setFixedStepSize;

function oms_setInteger
  input String cref;
  input Integer value;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setInteger;

function oms_setLogFile
  input String filename;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setLogFile;

function oms_setLoggingInterval
  input String cref;
  input Real loggingInterval;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setLoggingInterval;

function oms_setLoggingLevel
  input Integer logLevel;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setLoggingLevel;

function oms_setReal
  input String cref;
  input Real value;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setReal;

function oms_setRealInputDerivative
  input String cref;
  input Real value;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setRealInputDerivative;

function oms_setResultFile
  input String cref;
  input String filename;
  input Integer bufferSize;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setResultFile;

function oms_setSignalFilter
  input String cref;
  input String regex;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setSignalFilter;

function oms_setSolver
  input String cref;
  input oms_solver_enu_t  solver;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setSolver;

function oms_setStartTime
  input String cref;
  input Real startTime;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setStartTime;

function oms_setStopTime
  input String cref;
  input Real stopTime;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setStopTime;

function oms_setTempDirectory
  input String newTempDir;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setTempDirectory;

function oms_setTLMPositionAndOrientation
  input String cref;
  input Real x1;
  input Real x2;
  input Real x3;
  input Real A11;
  input Real A12;
  input Real A13;
  input Real A21;
  input Real A22;
  input Real A23;
  input Real A31;
  input Real A32;
  input Real A33;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setTLMPositionAndOrientation;

function oms_setTLMSocketData
  input String cref;
  input String address;
  input Integer managerPort;
  input Integer monitorPort;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setTLMSocketData;

function oms_setTolerance
  input String cref;
  input Real absoluteTolerance;
  input Real relativeTolerance;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setTolerance;

function oms_setVariableStepSize
  input String cref;
  input Real initialStepSize;
  input Real minimumStepSize;
  input Real maximumStepSize;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setVariableStepSize;

function oms_setWorkingDirectory
  input String newWorkingDir;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_setWorkingDirectory;

function oms_simulate
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_simulate;

function oms_stepUntil
  input String cref;
  input Real stopTime;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_stepUntil;

function oms_terminate
  input String cref;
  output Integer status;
external "builtin";
annotation(preferredView="text");
end oms_terminate;

