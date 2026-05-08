(define (domain blocksworld-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (diff ?a - block ?b - block)
  )

  ;; Pick up a clear block from the table when the hand is empty.
  ;; Advances the discrete stage by exactly one successor step.
  (:action block_picker_pickup
    :parameters (?b - block ?from - stage ?to - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current ?from))
      (current ?to)
    )
  )

  ;; Unstack a clear block from on top of another clearable block when the hand is empty.
  ;; Removes the on relation, makes the support clear, and advances the stage by one successor.
  (:action block_picker_unstack
    :parameters (?b - block ?c - block ?from - stage ?to - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?from)
      (next ?from ?to)
      (diff ?b ?c)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (clear ?c)
      (not (handempty))
      (holding ?b)
      (not (current ?from))
      (current ?to)
    )
  )

  ;; Put down a held block onto the table. Hand becomes empty. Advances stage by one successor.
  (:action stack_manager_putdown
    :parameters (?b - block ?from - stage ?to - stage)
    :precondition (and
      (holding ?b)
      (current ?from)
      (next ?from ?to)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?from))
      (current ?to)
    )
  )

  ;; Stack a held block onto a clear support block. Support becomes not clear; stacked block becomes clear.
  ;; Hand becomes empty. Advances stage by one successor.
  (:action stack_manager_stack
    :parameters (?b - block ?c - block ?from - stage ?to - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?from)
      (next ?from ?to)
      (diff ?b ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?from))
      (current ?to)
    )
  )
)