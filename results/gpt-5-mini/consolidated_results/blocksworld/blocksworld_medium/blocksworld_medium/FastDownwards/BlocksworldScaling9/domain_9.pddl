(define (domain blocksworld-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

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
  ;; Discrete stage progression enforced via at/succ: action consumes the current stage and moves to its successor.
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
  ;; Removing the top block makes the block below clear.
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

  ;; Stack a held block on top of a clear block (destination loses its clear status).
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