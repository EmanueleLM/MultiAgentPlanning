(define (domain blocksworld-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time - object)

  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  ;; Pick up a clear block from the table when the hand is empty.
  ;; Time progression: action is applicable only at the current time ?t and moves to its successor ?t2,
  ;; ensuring contiguous stage progression and preventing reuse of the same time instant.
  (:action pick-up
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Unstack a clear block that is directly on top of another block, when the hand is empty.
  ;; The block below becomes clear after removing the top block.
  (:action unstack
    :parameters (?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Put down a held block onto the table.
  (:action put-down
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (holding ?b)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Stack a held block on top of a clear block.
  ;; The destination block loses its clear status; the moved block becomes clear after placement.
  (:action stack
    :parameters (?b - block ?under - block ?t - time ?t2 - time)
    :precondition (and
      (holding ?b)
      (clear ?under)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at ?t))
      (at ?t2)
    )
  )
)