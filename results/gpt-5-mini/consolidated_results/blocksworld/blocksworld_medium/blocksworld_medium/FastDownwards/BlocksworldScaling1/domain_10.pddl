(define (domain BlocksworldScaling1)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?below - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at-stage ?t - stage)
    (succ ?t - stage ?t2 - stage)
  )

  ;; Actions namespaced with lp- to indicate local_planner origin.
  ;; Time/stage progression is explicit: each action requires the current stage and produces its successor,
  ;; enforcing contiguous occupancy and forbidding temporal slack.

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
      (not (clear ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

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
      (clear ?below)
      (not (clear ?b))
      (not (handempty))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

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
      (not (clear ?dest))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )
)