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

  ;; Unstack a clear block ?x from on top of ?y at successive steps ?s -> ?s2.
  ;; Preconditions enforce single-block handling and hand-empty; effects update clearance and step token.
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

  ;; Put the held block ?x down on the table at successive steps ?s -> ?s2.
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

  ;; Pick up a clear block ?x from the table at successive steps ?s -> ?s2.
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

  ;; Stack the held block ?x onto a clear block ?y at successive steps ?s -> ?s2.
  (:action stack
    :parameters (?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?x)
      (clear ?y)
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