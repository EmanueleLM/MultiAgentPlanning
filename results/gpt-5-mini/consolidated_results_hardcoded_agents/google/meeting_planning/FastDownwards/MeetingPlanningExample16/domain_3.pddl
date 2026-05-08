(define (domain schedule-selection)
  (:requirements :strips :typing :negative-preconditions)
  (:types schedule)
  (:predicates
    (feasible ?s - schedule)
    (best ?s - schedule)
    (selected ?s - schedule)
    (choice-open)
    (met-ronald)
    (has-contiguous-105 ?s - schedule)
  )

  (:action choose-best
    :parameters (?s - schedule)
    :precondition (and (choice-open) (feasible ?s) (best ?s))
    :effect (and (selected ?s) (not (choice-open)))
  )

  (:action execute-meeting
    :parameters (?s - schedule)
    :precondition (and (selected ?s) (has-contiguous-105 ?s))
    :effect (met-ronald)
  )
)