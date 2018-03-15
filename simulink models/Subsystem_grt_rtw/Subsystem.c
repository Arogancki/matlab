/*
 * Subsystem.c
 *
 * Code generation for model "Subsystem".
 *
 * Model version              : 1.4
 * Simulink Coder version : 8.2 (R2012a) 29-Dec-2011
 * C source code generated on : Fri Dec 30 14:59:55 2016
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */
#include "Subsystem.h"
#include "Subsystem_private.h"

/* Block signals (auto storage) */
BlockIO_Subsystem Subsystem_B;

/* Continuous states */
ContinuousStates_Subsystem Subsystem_X;

/* External outputs (root outports fed by signals with auto storage) */
ExternalOutputs_Subsystem Subsystem_Y;

/* Real-time model */
RT_MODEL_Subsystem Subsystem_M_;
RT_MODEL_Subsystem *const Subsystem_M = &Subsystem_M_;

/*
 * This function updates continuous states using the ODE4 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE4_IntgData *id = (ODE4_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T *f3 = id->f[3];
  real_T temp;
  int_T i;
  int_T nXc = 2;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  Subsystem_derivatives();

  /* f1 = f(t + (h/2), y + (h/2)*f0) */
  temp = 0.5 * h;
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (temp*f0[i]);
  }

  rtsiSetT(si, t + temp);
  rtsiSetdX(si, f1);
  Subsystem_step();
  Subsystem_derivatives();

  /* f2 = f(t + (h/2), y + (h/2)*f1) */
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (temp*f1[i]);
  }

  rtsiSetdX(si, f2);
  Subsystem_step();
  Subsystem_derivatives();

  /* f3 = f(t + h, y + h*f2) */
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (h*f2[i]);
  }

  rtsiSetT(si, tnew);
  rtsiSetdX(si, f3);
  Subsystem_step();
  Subsystem_derivatives();

  /* tnew = t + h
     ynew = y + (h/6)*(f0 + 2*f1 + 2*f2 + 2*f3) */
  temp = h / 6.0;
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + temp*(f0[i] + 2.0*f1[i] + 2.0*f2[i] + f3[i]);
  }

  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model step function */
