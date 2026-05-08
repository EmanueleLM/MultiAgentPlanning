(define (domain blocks-world-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block phase)
  (:predicates
    (on ?b - block ?x - block)     ; b is on block x
    (ontable ?b - block)           ; b is on the table
    (clear ?b - block)             ; nothing on b and b is not held
    (holding ?b - block)           ; b is in the hand
    (handempty)                    ; the hand is empty
    (current ?p - phase)           ; current stage/phase
    (next ?p1 - phase ?p2 - phase) ; ordering of phases
  )

  ;; Unstack a clear block ?b from directly on block ?c, consuming one phase step.
  (:action unstack
    :parameters (?b - block ?c - block ?p - phase ?pnext - phase)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (not (ontable ?b))   ; ensure exclusivity: now held, not on table
      (clear ?c)           ; c becomes clear after removing b
      (not (clear ?b))
      (not (handempty))
      (not (current ?p))
      (current ?pnext)
    )
  )

  ;; Pick up a clear block ?b from the table, consuming one phase step.
  (:action pickup
    :parameters (?b - block ?p - phase ?pnext - phase)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?p))
      (current ?pnext)
    )
  )

  ;; Put down a held block ?b onto the table, consuming one phase step.
  (:action putdown
    :parameters (?b - block ?p - phase ?pnext - phase)
    :precondition (and
      (holding ?b)
      (current ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (current ?p))
      (current ?pnext)
    )
  )

  ;; Stack a held block ?b onto a clear block ?c, consuming one phase step.
  (:action stack
    :parameters (?b - block ?c - block ?p - phase ?pnext - phase)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (holding ?b))
      (handempty)
      (not (ontable ?b))
      (not (current ?p))
      (current ?pnext)
    )
  )
)