(define (domain BlocksworldScaling29)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a clear block that is on the table when the hand is empty.
  ;; Advances the current stage to the specified successor stage (enforces one action per stage).
  (:action pickup
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block from atop another block when the hand is empty.
  ;; Makes the supporting block clear. Advances the current stage.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
      (clear ?y)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table. Advances the current stage.
  (:action putdown
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block onto a clear block. Advances the current stage.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s))
      (current ?s2)
    )
  )
)