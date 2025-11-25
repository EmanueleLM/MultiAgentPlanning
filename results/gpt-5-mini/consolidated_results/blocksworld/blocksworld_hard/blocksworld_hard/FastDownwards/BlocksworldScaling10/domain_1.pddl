(define (domain blocks-singlehanded)
  (:requirements :typing :strips :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    ;; stage control for explicit discrete-time progression
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Unstack a block from another block (requires empty hand and block clear).
  ;; Advances discrete stage from ?s to its successor ?s2 (succ relation).
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

  ;; Pick up a clear block from the table (requires empty hand).
  ;; Advances stage.
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

  ;; Put the held block down on the table. Advances stage.
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

  ;; Stack a held block onto another clear block. Advances stage.
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