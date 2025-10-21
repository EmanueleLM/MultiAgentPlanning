(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (free ?d - day)
    (in ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (oslo-scheduled)
    (valencia-scheduled)
    (dublin-scheduled)
  )

  ;; Oslo: 3 consecutive-day stays; possible start days 1..7 (so occupancy fits within 9 days)
  (:action start-oslo-day1
    :precondition (and (free d1) (free d2) (free d3) (flight Oslo Dublin) (flight Dublin Oslo))
    :effect (and
      (in Oslo d1) (in Oslo d2) (in Oslo d3)
      (not (free d1)) (not (free d2)) (not (free d3))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day2
    :precondition (and (free d2) (free d3) (free d4) (flight Oslo Dublin) (flight Dublin Oslo))
    :effect (and
      (in Oslo d2) (in Oslo d3) (in Oslo d4)
      (not (free d2)) (not (free d3)) (not (free d4))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day3
    :precondition (and (free d3) (free d4) (free d5) (flight Oslo Dublin) (flight Dublin Oslo))
    :effect (and
      (in Oslo d3) (in Oslo d4) (in Oslo d5)
      (not (free d3)) (not (free d4)) (not (free d5))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day4
    :precondition (and (free d4) (free d5) (free d6) (flight Oslo Dublin) (flight Dublin Oslo))
    :effect (and
      (in Oslo d4) (in Oslo d5) (in Oslo d6)
      (not (free d4)) (not (free d5)) (not (free d6))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day5
    :precondition (and (free d5) (free d6) (free d7) (flight Oslo Dublin) (flight Dublin Oslo))
    :effect (and
      (in Oslo d5) (in Oslo d6) (in Oslo d7)
      (not (free d5)) (not (free d6)) (not (free d7))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day6
    :precondition (and (free d6) (free d7) (free d8) (flight Oslo Dublin) (flight Dublin Oslo))
    :effect (and
      (in Oslo d6) (in Oslo d7) (in Oslo d8)
      (not (free d6)) (not (free d7)) (not (free d8))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day7
    :precondition (and (free d7) (free d8) (free d9) (flight Oslo Dublin) (flight Dublin Oslo))
    :effect (and
      (in Oslo d7) (in Oslo d8) (in Oslo d9)
      (not (free d7)) (not (free d8)) (not (free d9))
      (oslo-scheduled)
    )
  )

  ;; Valencia: must occupy days 5..9 inclusive (exactly 5 days). Only one allowed start so relatives window enforced.
  (:action start-valencia-day5
    :precondition (and (free d5) (free d6) (free d7) (free d8) (free d9) (flight Dublin Valencia) (flight Valencia Dublin))
    :effect (and
      (in Valencia d5) (in Valencia d6) (in Valencia d7) (in Valencia d8) (in Valencia d9)
      (not (free d5)) (not (free d6)) (not (free d7)) (not (free d8)) (not (free d9))
      (valencia-scheduled)
    )
  )

  ;; Dublin: 3 consecutive-day stays; possible start days 1..7
  (:action start-dublin-day1
    :precondition (and (free d1) (free d2) (free d3) (flight Dublin Oslo) (flight Dublin Valencia))
    :effect (and
      (in Dublin d1) (in Dublin d2) (in Dublin d3)
      (not (free d1)) (not (free d2)) (not (free d3))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day2
    :precondition (and (free d2) (free d3) (free d4) (flight Dublin Oslo) (flight Dublin Valencia))
    :effect (and
      (in Dublin d2) (in Dublin d3) (in Dublin d4)
      (not (free d2)) (not (free d3)) (not (free d4))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day3
    :precondition (and (free d3) (free d4) (free d5) (flight Dublin Oslo) (flight Dublin Valencia))
    :effect (and
      (in Dublin d3) (in Dublin d4) (in Dublin d5)
      (not (free d3)) (not (free d4)) (not (free d5))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day4
    :precondition (and (free d4) (free d5) (free d6) (flight Dublin Oslo) (flight Dublin Valencia))
    :effect (and
      (in Dublin d4) (in Dublin d5) (in Dublin d6)
      (not (free d4)) (not (free d5)) (not (free d6))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day5
    :precondition (and (free d5) (free d6) (free d7) (flight Dublin Oslo) (flight Dublin Valencia))
    :effect (and
      (in Dublin d5) (in Dublin d6) (in Dublin d7)
      (not (free d5)) (not (free d6)) (not (free d7))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day6
    :precondition (and (free d6) (free d7) (free d8) (flight Dublin Oslo) (flight Dublin Valencia))
    :effect (and
      (in Dublin d6) (in Dublin d7) (in Dublin d8)
      (not (free d6)) (not (free d7)) (not (free d8))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day7
    :precondition (and (free d7) (free d8) (free d9) (flight Dublin Oslo) (flight Dublin Valencia))
    :effect (and
      (in Dublin d7) (in Dublin d8) (in Dublin d9)
      (not (free d7)) (not (free d8)) (not (free d9))
      (dublin-scheduled)
    )
  )
)