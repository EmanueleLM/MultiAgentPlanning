(define (domain integrated-travel)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (not-started)
    (at-day ?c - city ?d - day)
    (used-day ?d - day)
    (first ?d - day)
    (workshop-day ?d - day)
    (workshop-held)
    (at ?c - city)
    (current-day ?d - day)
    (between1and3 ?d - day)
    (workshop-done)
    (is-prague ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action start-in
    :parameters (?c - city ?d - day)
    :precondition (and (not-started) (first ?d))
    :effect (and
      (not (not-started))
      (at-day ?c ?d)
      (visited ?c)
      (used-day ?d)
    )
  )

  (:action traveler-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?c ?d1) (next ?d1 ?d2))
    :effect (and
      (not (at-day ?c ?d1))
      (at-day ?c ?d2)
      (visited ?c)
      (used-day ?d2)
    )
  )

  (:action traveler-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
      (not (at-day ?from ?d1))
      (at-day ?to ?d2)
      (visited ?to)
      (used-day ?d2)
    )
  )

  (:action hold-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (at-day ?c ?d) (workshop-day ?d) (is-prague ?c))
    :effect (workshop-held)
  )

  (:action move
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current-day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d1))
      (current-day ?d2)
      (visited ?to)
    )
  )

  (:action flights-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current-day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (visited ?c)
    )
  )

  (:action attend-workshop
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (between1and3 ?d)
      (is-prague ?c)
    )
    :effect (workshop-done)
  )
)