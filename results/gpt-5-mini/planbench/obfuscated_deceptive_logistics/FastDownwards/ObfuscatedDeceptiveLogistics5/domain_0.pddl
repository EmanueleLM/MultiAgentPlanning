; Domain: object-sequencing
; Minimal assumptions documented in the problem file.
; This domain provides actions to establish a strict "next" relation between objects.
; Agent-prefixed action names indicate provenance (acting_agent_, observer_, auditor_).
(define (domain object-sequencing)
  :requirements :strips :typing :negative-preconditions
  :types obj agent

  :predicates
    ; next ?a ?b  -- ?b immediately follows ?a in the sequence
    (next ?a - obj ?b - obj)
    ; free ?o     -- object has neither a successor nor a predecessor (available to be linked)
    (free ?o - obj)
    ; has-successor ?o  -- object has a successor
    (has-successor ?o - obj)
    ; has-predecessor ?o -- object has a predecessor
    (has-predecessor ?o - obj)
    ; validated ?a ?b -- observer or auditor has validated the link a->b
    (validated ?a - obj ?b - obj)

  ; ACTION: the primary actor sets a next link between two currently free objects
  (:action acting_agent_set-next
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (free ?x)
      (free ?y)
    )
    :effect (and
      (next ?x ?y)
      (has-successor ?x)
      (has-predecessor ?y)
      (not (free ?x))
      (not (free ?y))
    )
  )

  ; ACTION: observer validates an existing next link (no state change except validation)
  (:action observer_validate-next
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (next ?x ?y)
      (not (validated ?x ?y))
    )
    :effect (and
      (validated ?x ?y)
    )
  )

  ; ACTION: auditor may correct an existing link by removing one established link and creating another.
  ; This is a correction action; it removes the old link (making its endpoints free) then creates a new link
  ; between two free objects. It also produces a validation for the new link.
  (:action auditor_override-set-next
    :parameters (?oldx - obj ?oldy - obj ?newx - obj ?newy - obj)
    :precondition (and
      (next ?oldx ?oldy)      ; there is an existing link to be corrected
      (free ?newx)            ; new link's source must be free
      (free ?newy)            ; new link's target must be free
    )
    :effect (and
      ; remove old link and mark its endpoints free
      (not (next ?oldx ?oldy))
      (not (has-successor ?oldx))
      (not (has-predecessor ?oldy))
      (free ?oldx)
      (free ?oldy)

      ; create new link and update availability
      (next ?newx ?newy)
      (has-successor ?newx)
      (has-predecessor ?newy)
      (not (free ?newx))
      (not (free ?newy))

      ; auditor records validation of the correction
      (validated ?newx ?newy)
    )
  )
)