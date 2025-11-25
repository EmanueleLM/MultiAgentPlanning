(define (domain BlocksworldScaling17)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

  (:predicates
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; Pick up a clear block from the table during a single time-step.
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

  ;; Unstack a clear block from on top of another block during a single time-step.
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
      (holding ?b)
      (clear ?c)
      (not (clear ?b))
      (not (at ?s))
      (at ?t)
    )
  )

  ;; Put down a held block onto the table during a single time-step.
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
      ;; ensure any transient on-relations for this block are removed
      (forall (?x - block) (when (on ?b ?x) (not (on ?b ?x))))
      (not (at ?s))
      (at ?t)
    )
  )

  ;; Stack a held block onto a clear block during a single time-step.
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
      ;; ensure the block is not simultaneously marked ontable
      (not (ontable ?b))
      (not (at ?s))
      (at ?t)
    )
  )
)