(define (domain trip-planning-example3)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (connected ?from - city ?to - city)    ; direct-flight connectivity (symmetric links provided in problem)
    (prev ?p - day ?d - day)               ; ordering: ?p is previous day of ?d
    (day-assigned ?d - day)                ; indicates a city has been assigned to a day
    (located ?c - city ?d - day)           ; traveler located in city ?c on day ?d
    (travel-day ?d - day)                  ; day on which travel (flight) occurs
    (visited ?c - city)                    ; traveler has visited city ?c at least once
    (meeting ?c - city ?d - day)           ; meeting with friend scheduled in city ?c on day ?d
  )

  ;; Assign a city for a day (choose any city as start). Marks the day assigned and the city visited.
  (:action assign-day1
    :parameters (?c - city ?d - day)
    :precondition (and (not (day-assigned ?d)))
    :effect (and (day-assigned ?d) (located ?c ?d) (visited ?c))
  )

  ;; Stay in the same city for the next day (non-travel day).
  ;; Move from previous day ?prev to day ?d, staying in same city.
  (:action stay
    :parameters (?c - city ?prev - day ?d - day)
    :precondition (and (prev ?prev ?d) (not (day-assigned ?d)) (located ?c ?prev))
    :effect (and (day-assigned ?d) (located ?c ?d) (visited ?c))
  )

  ;; Travel on day ?d from city ?from (where traveler was on ?prev) to directly connected ?to.
  ;; Travel consumes that day (marked as travel-day); arrival location is the destination that day.
  (:action travel
    :parameters (?from - city ?to - city ?prev - day ?d - day)
    :precondition (and (prev ?prev ?d) (not (day-assigned ?d)) (located ?from ?prev) (connected ?from ?to))
    :effect (and (day-assigned ?d) (located ?to ?d) (travel-day ?d) (visited ?to))
  )

  ;; Schedule a meeting in Bucharest on a day that is assigned, non-travel, and when the traveler is located in Bucharest.
  (:action schedule-meeting-bucharest
    :parameters (?d - day)
    :precondition (and (day-assigned ?d) (located bucharest ?d) (not (travel-day ?d)))
    :effect (meeting bucharest ?d)
  )
)