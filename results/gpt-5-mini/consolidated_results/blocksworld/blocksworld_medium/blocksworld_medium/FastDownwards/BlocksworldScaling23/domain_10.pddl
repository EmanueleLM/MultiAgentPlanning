(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (hand-empty)
    (holding ?b - block)
    (on ?x - block ?y - block)
    (on-table ?b - block)
    (clear ?b - block)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Placer actions (prefixed with placer-)
  (:action placer-pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (hand-empty) (clear ?x) (on-table ?x) (at-stage ?s) (succ ?s ?s2))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on-table ?x))
              (not (clear ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  (:action placer-unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (hand-empty) (clear ?x) (on ?x ?y) (at-stage ?s) (succ ?s ?s2) (not (= ?x ?y)))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  (:action placer-put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (at-stage ?s) (succ ?s ?s2))
    :effect (and
              (on-table ?x)
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  (:action placer-stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (at-stage ?s) (succ ?s ?s2) (not (= ?x ?y)))
    :effect (and
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
              (not (on-table ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  ;; Unstacker actions (prefixed with unstacker-)
  (:action unstacker-pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (hand-empty) (clear ?x) (on-table ?x) (at-stage ?s) (succ ?s ?s2))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on-table ?x))
              (not (clear ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  (:action unstacker-unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (hand-empty) (clear ?x) (on ?x ?y) (at-stage ?s) (succ ?s ?s2) (not (= ?x ?y)))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  (:action unstacker-put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (at-stage ?s) (succ ?s ?s2))
    :effect (and
              (on-table ?x)
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  (:action unstacker-stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (at-stage ?s) (succ ?s ?s2) (not (= ?x ?y)))
    :effect (and
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
              (not (on-table ?x))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )
)