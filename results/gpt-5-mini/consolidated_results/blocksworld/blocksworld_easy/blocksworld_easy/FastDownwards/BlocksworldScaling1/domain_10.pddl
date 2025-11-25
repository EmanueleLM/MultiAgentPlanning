(define (domain BlocksworldScaling1)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at-stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table. Advances global stage by one successor link.
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))     ;; held -> not clear (clear requires not held)
      (not (handempty))
      (holding ?b)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block. Advances the stage.
  (:action unstack
    :parameters (?b - block ?bbelow - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?bbelow)
      (clear ?b)
      (handempty)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?b ?bbelow))
      (holding ?b)
      (clear ?bbelow)      ;; removing top makes the below block clear
      (not (clear ?b))     ;; held -> not clear
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put down a held block onto the table. Advances the stage.
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)           ;; on table and not held -> clear (no block on top)
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack a held block on top of a clear block. Advances the stage.
  (:action stack
    :parameters (?b - block ?bbelow - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?bbelow)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (holding ?b))
      (on ?b ?bbelow)
      (not (clear ?bbelow)) ;; once something is stacked on it, the below block is not clear
      (clear ?b)            ;; stacked block has no blocks on top and is not held -> clear
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)