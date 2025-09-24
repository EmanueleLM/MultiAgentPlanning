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
    (is-prague ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  ;; Traveler agent actions (explicitly named to keep agent actions distinct)
  (:action traveler-start-in
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

  (:action traveler-hold-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (at-day ?c ?d) (workshop-day ?d) (is-prague ?c))
    :effect (workshop-held)
  )

  ;; Flights agent actions (distinct names; represent flight operations but keep separate from traveler)
  (:action flights-start-in
    :parameters (?c - city ?d - day)
    :precondition (and (not-started) (first ?d))
    :effect (and
      (not (not-started))
      (at-day ?c ?d)
      (visited ?c)
      (used-day ?d)
    )
  )

  (:action flights-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?c ?d1) (next ?d1 ?d2))
    :effect (and
      (not (at-day ?c ?d1))
      (at-day ?c ?d2)
      (visited ?c)
      (used-day ?d2)
    )
  )

  (:action flights-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
      (not (at-day ?from ?d1))
      (at-day ?to ?d2)
      (visited ?to)
      (used-day ?d2)
    )
  )

  (:action flights-hold-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (at-day ?c ?d) (workshop-day ?d) (is-prague ?c))
    :effect (workshop-held)
  )
)