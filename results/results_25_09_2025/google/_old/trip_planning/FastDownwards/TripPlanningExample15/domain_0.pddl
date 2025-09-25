(define (domain integrated_travel)
  (:requirements :typing :fluents :conditional-effects :equality :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
    (is-berlin ?c - city)
    (is-porto ?c - city)
    (is-krakow ?c - city)
    (attended-wedding)
  )

  (:functions
    (berlin-stay-count) ; increments when berlin agent stays or when arriving to Berlin via berlin agent fly
    (porto-days)        ; increments when travel agent stays in Porto
    (trip-length)       ; informational (initialized in problem)
  )

  ;-----------------------
  ; Actions from berlin_travel agent (kept distinct: berlin_ prefix)
  ;-----------------------
  ;; Stay in same city for one day; if that city is Berlin increase berlin-stay-count.
  (:action berlin_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (when (is-berlin ?c)
                    (increase (berlin-stay-count) 1))
            )
  )

  ;; Fly (Berlin agent action): fly between two cities if direct and progress one day.
  ;; If arriving in Berlin, increment berlin-stay-count.
  (:action berlin_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (when (is-berlin ?to)
                    (increase (berlin-stay-count) 1))
            )
  )

  ;-----------------------
  ; Actions from travel-wedding agent (kept distinct: travel_ prefix)
  ; Adapted to time-indexed 'at' (day parameters) and to use is-porto predicate / porto-days.
  ;-----------------------
  ;; Fly according to travel agent (uses explicit day parameters).
  (:action travel_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
            )
  )

  ;; Stay according to travel agent: spends one day at current city and increments porto-days when staying in Porto.
  (:action travel_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (when (is-porto ?c)
                    (increase (porto-days) 1))
            )
  )

  ;; Attend the wedding action: must be at Porto on the wedding day (day10).
  ;; This action does not advance the day; it marks the wedding attended.
  (:action travel_attend_wedding
    :parameters ()
    :precondition (and (at porto day10) (not (attended-wedding)))
    :effect (attended-wedding)
  )

  ;-----------------------
  ; Actions from trip agent (kept distinct: trip_ prefix)
  ;-----------------------
  ;; Trip agent fly: when used it also marks the arrival city as visited.
  (:action trip_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (visited ?to)
            )
  )

  ;; Trip agent stay: mark the city visited while staying.
  (:action trip_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (visited ?c)
            )
  )

  ;; Trip agent special 5-day contiguous stay in Krakow (kept but adapted).
  ;; Requires five consecutive days and presence at the first of them; declares presence/visited for the subsequent days.
  (:action trip_stay_krakow_5days
    :parameters (?c - city ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?d5 - day)
    :precondition (and
      (is-krakow ?c)
      (at ?c ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?d5)
    )
    :effect (and
      ;; remove presence at the starting day and assert presence on the following days
      (not (at ?c ?d1))
      (at ?c ?d2) (at ?c ?d3) (at ?c ?d4) (at ?c ?d5)
      (visited ?c)
    )
  )

)