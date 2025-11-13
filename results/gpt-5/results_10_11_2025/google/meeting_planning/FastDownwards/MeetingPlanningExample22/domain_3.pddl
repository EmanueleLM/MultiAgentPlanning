(define (domain meetingplanningexample22)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location time)
  (:constants presidio union_square - location)
  (:predicates
    (at ?l - location)
    (met_andrew)
    (cur ?t - time)
    (succ_60 ?from - time ?to - time)
    (succ_30 ?from - time ?to - time)
    (succ_15 ?from - time ?to - time)
    (succ_8 ?from - time ?to - time)
    (succ_22 ?from - time ?to - time)
    (succ_24 ?from - time ?to - time)
    (succ_105 ?from - time ?to - time)
    (meet_start_ok ?t - time)
  )
  (:functions (total-cost))

  (:action wait_60
    :parameters (?from - time ?to - time)
    :precondition (and (cur ?from) (succ_60 ?from ?to) (not (met_andrew)))
    :effect (and
      (not (cur ?from))
      (cur ?to)
      (increase (total-cost) 60)
    )
  )

  (:action wait_30
    :parameters (?from - time ?to - time)
    :precondition (and (cur ?from) (succ_30 ?from ?to) (not (met_andrew)))
    :effect (and
      (not (cur ?from))
      (cur ?to)
      (increase (total-cost) 30)
    )
  )

  (:action wait_15
    :parameters (?from - time ?to - time)
    :precondition (and (cur ?from) (succ_15 ?from ?to) (not (met_andrew)))
    :effect (and
      (not (cur ?from))
      (cur ?to)
      (increase (total-cost) 15)
    )
  )

  (:action wait_8
    :parameters (?from - time ?to - time)
    :precondition (and (cur ?from) (succ_8 ?from ?to) (not (met_andrew)))
    :effect (and
      (not (cur ?from))
      (cur ?to)
      (increase (total-cost) 8)
    )
  )

  (:action travel_presidio_union
    :parameters (?from - time ?to - time)
    :precondition (and (at presidio) (cur ?from) (succ_22 ?from ?to))
    :effect (and
      (not (at presidio))
      (at union_square)
      (not (cur ?from))
      (cur ?to)
      (increase (total-cost) 22)
    )
  )

  (:action travel_union_presidio
    :parameters (?from - time ?to - time)
    :precondition (and (at union_square) (cur ?from) (succ_24 ?from ?to))
    :effect (and
      (not (at union_square))
      (at presidio)
      (not (cur ?from))
      (cur ?to)
      (increase (total-cost) 24)
    )
  )

  (:action meet_andrew_105
    :parameters (?from - time ?to - time)
    :precondition (and
      (at union_square)
      (cur ?from)
      (not (met_andrew))
      (meet_start_ok ?from)
      (succ_105 ?from ?to)
    )
    :effect (and
      (met_andrew)
      (not (cur ?from))
      (cur ?to)
      (increase (total-cost) 0)
    )
  )
)