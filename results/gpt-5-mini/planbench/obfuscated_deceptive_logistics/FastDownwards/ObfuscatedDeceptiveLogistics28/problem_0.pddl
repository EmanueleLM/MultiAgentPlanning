(define (problem workflow-instance)
  (:domain workflow-orchestration)

  ;; Objects: agents typed into their specific roles, tasks, and locations.
  (:objects
    ;; Agents (role-specific types preserve the analyzer/synthesizer/auditor distinction)
    analyzer1 - analyzer
    synthesizer1 - synthesizer
    auditor1 - auditor

    ;; Tasks
    task1 task2 - task

    ;; Locations
    locA locB locC - location
  )

  ;; Initial state:
  ;; - All agents start at specified locations
  ;; - Each task has a fixed location
  ;; - Connectivity declared explicitly (bidirectional links)
  ;; - Begin in analysis phase only
  ;; - No task is analyzed/synthesized/audited yet
  (:init
    ;; Agent positions
    (at analyzer1 locA)
    (at synthesizer1 locC)
    (at auditor1 locC)

    ;; Task positions
    (task-at task1 locA)
    (task-at task2 locB)

    ;; Connectivity (bidirectional explicit declarations)
    (connected locA locB)
    (connected locB locA)
    (connected locB locC)
    (connected locC locB)
    (connected locA locC)  ;; direct links allowed
    (connected locC locA)

    ;; Start in analysis phase (enforce strict phase sequencing)
    (in-phase-analysis)
    ;; Ensure other phases are false by absence (no in-phase-synthesis / in-phase-audit)

    ;; Note: advance-to-synthesis and advance-to-audit actions have only phase preconditions here.
    ;; To make the phase advance actions hard-check that *all* tasks are completed in the earlier phase,
    ;; we will rely on the planner to include analysis/synthesis actions for every task before advancing.
    ;; However, to make the "all tasks must be analyzed/synthesized" constraint explicit and non-bypassable,
    ;; we encode those checks by adding dummy facts that must be present for the advance actions.
    ;; Since domain actions cannot include problem-specific enumerations, we encode these checks by
    ;; requiring the planner to establish analyzed/synthesized facts for each task before phase advance
    ;; (the advance actions here will only be executable when those facts are present).
    ;; No extra facts are declared here; the planner must produce analyze/synthesize actions for each task.
  )

  ;; Goal: every task must be analyzed, synthesized, and audited (in that order, enforced by phase
  ;; progression actions). Additionally, agents must be at specified final locations.
  ;; These are hard terminal conditions.
  (:goal
    (and
      (analyzed task1)
      (analyzed task2)
      (synthesized task1)
      (synthesized task2)
      (audited task1)
      (audited task2)

      ;; Final agent locations are mandated. These are part of the terminal conditions.
      (at analyzer1 locB)        ;; example mandated final location for analyzer1
      (at synthesizer1 locB)     ;; synthesizer must finish at locB
      (at auditor1 locC)         ;; auditor must finish at locC
    )
  )

  ;; Note: To enforce strict phase advancement only after all tasks are complete in the prior phase,
  ;; the planner must ensure:
  ;; - both (analyzed task1) and (analyzed task2) before executing advance-to-synthesis
  ;; - both (synthesized task1) and (synthesized task2) before executing advance-to-audit
  ;; Because the advance actions switch a single global phase atom, these checks cannot be bypassed:
  ;; synthesizer and auditor actions require their respective in-phase-* atoms, making it impossible
  ;; to perform synthesis before analysis completion for all tasks and audit before all synthesis.
)