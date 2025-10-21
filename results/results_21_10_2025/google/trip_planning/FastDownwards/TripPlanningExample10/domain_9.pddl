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

  ;; Oslo: 3-day stay. Possible start days: 1..7 (so that 3 consecutive days fit into 9-day trip)
  (:action start-oslo-day1
    :parameters ()
    :precondition (and (not (oslo-scheduled)) (free d1) (free d2) (free d3))
    :effect (and
      (in oslo d1) (in oslo d2) (in oslo d3)
      (not (free d1)) (not (free d2)) (not (free d3))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day2
    :parameters ()
    :precondition (and (not (oslo-scheduled)) (free d2) (free d3) (free d4))
    :effect (and
      (in oslo d2) (in oslo d3) (in oslo d4)
      (not (free d2)) (not (free d3)) (not (free d4))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day3
    :parameters ()
    :precondition (and (not (oslo-scheduled)) (free d3) (free d4) (free d5))
    :effect (and
      (in oslo d3) (in oslo d4) (in oslo d5)
      (not (free d3)) (not (free d4)) (not (free d5))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day4
    :parameters ()
    :precondition (and (not (oslo-scheduled)) (free d4) (free d5) (free d6))
    :effect (and
      (in oslo d4) (in oslo d5) (in oslo d6)
      (not (free d4)) (not (free d5)) (not (free d6))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day5
    :parameters ()
    :precondition (and (not (oslo-scheduled)) (free d5) (free d6) (free d7))
    :effect (and
      (in oslo d5) (in oslo d6) (in oslo d7)
      (not (free d5)) (not (free d6)) (not (free d7))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day6
    :parameters ()
    :precondition (and (not (oslo-scheduled)) (free d6) (free d7) (free d8))
    :effect (and
      (in oslo d6) (in oslo d7) (in oslo d8)
      (not (free d6)) (not (free d7)) (not (free d8))
      (oslo-scheduled)
    )
  )
  (:action start-oslo-day7
    :parameters ()
    :precondition (and (not (oslo-scheduled)) (free d7) (free d8) (free d9))
    :effect (and
      (in oslo d7) (in oslo d8) (in oslo d9)
      (not (free d7)) (not (free d8)) (not (free d9))
      (oslo-scheduled)
    )
  )

  ;; Valencia: 5-day stay. To ensure relatives can be visited between days 5..9 inclusive,
  ;; any 5-day block that includes at least day5 is acceptable. Possible start days: 1..5
  (:action start-valencia-day1
    :parameters ()
    :precondition (and (not (valencia-scheduled)) (free d1) (free d2) (free d3) (free d4) (free d5))
    :effect (and
      (in valencia d1) (in valencia d2) (in valencia d3) (in valencia d4) (in valencia d5)
      (not (free d1)) (not (free d2)) (not (free d3)) (not (free d4)) (not (free d5))
      (valencia-scheduled)
    )
  )
  (:action start-valencia-day2
    :parameters ()
    :precondition (and (not (valencia-scheduled)) (free d2) (free d3) (free d4) (free d5) (free d6))
    :effect (and
      (in valencia d2) (in valencia d3) (in valencia d4) (in valencia d5) (in valencia d6)
      (not (free d2)) (not (free d3)) (not (free d4)) (not (free d5)) (not (free d6))
      (valencia-scheduled)
    )
  )
  (:action start-valencia-day3
    :parameters ()
    :precondition (and (not (valencia-scheduled)) (free d3) (free d4) (free d5) (free d6) (free d7))
    :effect (and
      (in valencia d3) (in valencia d4) (in valencia d5) (in valencia d6) (in valencia d7)
      (not (free d3)) (not (free d4)) (not (free d5)) (not (free d6)) (not (free d7))
      (valencia-scheduled)
    )
  )
  (:action start-valencia-day4
    :parameters ()
    :precondition (and (not (valencia-scheduled)) (free d4) (free d5) (free d6) (free d7) (free d8))
    :effect (and
      (in valencia d4) (in valencia d5) (in valencia d6) (in valencia d7) (in valencia d8)
      (not (free d4)) (not (free d5)) (not (free d6)) (not (free d7)) (not (free d8))
      (valencia-scheduled)
    )
  )
  (:action start-valencia-day5
    :parameters ()
    :precondition (and (not (valencia-scheduled)) (free d5) (free d6) (free d7) (free d8) (free d9))
    :effect (and
      (in valencia d5) (in valencia d6) (in valencia d7) (in valencia d8) (in valencia d9)
      (not (free d5)) (not (free d6)) (not (free d7)) (not (free d8)) (not (free d9))
      (valencia-scheduled)
    )
  )

  ;; Dublin: 3-day stay. Possible start days: 1..7
  (:action start-dublin-day1
    :parameters ()
    :precondition (and (not (dublin-scheduled)) (free d1) (free d2) (free d3))
    :effect (and
      (in dublin d1) (in dublin d2) (in dublin d3)
      (not (free d1)) (not (free d2)) (not (free d3))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day2
    :parameters ()
    :precondition (and (not (dublin-scheduled)) (free d2) (free d3) (free d4))
    :effect (and
      (in dublin d2) (in dublin d3) (in dublin d4)
      (not (free d2)) (not (free d3)) (not (free d4))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day3
    :parameters ()
    :precondition (and (not (dublin-scheduled)) (free d3) (free d4) (free d5))
    :effect (and
      (in dublin d3) (in dublin d4) (in dublin d5)
      (not (free d3)) (not (free d4)) (not (free d5))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day4
    :parameters ()
    :precondition (and (not (dublin-scheduled)) (free d4) (free d5) (free d6))
    :effect (and
      (in dublin d4) (in dublin d5) (in dublin d6)
      (not (free d4)) (not (free d5)) (not (free d6))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day5
    :parameters ()
    :precondition (and (not (dublin-scheduled)) (free d5) (free d6) (free d7))
    :effect (and
      (in dublin d5) (in dublin d6) (in dublin d7)
      (not (free d5)) (not (free d6)) (not (free d7))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day6
    :parameters ()
    :precondition (and (not (dublin-scheduled)) (free d6) (free d7) (free d8))
    :effect (and
      (in dublin d6) (in dublin d7) (in dublin d8)
      (not (free d6)) (not (free d7)) (not (free d8))
      (dublin-scheduled)
    )
  )
  (:action start-dublin-day7
    :parameters ()
    :precondition (and (not (dublin-scheduled)) (free d7) (free d8) (free d9))
    :effect (and
      (in dublin d7) (in dublin d8) (in dublin d9)
      (not (free d7)) (not (free d8)) (not (free d9))
      (dublin-scheduled)
    )
  )
)