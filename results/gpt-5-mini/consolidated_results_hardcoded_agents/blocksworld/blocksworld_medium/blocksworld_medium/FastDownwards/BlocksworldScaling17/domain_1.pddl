(define (domain BlocksworldScaling17)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table into the hand.
  (:action pick-up
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and (handempty) (clear ?b) (ontable ?b) (stage ?s) (next ?s ?t))
    :effect (and
      (not (handempty))
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (stage ?s))
      (stage ?t)
    )
  )

  ;; Unstack a clear block from atop another block into the hand.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and (handempty) (clear ?b) (on ?b ?c) (stage ?s) (next ?s ?t))
    :effect (and
      (not (handempty))
      (not (on ?b ?c))
      (holding ?b)
      (clear ?c)
      (not (clear ?b))
      (not (stage ?s))
      (stage ?t)
    )
  )

  ;; Put down a held block onto the table.
  (:action put-down
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and (holding ?b) (stage ?s) (next ?s ?t))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (stage ?s))
      (stage ?t)
    )
  )

  ;; Stack a held block onto a clear block.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and (holding ?b) (clear ?c) (stage ?s) (next ?s ?t))
    :effect (and
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (stage ?s))
      (stage ?t)
    )
  )
)