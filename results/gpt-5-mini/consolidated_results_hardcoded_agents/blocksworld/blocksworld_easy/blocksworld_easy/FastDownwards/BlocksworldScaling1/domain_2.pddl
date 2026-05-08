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

  ;; Pick up a block from the table.
  ;; Consumes the current stage token and produces the next one to model discrete time progression.
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
      (not (clear ?b))         ;; a block held is not clear
      (not (handempty))
      (holding ?b)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a block from on top of another block.
  ;; Consumes the current stage token and produces the next one.
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
      (clear ?bbelow)         ;; removing top block makes the below block clear
      (not (clear ?b))        ;; held block is not clear
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put down a held block onto the table.
  ;; Consumes the current stage token and produces the next one.
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
      (clear ?b)             ;; when placed on table with nothing on top it is clear
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack a held block onto another clear block.
  ;; Consumes the current stage token and produces the next one.
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
      (not (clear ?bbelow))  ;; once stacked, the below block is no longer clear
      (clear ?b)             ;; newly stacked block has nothing on top
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)