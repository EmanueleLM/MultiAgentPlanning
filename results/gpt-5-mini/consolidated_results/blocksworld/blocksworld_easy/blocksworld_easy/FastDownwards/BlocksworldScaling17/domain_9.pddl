(define (domain blocks-order-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table. Advances the current stage along the declared next link.
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block. Advances stage and makes the below block clear.
  (:action unstack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table. Advances the stage.
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (current ?s)
      (next ?s ?s2)
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

  ;; Stack a held block onto a clear block. Destination becomes not clear. Advances the stage.
  (:action stack
    :parameters (?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?target)
      (not (ontable ?b))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?target))
      (not (current ?s))
      (current ?s2)
    )
  )
)