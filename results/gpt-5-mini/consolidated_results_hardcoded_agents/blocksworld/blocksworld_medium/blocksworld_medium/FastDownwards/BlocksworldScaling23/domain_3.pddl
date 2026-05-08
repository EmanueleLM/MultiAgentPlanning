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

  ;; Actions provided by the "placer" agent (prefix: placer-)
  ;; Each action moves the explicit stage token forward: requires succ(?s,?s2).
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
    :precondition (and (hand-empty) (clear ?x) (on ?x ?y) (not (= ?x ?y)) (at-stage ?s) (succ ?s ?s2))
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
    :precondition (and (holding ?x) (clear ?y) (not (= ?x ?y)) (at-stage ?s) (succ ?s ?s2))
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

  ;; Actions provided by the "unstacker" agent (prefix: unstacker-)
  ;; Same semantics as placer- actions but distinct names to keep agent actions distinguishable.
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
    :precondition (and (hand-empty) (clear ?x) (on ?x ?y) (not (= ?x ?y)) (at-stage ?s) (succ ?s ?s2))
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
    :precondition (and (holding ?x) (clear ?y) (not (= ?x ?y)) (at-stage ?s) (succ ?s ?s2))
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