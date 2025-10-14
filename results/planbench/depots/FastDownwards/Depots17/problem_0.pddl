; Assumptions and notes:
; - The orchestrator did not receive the raw structured analyses as PDDL. To produce a coherent
;   FastDownward-compatible domain/problem, the following modeling assumptions were made:
;   * Two agents (a1, a2), two tasks (t1, t2), two locations (l1, l2), and two time slots (s1, s2).
;   * Each task has a required slot expressed via (must-use-slot ...). These represent
;     the "earliest/required" temporal constraints from the analyses and are treated as hard.
;   * Agents can only perform tasks for which (can-perform ...) is true; capability relations
;     were assumed to match tasks with agents at the same location.
;   * Tasks are executed atomically via the assign-and-complete action; no separate duration model.
; - If the original analyses contained different objects, capabilities, or slot assignments,
;   those should replace the corresponding objects and initial facts below.

(define (problem assign-problem)
  (:domain multi-agent-assignment)

  (:objects
    a1 a2 - agent
    t1 t2 - task
    l1 l2 - location
    s1 s2 - slot
  )

  (:init
    ;; Agent availability and locations
    (agent-available a1)
    (agent-available a2)
    (agent-at a1 l1)
    (agent-at a2 l2)

    ;; Tasks locations and unassigned status
    (task-at t1 l1)
    (task-at t2 l2)
    (task-unassigned t1)
    (task-unassigned t2)

    ;; Capabilities (assumed from analyses): a1 can do t1, a2 can do t2
    (can-perform a1 t1)
    (can-perform a2 t2)

    ;; Slot availability (no unavailable slot is marked free)
    (slot-free s1)
    (slot-free s2)

    ;; Temporal / preference constraints treated as hard: each task must use a specific slot
    (must-use-slot t1 s1)  ; t1 requires slot s1 (earliest/required)
    (must-use-slot t2 s2)  ; t2 requires slot s2 (earliest/required)
  )

  (:goal (and
    (task-completed t1)
    (task-completed t2)
  ))
)