(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    ;; traveler is in city on a specific day
    (at ?a - agent ?c - city ?d - day)

    ;; temporal ordering of days (next d1 d2 means d2 is the day after d1)
    (next ?d1 - day ?d2 - day)

    ;; direct flight connectivity between cities (bidirectional edges explicitly listed in :init)
    (direct ?c1 - city ?c2 - city)

    ;; confirmed visitation marker: city visited on a specific day (used to express duration constraints)
    (visited ?c - city ?d - day)

    ;; wedding attendance marker
    (wedding_attended)
  )

  ;; Stay in the same city from day d1 to the next day d2
  (:action stay_traveler
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?a ?c ?d2))
  )

  ;; Travel by direct flight from one city to another (consumes one day)
  (:action travel_traveler
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at ?a ?to ?d2))
  )

  ;; Confirm presence in a city on a given day (produces visited markers used in the problem goal)
  (:action confirm_visit
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and (at ?a ?c ?d))
    :effect (and (visited ?c ?d))
  )

  ;; Specific wedding-attendance actions for days 8..11: each requires being in Venice on that day
  (:action attend_wedding_day8
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and (at ?a Venice day8))
    :effect (and (wedding_attended))
  )

  (:action attend_wedding_day9
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and (at ?a Venice day9))
    :effect (and (wedding_attended))
  )

  (:action attend_wedding_day10
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and (at ?a Venice day10))
    :effect (and (wedding_attended))
  )

  (:action attend_wedding_day11
    :parameters (?a - agent ?c - city ?d - day)
    :precondition (and (at ?a Venice day11))
    :effect (and (wedding_attended))
  )
)