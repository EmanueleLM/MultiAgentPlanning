(define (domain BlocksworldScaling17)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

  (:predicates
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)        ; true iff nothing is on ?b AND ?b is not being held
    (holding ?b - block)      ; true iff the agent is holding ?b
    (handempty)               ; true iff the agent's hand is empty
    (at ?t - time)            ; current stage/timepoint
    (next ?t1 - time ?t2 - time) ; immediate successor relation between stages
  )

  ;; Pick up a clear block from the table, advancing from stage ?s to its successor ?t.
  (:action pick-up
    :parameters (?b - block ?s - time ?t - time)
    :precondition (and
      (handempty)
      (clear ?b)
      (ontable ?b)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (handempty))
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (at ?s))
      (at ?t)
    )
  )

  ;; Unstack a clear block ?b from on top of ?c, advancing from stage ?s to successor ?t.
  ;; The block below becomes clear; the unstacked block is held and not on the lower block nor on the table.
  (:action unstack
    :parameters (?b - block ?c - block ?s - time ?t - time)
    :precondition (and
      (handempty)
      (clear ?b)
      (on ?b ?c)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (handempty))
      (not (on ?b ?c))
      (not (ontable ?b))
      (holding ?b)
      (clear ?c)
      (not (clear ?b))
      (not (at ?s))
      (at ?t)
    )
  )

  ;; Put down a held block onto the table, advancing time.
  ;; Results in the block on the table and clear; hand becomes empty.
  (:action put-down
    :parameters (?b - block ?s - time ?t - time)
    :precondition (and
      (holding ?b)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?t)
    )
  )

  ;; Stack a held block ?b onto a clear block ?c, advancing time.
  ;; After stacking, destination ?c is not clear and the hand is empty; the stacked block becomes clear and is not on the table.
  (:action stack
    :parameters (?b - block ?c - block ?s - time ?t - time)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (ontable ?b))
      (not (at ?s))
      (at ?t)
    )
  )
)