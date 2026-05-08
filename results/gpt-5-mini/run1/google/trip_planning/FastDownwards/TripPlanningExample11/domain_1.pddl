(define (domain trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city stage)

  (:predicates
    (succ ?d1 - day ?d2 - day)            ; successor relation between days (night d -> d+1)
    (at ?d - day ?c - city)              ; traveler is in city on day
    (assigned ?d - day)                  ; the location for this day has been assigned
    (direct ?c1 - city ?c2 - city)       ; direct flight exists from c1 to c2 (single-night)
    (in-stage ?d - day ?s - stage)       ; day belongs to a named stage/time-window
    (stage-city ?s - stage ?c - city)    ; stage is designated for a specific city (static mapping)
  )

  ;; Stay in the same city across the night d->d2 (no flight scheduled that night)
  ;; Requires being at day d in the city and that the next day is not yet assigned.
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (succ ?d ?d2)
      (at ?d ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  ;; Take a direct flight on night d->d2 from ?from to ?to (allowed only if direct exists)
  ;; Transition consumes the night and places traveler at destination on the next day.
  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (succ ?d ?d2)
      (at ?d ?from)
      (direct ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
    )
  )
)