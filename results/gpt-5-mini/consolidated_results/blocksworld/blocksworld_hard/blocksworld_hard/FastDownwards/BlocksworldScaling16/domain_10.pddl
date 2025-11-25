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
    (different ?b1 - block ?b2 - block)
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
      (not (on ?x ?y))
      (holding ?x)
      (not (handempty))
      (clear ?y)
      (not (ontable ?x))
      (not (clear ?x))
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

  ;; Stack the held block ?x on top of a clear distinct block ?y, advancing the step.
  (:action stack
    :parameters (?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (different ?x ?y)
      (at-step ?s)
      (next ?s ?s2)
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