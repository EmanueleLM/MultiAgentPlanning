(define (domain meeting-selection)
  (:requirements :strips :typing)
  (:types
    schedule
  )
  (:predicates
    (feasible ?s - schedule)
    (best ?s - schedule)
    (selected ?s - schedule)
    (choice-open)
    (met-ronald)
  )

  (:action choose-best
    :parameters (?s - schedule)
    :precondition (and
      (choice-open)
      (feasible ?s)
      (best ?s)
    )
    :effect (and
      (selected ?s)
      (not (choice-open))
    )
  )

  (:action execute-meeting
    :parameters (?s - schedule)
    :precondition (selected ?s)
    :effect (met-ronald)
  )
)