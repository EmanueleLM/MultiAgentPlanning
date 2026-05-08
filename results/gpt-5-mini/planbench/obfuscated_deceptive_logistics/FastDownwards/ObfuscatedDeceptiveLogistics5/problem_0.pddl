; Problem: establish next object_9 object_7
; Minimal assumptions (documented here as required):
; - The public environment did not provide an explicit object list or initial relations.
; - To create a solvable problem, I minimally assume there are nine objects named object_1 .. object_9
;   and three agents named acting_agent, observer, auditor. These agent objects are provided for provenance
;   but the domain's actions are already agent-prefixed in their names; the agents are not required by action parameters.
; - Initially no "next" relations exist; every object is free (has no successor or predecessor).
; These assumptions are encoded below in the :init section so the planner can find a plan that achieves the mandated goal.
(define (problem make-next-9-7)
  :domain object-sequencing
  :objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj
    acting_agent observer auditor - agent

  :init
    ; all objects start free (no predecessor and no successor)
    (free object_1)
    (free object_2)
    (free object_3)
    (free object_4)
    (free object_5)
    (free object_6)
    (free object_7)
    (free object_8)
    (free object_9)

  ; Goal: enforce the required terminal condition exactly
  :goal (and
    (next object_9 object_7)
  )
)