(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (free ?d - day)
    (in ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (arrival ?c - city ?d - day)
    (departure ?c - city ?d - day)
    (oslo-scheduled)
    (valencia-scheduled)
    (dublin-scheduled)
  )

  ;; Oslo scheduling actions (only two feasible start days as derived)
  (:action start-oslo-day1
    :precondition (and
      (free d1) (free d2) (free d3)
      (flight Dublin Oslo) (flight Oslo Dublin)
    )
    :effect (and
      (in Oslo d1) (in Oslo d2) (in Oslo d3)
      (not (free d1)) (not (free d2)) (not (free d3))
      (arrival Oslo d1)
      (departure Oslo d4) ;; departure flight scheduled on day after last occupancy (as per Oslo fragment)
      (oslo-scheduled)
    )
  )

  (:action start-oslo-day2
    :precondition (and
      (free d2) (free d3) (free d4)
      (flight Dublin Oslo) (flight Oslo Dublin)
    )
    :effect (and
      (in Oslo d2) (in Oslo d3) (in Oslo d4)
      (not (free d2)) (not (free d3)) (not (free d4))
      (arrival Oslo d2)
      (departure Oslo d5)
      (oslo-scheduled)
    )
  )

  ;; Valencia scheduling action (Valencia is required to occupy days 5..9 inclusive)
  (:action start-valencia-day5
    :precondition (and
      (free d5) (free d6) (free d7) (free d8) (free d9)
      (flight Dublin Valencia) (flight Valencia Dublin)
    )
    :effect (and
      (in Valencia d5) (in Valencia d6) (in Valencia d7) (in Valencia d8) (in Valencia d9)
      (not (free d5)) (not (free d6)) (not (free d7)) (not (free d8)) (not (free d9))
      (arrival Valencia d5)
      (departure Valencia d9)  ;; departure recorded on last occupied day (matching Valencia fragment mapping)
      (valencia-scheduled)
    )
  )

  ;; Dublin scheduling actions: 3-day consecutive stays; allow start days 1..7
  ;; Each action requires the direct flight connections exist (Oslo<->Dublin and Dublin<->Valencia are declared in domain facts)
  (:action start-dublin-day1
    :precondition (and
      (free d1) (free d2) (free d3)
      (flight Oslo Dublin) (flight Valencia Dublin) ;; inbound options available as direct connections
    )
    :effect (and
      (in Dublin d1) (in Dublin d2) (in Dublin d3)
      (not (free d1)) (not (free d2)) (not (free d3))
      (arrival Dublin d1)
      (departure Dublin d3)
      (dublin-scheduled)
    )
  )

  (:action start-dublin-day2
    :precondition (and
      (free d2) (free d3) (free d4)
      (flight Oslo Dublin) (flight Valencia Dublin)
    )
    :effect (and
      (in Dublin d2) (in Dublin d3) (in Dublin d4)
      (not (free d2)) (not (free d3)) (not (free d4))
      (arrival Dublin d2)
      (departure Dublin d4)
      (dublin-scheduled)
    )
  )

  (:action start-dublin-day3
    :precondition (and
      (free d3) (free d4) (free d5)
      (flight Oslo Dublin) (flight Valencia Dublin)
    )
    :effect (and
      (in Dublin d3) (in Dublin d4) (in Dublin d5)
      (not (free d3)) (not (free d4)) (not (free d5))
      (arrival Dublin d3)
      (departure Dublin d5)
      (dublin-scheduled)
    )
  )

  (:action start-dublin-day4
    :precondition (and
      (free d4) (free d5) (free d6)
      (flight Oslo Dublin) (flight Valencia Dublin)
    )
    :effect (and
      (in Dublin d4) (in Dublin d5) (in Dublin d6)
      (not (free d4)) (not (free d5)) (not (free d6))
      (arrival Dublin d4)
      (departure Dublin d6)
      (dublin-scheduled)
    )
  )

  (:action start-dublin-day5
    :precondition (and
      (free d5) (free d6) (free d7)
      (flight Oslo Dublin) (flight Valencia Dublin)
    )
    :effect (and
      (in Dublin d5) (in Dublin d6) (in Dublin d7)
      (not (free d5)) (not (free d6)) (not (free d7))
      (arrival Dublin d5)
      (departure Dublin d7)
      (dublin-scheduled)
    )
  )

  (:action start-dublin-day6
    :precondition (and
      (free d6) (free d7) (free d8)
      (flight Oslo Dublin) (flight Valencia Dublin)
    )
    :effect (and
      (in Dublin d6) (in Dublin d7) (in Dublin d8)
      (not (free d6)) (not (free d7)) (not (free d8))
      (arrival Dublin d6)
      (departure Dublin d8)
      (dublin-scheduled)
    )
  )

  (:action start-dublin-day7
    :precondition (and
      (free d7) (free d8) (free d9)
      (flight Oslo Dublin) (flight Valencia Dublin)
    )
    :effect (and
      (in Dublin d7) (in Dublin d8) (in Dublin d9)
      (not (free d7)) (not (free d8)) (not (free d9))
      (arrival Dublin d7)
      (departure Dublin d9)
      (dublin-scheduled)
    )
  )

)