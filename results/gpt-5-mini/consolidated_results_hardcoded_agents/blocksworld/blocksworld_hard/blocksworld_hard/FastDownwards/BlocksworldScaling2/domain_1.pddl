(define (domain blocksworld-scaling2)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (phase ?s - stage)
    (finished)
  )

  ;; Pick up a clear block from the table when the hand is empty and in the active phase.
  (:action pickup
    :parameters (?b - block ?s - stage)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (phase ?s))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b))
  )

  ;; Remove a clear block from on top of another block when the hand is empty and in the active phase.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage)
    :precondition (and (on ?b ?c) (clear ?b) (handempty) (phase ?s))
    :effect (and
              (not (on ?b ?c))
              (holding ?b)
              (not (handempty))
              (clear ?c)
              (not (clear ?b)))
  )

  ;; Put down a held block onto the table (makes it clear); hand becomes empty.
  (:action putdown
    :parameters (?b - block ?s - stage)
    :precondition (and (holding ?b) (phase ?s))
    :effect (and
              (ontable ?b)
              (not (holding ?b))
              (handempty)
              (clear ?b))
  )

  ;; Stack a held block onto a clear block; the lower block becomes not clear; hand becomes empty.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage)
    :precondition (and (holding ?b) (clear ?c) (phase ?s))
    :effect (and
              (on ?b ?c)
              (not (holding ?b))
              (handempty)
              (not (clear ?c))
              (clear ?b))
  )

  ;; Terminal transition: move from active phase to finished phase.
  ;; This enforces that no further manipulation actions (which require the active phase) occur after finishing.
  ;; Planner will be required to achieve the goal on-relations before taking this terminal action,
  ;; because the problem goal includes (finished) together with the desired on relations.
  (:action finish
    :parameters (?s0 - stage ?s1 - stage)
    :precondition (and (phase ?s0) (handempty))
    :effect (and
              (not (phase ?s0))
              (phase ?s1)
              (finished))
  )
)