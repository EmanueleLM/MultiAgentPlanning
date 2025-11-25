(define (domain BlocksworldScaling1)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  ;; Predicates:
  ;; (on ?b ?b2)    - block ?b is on top of block ?b2
  ;; (ontable ?b)   - block ?b is directly on the table
  ;; (clear ?b)     - no block on top of ?b and ?b is not being held
  ;; (holding ?b)   - the single hand holds block ?b
  ;; (handempty)    - the single hand is empty
  ;; (at-stage ?t)  - the current discrete stage/timepoint
  ;; (succ ?t ?t2)  - successor relation between stages
  (:predicates
    (on ?b - block ?below - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at-stage ?t - stage)
    (succ ?t - stage ?t2 - stage)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions namespaced with "lp-" (local_planner origin). Each action
  ;; explicitly consumes the current stage and produces its successor to
  ;; force ordered discrete progression and forbid temporal backtracking.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Pick up a clear block from the table
  (:action lp-pickup
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (ontable ?b)
      (clear ?b)
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (handempty))
      (not (ontable ?b))
      ;; a held block is not considered clear (clear means no block on top AND not held)
      (not (clear ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

  ;; Unstack a clear block ?b from on top of block ?below
  (:action lp-unstack
    :parameters (?b - block ?below - block ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (on ?b ?below)
      (clear ?b)
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?below))
      ;; after removing ?b, the supporting block becomes clear
      (clear ?below)
      ;; a held block is not clear
      (not (clear ?b))
      (not (handempty))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

  ;; Put down a held block onto the table
  (:action lp-putdown
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

  ;; Stack a held block ?b onto block ?dest (destination must be clear)
  (:action lp-stack
    :parameters (?b - block ?dest - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?dest)
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (on ?b ?dest)
      ;; destination no longer clear after stacking
      (not (clear ?dest))
      ;; the stacked block is topmost and not held, therefore clear
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )
)