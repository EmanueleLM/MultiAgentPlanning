(define (domain integrated-travel)
  (:requirements :typing :fluents)
  (:types city day)

  (:predicates
    (not-started)
    (at-day ?c - city ?d - day)
    (first ?d - day)
    (workshop-day ?d - day)
    (workshop-held)
    (is-prague ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  (:functions
    (days-in ?c - city)
  )

  (:action traveler-start-in
    :parameters (?c - city ?d - day)
    :precondition (and (not-started) (first ?d))
    :effect (and
      (not (not-started))
      (at-day ?c ?d)
      (visited ?c)
      (increase (days-in ?c) 1)
    )
  )

  (:action traveler-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?c ?d1) (next ?d1 ?d2))
    :effect (and
      (not (at-day ?c ?d1))
      (at-day ?c ?d2)
      (visited ?c)
      (increase (days-in ?c) 1)
    )
  )

  (:action traveler-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
      (not (at-day ?from ?d1))
      (at-day ?to ?d2)
      (visited ?to)
      (increase (days-in ?to) 1)
    )
  )

  (:action traveler-hold-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (at-day ?c ?d) (workshop-day ?d) (is-prague ?c))
    :effect (workshop-held)
  )

  (:action flights-start-in
    :parameters (?c - city ?d - day)
    :precondition (and (not-started) (first ?d))
    :effect (and
      (not (not-started))
      (at-day ?c ?d)
      (visited ?c)
      (increase (days-in ?c) 1)
    )
  )

  (:action flights-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?c ?d1) (next ?d1 ?d2))
    :effect (and
      (not (at-day ?c ?d1))
      (at-day ?c ?d2)
      (visited ?c)
      (increase (days-in ?c) 1)
    )
  )

  (:action flights-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
      (not (at-day ?from ?d1))
      (at-day ?to ?d2)
      (visited ?to)
      (increase (days-in ?to) 1)
    )
  )

  (:action flights-hold-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (at-day ?c ?d) (workshop-day ?d) (is-prague ?c))
    :effect (workshop-held)
  )
)