void Subsystem_step(void)
{
  if (rtmIsMajorTimeStep(Subsystem_M)) {
    /* set solver stop time */
    if (!(Subsystem_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&Subsystem_M->solverInfo,
                            ((Subsystem_M->Timing.clockTickH0 + 1) *
        Subsystem_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&Subsystem_M->solverInfo,
                            ((Subsystem_M->Timing.clockTick0 + 1) *
        Subsystem_M->Timing.stepSize0 + Subsystem_M->Timing.clockTickH0 *
        Subsystem_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(Subsystem_M)) {
    Subsystem_M->Timing.t[0] = rtsiGetT(&Subsystem_M->solverInfo);
  }

  /* Outport: '<Root>/Out1' incorporates:
   *  Integrator: '<S1>/Integrator1'
   */
  Subsystem_Y.Out1 = Subsystem_X.Integrator1_CSTATE;

  /* Integrator: '<S1>/Integrator' */
  Subsystem_B.Integrator = Subsystem_X.Integrator_CSTATE;

  /* Sum: '<S1>/Add' incorporates:
   *  Gain: '<S1>/Gain'
   *  Gain: '<S1>/Gain1'
   *  Integrator: '<S1>/Integrator1'
   *  Trigonometry: '<S1>/Trigonometric Function'
   */
  Subsystem_B.Add = (0.0 - Subsystem_P.Gain1_Gain * sin
                     (Subsystem_X.Integrator1_CSTATE)) - Subsystem_P.Gain_Gain *
    Subsystem_B.Integrator;
  if (rtmIsMajorTimeStep(Subsystem_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(Subsystem_M->rtwLogInfo, (Subsystem_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(Subsystem_M)) {
    rt_ertODEUpdateContinuousStates(&Subsystem_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++Subsystem_M->Timing.clockTick0)) {
      ++Subsystem_M->Timing.clockTickH0;
    }

    Subsystem_M->Timing.t[0] = rtsiGetSolverStopTime(&Subsystem_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.01s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.01, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       * Timer of this task consists of two 32 bit unsigned integers.
       * The two integers represent the low bits Timing.clockTick1 and the high bits
       * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
       */
      Subsystem_M->Timing.clockTick1++;
      if (!Subsystem_M->Timing.clockTick1) {
        Subsystem_M->Timing.clockTickH1++;
      }
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void Subsystem_derivatives(void)
{
  StateDerivatives_Subsystem *_rtXdot;
  _rtXdot = ((StateDerivatives_Subsystem *) Subsystem_M->ModelData.derivs);

  /* Derivatives for Integrator: '<S1>/Integrator1' */
  _rtXdot->Integrator1_CSTATE = Subsystem_B.Integrator;

  /* Derivatives for Integrator: '<S1>/Integrator' */
  _rtXdot->Integrator_CSTATE = Subsystem_B.Add;
}

/* Model initialize function */
void Subsystem_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)Subsystem_M, 0,
                sizeof(RT_MODEL_Subsystem));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&Subsystem_M->solverInfo,
                          &Subsystem_M->Timing.simTimeStep);
    rtsiSetTPtr(&Subsystem_M->solverInfo, &rtmGetTPtr(Subsystem_M));
    rtsiSetStepSizePtr(&Subsystem_M->solverInfo, &Subsystem_M->Timing.stepSize0);
    rtsiSetdXPtr(&Subsystem_M->solverInfo, &Subsystem_M->ModelData.derivs);
    rtsiSetContStatesPtr(&Subsystem_M->solverInfo,
                         &Subsystem_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&Subsystem_M->solverInfo,
      &Subsystem_M->Sizes.numContStates);
    rtsiSetErrorStatusPtr(&Subsystem_M->solverInfo, (&rtmGetErrorStatus
      (Subsystem_M)));
    rtsiSetRTModelPtr(&Subsystem_M->solverInfo, Subsystem_M);
  }

  rtsiSetSimTimeStep(&Subsystem_M->solverInfo, MAJOR_TIME_STEP);
  Subsystem_M->ModelData.intgData.y = Subsystem_M->ModelData.odeY;
  Subsystem_M->ModelData.intgData.f[0] = Subsystem_M->ModelData.odeF[0];
  Subsystem_M->ModelData.intgData.f[1] = Subsystem_M->ModelData.odeF[1];
  Subsystem_M->ModelData.intgData.f[2] = Subsystem_M->ModelData.odeF[2];
  Subsystem_M->ModelData.intgData.f[3] = Subsystem_M->ModelData.odeF[3];
  Subsystem_M->ModelData.contStates = ((real_T *) &Subsystem_X);
  rtsiSetSolverData(&Subsystem_M->solverInfo, (void *)
                    &Subsystem_M->ModelData.intgData);
  rtsiSetSolverName(&Subsystem_M->solverInfo,"ode4");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = Subsystem_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    Subsystem_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    Subsystem_M->Timing.sampleTimes = (&Subsystem_M->Timing.sampleTimesArray[0]);
    Subsystem_M->Timing.offsetTimes = (&Subsystem_M->Timing.offsetTimesArray[0]);

    /* task periods */
    Subsystem_M->Timing.sampleTimes[0] = (0.0);
    Subsystem_M->Timing.sampleTimes[1] = (0.01);

    /* task offsets */
    Subsystem_M->Timing.offsetTimes[0] = (0.0);
    Subsystem_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(Subsystem_M, &Subsystem_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = Subsystem_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    Subsystem_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(Subsystem_M, 100.0);
  Subsystem_M->Timing.stepSize0 = 0.01;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    Subsystem_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(Subsystem_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(Subsystem_M->rtwLogInfo, (NULL));
    rtliSetLogT(Subsystem_M->rtwLogInfo, "tout");
    rtliSetLogX(Subsystem_M->rtwLogInfo, "");
    rtliSetLogXFinal(Subsystem_M->rtwLogInfo, "");
    rtliSetSigLog(Subsystem_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(Subsystem_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(Subsystem_M->rtwLogInfo, 0);
    rtliSetLogMaxRows(Subsystem_M->rtwLogInfo, 1000);
    rtliSetLogDecimation(Subsystem_M->rtwLogInfo, 1);

    /*
     * Set pointers to the data and signal info for each output
     */
    {
      static void * rt_LoggedOutputSignalPtrs[] = {
        &Subsystem_Y.Out1
      };

      rtliSetLogYSignalPtrs(Subsystem_M->rtwLogInfo, ((LogSignalPtrsType)
        rt_LoggedOutputSignalPtrs));
    }

    {
      static int_T rt_LoggedOutputWidths[] = {
        1
      };

      static int_T rt_LoggedOutputNumDimensions[] = {
        1
      };

      static int_T rt_LoggedOutputDimensions[] = {
        1
      };

      static boolean_T rt_LoggedOutputIsVarDims[] = {
        0
      };

      static void* rt_LoggedCurrentSignalDimensions[] = {
        (NULL)
      };

      static int_T rt_LoggedCurrentSignalDimensionsSize[] = {
        4
      };

      static BuiltInDTypeId rt_LoggedOutputDataTypeIds[] = {
        SS_DOUBLE
      };

      static int_T rt_LoggedOutputComplexSignals[] = {
        0
      };

      static const char_T *rt_LoggedOutputLabels[] = {
        "" };

      static const char_T *rt_LoggedOutputBlockNames[] = {
        "Subsystem/Out1" };

      static RTWLogDataTypeConvert rt_RTWLogDataTypeConvert[] = {
        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 }
      };

      static RTWLogSignalInfo rt_LoggedOutputSignalInfo[] = {
        {
          1,
          rt_LoggedOutputWidths,
          rt_LoggedOutputNumDimensions,
          rt_LoggedOutputDimensions,
          rt_LoggedOutputIsVarDims,
          rt_LoggedCurrentSignalDimensions,
          rt_LoggedCurrentSignalDimensionsSize,
          rt_LoggedOutputDataTypeIds,
          rt_LoggedOutputComplexSignals,
          (NULL),

          { rt_LoggedOutputLabels },
          (NULL),
          (NULL),
          (NULL),

          { rt_LoggedOutputBlockNames },

          { (NULL) },
          (NULL),
          rt_RTWLogDataTypeConvert
        }
      };

      rtliSetLogYSignalInfo(Subsystem_M->rtwLogInfo, rt_LoggedOutputSignalInfo);

      /* set currSigDims field */
      rt_LoggedCurrentSignalDimensions[0] = &rt_LoggedOutputWidths[0];
    }

    rtliSetLogY(Subsystem_M->rtwLogInfo, "yout");
  }

  Subsystem_M->solverInfoPtr = (&Subsystem_M->solverInfo);
  Subsystem_M->Timing.stepSize = (0.01);
  rtsiSetFixedStepSize(&Subsystem_M->solverInfo, 0.01);
  rtsiSetSolverMode(&Subsystem_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  (void) memset(((void *) &Subsystem_B), 0,
                sizeof(BlockIO_Subsystem));

  /* states (continuous) */
  {
    (void) memset((void *)&Subsystem_X, 0,
                  sizeof(ContinuousStates_Subsystem));
  }

  /* external outputs */
  Subsystem_Y.Out1 = 0.0;

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(Subsystem_M->rtwLogInfo, 0.0, rtmGetTFinal
    (Subsystem_M), Subsystem_M->Timing.stepSize0, (&rtmGetErrorStatus
    (Subsystem_M)));

  /* Initialize Sizes */
  Subsystem_M->Sizes.numContStates = (2);/* Number of continuous states */
  Subsystem_M->Sizes.numY = (1);       /* Number of model outputs */
  Subsystem_M->Sizes.numU = (0);       /* Number of model inputs */
  Subsystem_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  Subsystem_M->Sizes.numSampTimes = (2);/* Number of sample times */
  Subsystem_M->Sizes.numBlocks = (7);  /* Number of blocks */
  Subsystem_M->Sizes.numBlockIO = (2); /* Number of block outputs */
  Subsystem_M->Sizes.numBlockPrms = (4);/* Sum of parameter "widths" */

  /* InitializeConditions for Integrator: '<S1>/Integrator1' */
  Subsystem_X.Integrator1_CSTATE = Subsystem_P.Integrator1_IC;

  /* InitializeConditions for Integrator: '<S1>/Integrator' */
  Subsystem_X.Integrator_CSTATE = Subsystem_P.Integrator_IC;
}

/* Model terminate function */
void Subsystem_terminate(void)
{
}
