(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    ;; A block with no block on top of it and not being held
    (clear ?b - block)
    ;; Directly on relation: ?b is immediately on top of ?c
    (on ?b - block ?c - block)
    ;; Directly on the table
    (on-table ?b - block)
    ;; Agent is currently holding ?b
    (holding ?b - block)
    ;; Agent's hand is empty (true when not holding any block)
    (handempty)
    ;; Discrete time/stage control: denotes the currently active step
    (current ?t - step)
    ;; Successor relation: one-action-per-step progression
    (succ ?t1 - step ?t2 - step)
  )

  ;; Pickup a clear block from the table, advancing the current step to its successor
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
      ;; remove table occupancy and mark as held; block is not clear while held
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      ;; advance time/stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Unstack a clear block ?b from on top of ?c, advancing the current step
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
      ;; remove the on relation, hold ?b, make the supporting block clear
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      ;; advance time/stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Put the held block down onto the table, advancing the current step
  (:action putdown
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (holding ?b)
    )
    :effect (and
      ;; place on table, mark clear (nothing on top), free the hand
      (not (holding ?b))
      (on-table ?b)
      (clear ?b)
      (handempty)
      ;; advance time/stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Stack the held block ?b onto another clear block ?c, advancing the current step
  (:action stack
    :parameters (?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      ;; place ?b on ?c, mark target not clear, held block becomes clear (no block on top)
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
      ;; advance time/stage
      (not (current ?t))
      (current ?t2)
    )
  )
)