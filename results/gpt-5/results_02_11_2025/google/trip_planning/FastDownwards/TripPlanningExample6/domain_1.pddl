(define (domain trip8days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)                    ; current city
    (cur ?d - day)                    ; current day token
    (next ?d1 - day ?d2 - day)        ; day successor relation
    (edge ?from - city ?to - city)    ; direct flight availability
    (visited ?c - city ?d - day)      ; record that city was visited on day
    (required-berlin-day ?d - day)    ; conference-required day
    (attended ?d - day)               ; conference attendance recorded for a required day
    (is-berlin ?c - city)             ; marks the Berlin city object
    (final-day ?d - day)              ; marks last day
    (finished)                        ; goal completion flag
  )

  ; Stay in the same city for the day and advance to the next day
  (:action stay-and-advance
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (cur ?d)
      (next ?d ?d2)
      (at ?c)
    )
    :effect (and
      (visited ?c ?d)
      (not (cur ?d))
      (cur ?d2)
    )
  )

  ; Fly along a direct edge in the evening and advance to the next day
  (:action fly-and-advance
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (cur ?d)
      (next ?d ?d2)
      (at ?from)
      (edge ?from ?to)
    )
    :effect (and
      (visited ?from ?d)
      (not (at ?from))
      (at ?to)
      (not (cur ?d))
      (cur ?d2)
    )
  )

  ; Attend the Berlin conference on required days while being in Berlin
  (:action attend-berlin
    :parameters (?d - day ?c - city)
    :precondition (and
      (cur ?d)
      (at ?c)
      (is-berlin ?c)
      (required-berlin-day ?d)
      (not (attended ?d))
    )
    :effect (and
      (attended ?d)
    )
  )

  ; Conclude the final day, recording the visit and marking the trip finished
  (:action finish-day
    :parameters (?d - day ?c - city)
    :precondition (and
      (cur ?d)
      (final-day ?d)
      (at ?c)
    )
    :effect (and
      (visited ?c ?d)
      (not (cur ?d))
      (finished)
    )
  )
)