(define (domain blocks-order-enforced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (ontable ?b - block)
    (on ?b - block ?b2 - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at-step ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Unstack a block ?x from on top of ?y, advancing from step ?s to its successor ?s2.
  (:action unstack
    :parameters (?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (at-step ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; Remove the on relation and make ?x held; hand becomes non-empty.
      (not (on ?x ?y))
      (holding ?x)
      (not (handempty))
      ;; Support ?y becomes clear (nothing on it now).
      (clear ?y)
      ;; ?x is no longer on the table and not clear while held.
      (not (ontable ?x))
      (not (clear ?x))
      ;; Advance the global step marker contiguously.
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Pick up a clear block from the table, advancing the step.
  (:action pickup
    :parameters (?x - block ?s - step ?s2 - step)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (at-step ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (ontable ?x))
      (not (clear ?x))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Put down the block being held onto the table, advancing the step.
  (:action putdown
    :parameters (?x - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?x)
      (at-step ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Stack the held block ?x on top of a clear block ?y, advancing the step.
  ;; Enforce that ?x and ?y are distinct objects.
  (:action stack
    :parameters (?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (at-step ?s)
      (next ?s ?s2)
      (not (= ?x ?y))
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
      (not (ontable ?x))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)