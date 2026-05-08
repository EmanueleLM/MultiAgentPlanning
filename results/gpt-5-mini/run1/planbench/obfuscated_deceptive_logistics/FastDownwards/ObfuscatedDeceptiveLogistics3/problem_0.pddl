(define (problem orchestrator-problem)
  (:domain orchestrator)

  ;; No :objects section is required here because the canonical object set is declared
  ;; as domain :constants. The initial state below references those constants.

  (:init
    ;; Task -> Phase membership (canonical mapping)
    (task-in-phase t1 p1)
    (task-in-phase t2 p2)
    (task-in-phase t3 p2)

    ;; All tasks start unassigned
    (task-unassigned t1)
    (task-unassigned t2)
    (task-unassigned t3)

    ;; Workflow phase initial activation: p1 is active initially; p2 is not active until advanced.
    (phase-active p1)
    ;; p2 intentionally not active here to enforce ordering via advance-p1-to-p2 action.

    ;; Declare phase ordering explicitly for clarity (not used by planner automatically,
    ;; but documents intended successor relation). Domain actions may rely on explicit advance actions.
    (phase-next p1 p2)

    ;; Agents availability: agents are available in each phase by default.
    ;; Availability is indexed by phase and will be consumed when assigning tasks during that phase.
    (agent-available a1 p1)
    (agent-available a2 p1)
    (agent-available a1 p2)
    (agent-available a2 p2)
  )

  ;; The goal fixes all mandated terminal conditions:
  ;; - every task must be completed
  ;; - phase p1 must be marked done (to enforce that p1 was completed prior to p2 work)
  ;; - phase p2 must be active at the end (workflow progressed to final phase)
  (:goal (and
           (task-completed t1)
           (task-completed t2)
           (task-completed t3)
           (phase-done p1)
           (phase-active p2)
         )
  )
)