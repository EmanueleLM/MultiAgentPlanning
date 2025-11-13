(define (domain europe-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at_city ?c - city)            ; current city location
    (on_day ?d - day)             ; which day is active (exactly one)
    (next ?d - day ?d2 - day)     ; temporal chain
    (direct ?a - city ?b - city)  ; allowed direct flight edges
    (must_be ?d - day ?c - city)  ; hard constraint: day must be spent in city
    (satisfied ?d - day)          ; day has been consumed/satisfied
    (workshop_window ?d - day)    ; workshop allowed on this day
    (attended)                    ; workshop has been attended at least once
  )

  ;; Attend workshop on a non-final day (consumes the day and advances to next)
  (:action attend_workshop_advance
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city florence)
      (workshop_window ?d)
      (must_be ?d florence)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (on_day ?d2)
      (satisfied ?d)
      (attended)
    )
  )

  ;; Attend workshop on the final day (consumes the final day)
  (:action attend_workshop_final
    :parameters (?d - day)
    :precondition (and
      (on_day ?d)
      (at_city florence)
      (workshop_window ?d)
      (must_be ?d florence)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (satisfied ?d)
      (attended)
    )
  )

  ;; Stay in the same city on a non-final day (consumes the day and advances)
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

  ;; Stay in the same city on the final day (consumes final day)
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

  ;; Fly on a non-final day: travel from ?from to ?to, must be direct, and day ?d requires being in ?to
  (:action fly_advance
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city ?from)
      (direct ?from ?to)
      (must_be ?d ?to)
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

  ;; Fly on the final day: travel and finish (no next)
  (:action fly_final
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (on_day ?d)
      (at_city ?from)
      (direct ?from ?to)
      (must_be ?d ?to)
      (not (satisfied ?d))
    )
    :effect (and
      (not (on_day ?d))
      (not (at_city ?from))
      (at_city ?to)
      (satisfied ?d)
    )
  )
)