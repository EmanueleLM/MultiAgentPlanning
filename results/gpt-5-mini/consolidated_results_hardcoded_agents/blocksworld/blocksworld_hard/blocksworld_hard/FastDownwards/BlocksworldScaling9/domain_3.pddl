(define (domain blocks-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table into the hand, advancing stages.
  (:action pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (on-table ?x) (clear ?x) (handempty) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a clear block from another block into the hand, making the lower block clear, advancing stages.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put down a held block onto the table, making it clear and emptying the hand, advancing stages.
  (:action put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack a held block onto a clear destination block, making the destination not clear and emptying the hand, advancing stages.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (at-stage ?s) (succ ?s ?s2))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)