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
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table when the hand is empty.
  ;; Progresses from stage ?s to its successor ?s1 (successor must be declared via (next ?s ?s1)).
  (:action pickup
    :parameters (?b - block ?s - stage ?s1 - stage)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (phase ?s) (next ?s ?s1))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
              (not (phase ?s))
              (phase ?s1))
  )

  ;; Unstack a clear block from on top of another block when the hand is empty.
  ;; Leaves the lower block clear. Progresses stage.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s1 - stage)
    :precondition (and (on ?b ?c) (clear ?b) (handempty) (phase ?s) (next ?s ?s1))
    :effect (and
              (not (on ?b ?c))
              (holding ?b)
              (not (handempty))
              (clear ?c)
              (not (clear ?b))
              (not (phase ?s))
              (phase ?s1))
  )

  ;; Put down a held block onto the table; becomes clear; hand becomes empty. Progresses stage.
  (:action putdown
    :parameters (?b - block ?s - stage ?s1 - stage)
    :precondition (and (holding ?b) (phase ?s) (next ?s ?s1))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
              (not (phase ?s))
              (phase ?s1))
  )

  ;; Stack a held block onto a clear block; lower block becomes not clear; hand becomes empty. Progresses stage.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s1 - stage)
    :precondition (and (holding ?b) (clear ?c) (phase ?s) (next ?s ?s1))
    :effect (and
              (on ?b ?c)
              (not (holding ?b))
              (handempty)
              (not (clear ?c))
              (clear ?b)
              (not (phase ?s))
              (phase ?s1))
  )
)