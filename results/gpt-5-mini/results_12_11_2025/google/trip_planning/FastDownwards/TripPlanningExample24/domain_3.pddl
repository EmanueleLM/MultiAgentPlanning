(define (domain europe-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at_city ?c - city)            ; current location at start of active day
    (on_day ?d - day)             ; which day is currently active (exactly one holds)
    (next ?d - day ?d2 - day)     ; successor relation for days
    (direct ?a - city ?b - city)  ; allowed direct flight edges (directed)
    (must_be ?d - day ?c - city)  ; day must be spent in this city (hard)
    (satisfied ?d - day)          ; day has been consumed/satisfied
    (workshop_window ?d - day)    ; workshop may be attended on this day
    (attended)                    ; workshop has been attended at least once
  )

  ;; Attend workshop on a non-final day (consume day and move to next)
  (:action attend_workshop_advance
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city florence)
      (must_be ?d florence)
      (workshop_window ?d)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (on_day ?d2)
      (satisfied ?d)
      (attended)
    )
  )

  ;; Consume the final day by attending workshop (if the final day were in window)
  (:action attend_workshop_final
    :parameters (?d - day)
    :precondition (and
      (on_day ?d)
      (at_city florence)
      (must_be ?d florence)
      (workshop_window ?d)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (satisfied ?d)
      (attended)
    )
  )

  ;; Stay in same city on a non-final day (consume day and advance)
  (:action stay_advance
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city ?c)
      (must_be ?d ?c)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (on_day ?d2)
      (satisfied ?d)
    )
  )

  ;; Consume the final day by staying in the same city
  (:action stay_final
    :parameters (?d - day ?c - city)
    :precondition (and
      (on_day ?d)
      (at_city ?c)
      (must_be ?d ?c)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (satisfied ?d)
    )
  )

  ;; Fly on a non-final day at the day boundary: spend day ?d in ?from, arrive at ?to for next day ?d2.
  ;; Enforce that day ?d must be spent in the departure city and day ?d2 must be spent in the arrival city.
  (:action fly_advance
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city ?from)
      (direct ?from ?to)
      (must_be ?d ?from)
      (must_be ?d2 ?to)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (on_day ?d2)
      (not (at_city ?from))
      (at_city ?to)
      (satisfied ?d)
    )
  )
)