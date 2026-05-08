(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (neq ?x - block ?y - block)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Pickup a clear block from the table when the hand is empty.
  ;; Progresses the global stage: requires at-stage ?s and moves to its successor ?s2.
  (:action pickup
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (handempty)
      (ontable ?x)
      (clear ?x)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (ontable ?x))
      (not (clear ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a clear block ?x from on top of block ?y when the hand is empty.
  ;; Leaves the supporting block ?y clear. Enforces stage progression.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (handempty)
      (on ?x ?y)
      (clear ?x)
      (neq ?x ?y)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (ontable ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put down a currently held block onto the table. Enforces stage progression.
  (:action putdown
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack a held block ?x on top of a clear block ?y. Enforces stage progression.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (neq ?x ?y)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (ontable ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)