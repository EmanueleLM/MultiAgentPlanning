(define (domain block-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?b2 - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
    (diff ?b1 - block ?b2 - block)
  )

  ;; Pick up a clear block from the table (hand must be empty). Advance stage by succ.
  (:action pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (handempty) (clear ?x) (ontable ?x) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Unstack a clear block that is on top of another block. Advance stage by succ.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (handempty) (clear ?x) (on ?x ?y) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Put the held block down onto the table. Advance stage by succ.
  (:action put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Stack the held block onto another clear, distinct block. Advance stage by succ.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (diff ?x ?y) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (on ?x ?y)
              (not (holding ?x))
              (handempty)
              (not (clear ?y))
              (clear ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)