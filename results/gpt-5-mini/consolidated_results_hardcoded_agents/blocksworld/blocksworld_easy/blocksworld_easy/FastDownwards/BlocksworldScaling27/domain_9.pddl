(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (handempty)
    (holding ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Pick up a clear block from the table into the hand.
  ;; Time is modeled by advancing from a current stage ?s to its immediate successor ?s2.
  (:action pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block ?b from directly on block ?c into the hand.
  ;; Makes the supporting block ?c clear.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down the held block onto the table.
  (:action putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack the held block ?b onto a clear block ?c.
  ;; After stacking, the lower block ?c is no longer clear and the stacked block ?b is clear.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
      (not (ontable ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)