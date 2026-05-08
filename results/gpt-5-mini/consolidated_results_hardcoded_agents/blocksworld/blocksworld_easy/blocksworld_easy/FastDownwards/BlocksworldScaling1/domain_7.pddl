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

  ;; Pick up a clear block from the table. Consumes one stage step.
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
      (not (clear ?b))   ;; being held implies not clear per spec
      (not (handempty))
      (holding ?b)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block. Consumes one stage step.
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
      (clear ?bbelow)    ;; after removing ?b, the below block becomes clear
      (not (clear ?b))   ;; held block is not considered clear
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put down a held block onto the table. Consumes one stage step.
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
      (clear ?b)         ;; nothing on top when put on table
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack a held block on top of a clear block. Consumes one stage step.
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
      (not (clear ?bbelow)) ;; the block below is no longer clear after stacking
      (clear ?b)            ;; the newly stacked block has nothing on top
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)