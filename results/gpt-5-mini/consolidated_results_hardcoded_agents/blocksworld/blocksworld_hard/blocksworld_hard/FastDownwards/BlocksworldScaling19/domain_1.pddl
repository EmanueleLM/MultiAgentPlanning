(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (clear ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (holding ?b - block)
    (handempty)
    (current ?t - step)
    (succ ?t1 - step ?t2 - step)
  )

  ;; Pickup a block from the table, advancing the current step to its successor
  (:action pickup
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (clear ?b)
      (on-table ?b)
      (handempty)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))   ;; a held block is not clear by definition
      (not (handempty))
      (holding ?b)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Unstack a clear block from on top of another block, advancing the current step
  (:action unstack
    :parameters (?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)        ;; after removing ?b, the supporting block becomes clear
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Put the held block down on the table, advancing the current step
  (:action putdown
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (on-table ?b)
      (clear ?b)
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Stack the held block onto another clear block, advancing the current step
  (:action stack
    :parameters (?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )
)