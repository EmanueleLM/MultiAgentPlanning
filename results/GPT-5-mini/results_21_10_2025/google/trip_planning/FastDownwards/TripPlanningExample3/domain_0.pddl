(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (connected ?from - city ?to - city)
    (prev ?prev - day ?d - day)
    (day-assigned ?d - day)
    (located ?c - city ?d - day)
    (travel-day ?d - day)
    (full-meeting ?c - city ?d - day)
  )

  ;; Assign the first-day location (arrival / orientation).
  (:action assign-day1-stay
    :parameters (?c - city ?d - day)
    :precondition (and (not (day-assigned ?d)))
    :effect (and (day-assigned ?d) (located ?c ?d))
  )

  ;; Stay in the same city for the next day (full-day or non-travel day).
  (:action stay
    :parameters (?c - city ?prev - day ?d - day)
    :precondition (and (prev ?prev ?d) (not (day-assigned ?d)) (located ?c ?prev))
    :effect (and (day-assigned ?d) (located ?c ?d))
  )

  ;; Travel on day ?d from ?from (previous day's city) to direct-connected ?to.
  ;; Travel consumes that day as a travel day (no full meeting allowed on that day).
  (:action travel
    :parameters (?from - city ?to - city ?prev - day ?d - day)
    :precondition (and (prev ?prev ?d) (not (day-assigned ?d)) (located ?from ?prev) (connected ?from ?to))
    :effect (and (day-assigned ?d) (located ?to ?d) (travel-day ?d))
  )

  ;; Schedule a full meeting day in Berlin (only allowed if the day is assigned,
  ;; the traveler is located in Berlin that day, the day is not a travel day,
  ;; and no other city's full meeting is already scheduled that day).
  (:action schedule-full-meeting-berlin
    :parameters (?d - day)
    :precondition (and (day-assigned ?d) (located Berlin ?d) (not (travel-day ?d)) (not (full-meeting Warsaw ?d)) (not (full-meeting Bucharest ?d)))
    :effect (full-meeting Berlin ?d)
  )

  ;; Schedule a full meeting day in Warsaw.
  (:action schedule-full-meeting-warsaw
    :parameters (?d - day)
    :precondition (and (day-assigned ?d) (located Warsaw ?d) (not (travel-day ?d)) (not (full-meeting Berlin ?d)) (not (full-meeting Bucharest ?d)))
    :effect (full-meeting Warsaw ?d)
  )

  ;; Schedule a full meeting day in Bucharest.
  (:action schedule-full-meeting-bucharest
    :parameters (?d - day)
    :precondition (and (day-assigned ?d) (located Bucharest ?d) (not (travel-day ?d)) (not (full-meeting Berlin ?d)) (not (full-meeting Warsaw ?d)))
    :effect (full-meeting Bucharest ?d)
  )
)