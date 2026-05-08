(define (domain blocks-singlehanded)
  (:requirements :typing :strips :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Unstack a block ?x from on top of block ?y, advancing from stage ?s to its successor ?s2.
  ;; Preconditions: ?x is on ?y, ?x is clear, hand is empty, and the planner is at stage ?s with successor ?s2.
  ;; Effects: the agent holds ?x, ?y becomes clear, the on relation removed, hand becomes non-empty,
  ;; ?x is not clear while held, and the current stage advances to ?s2 (and is no longer ?s).
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      (not (clear ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Pick up a block ?x from the table, advancing stage.
  ;; Preconditions: ?x is on the table, ?x is clear, hand is empty, and the planner is at stage ?s with successor ?s2.
  ;; Effects: the agent holds ?x, remove ontable, hand becomes non-empty, ?x is not clear while held,
  ;; and current stage advances to ?s2.
  (:action pickup
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (handempty))
      (not (clear ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block ?x onto the table, advancing stage.
  ;; Preconditions: the agent is holding ?x and the planner is at stage ?s with successor ?s2.
  ;; Effects: ?x becomes ontable and clear, the hand becomes empty, the agent no longer holds ?x,
  ;; and current stage advances to ?s2.
  (:action putdown
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block ?x onto block ?y, advancing stage.
  ;; Preconditions: the agent is holding ?x, ?y is clear, and the planner is at stage ?s with successor ?s2.
  ;; Effects: ?x is on ?y and becomes clear (nothing on top), the hand becomes empty,
  ;; the agent no longer holds ?x, ?y ceases to be clear, and current stage advances to ?s2.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (current ?s))
      (current ?s2)
    )
  )
)