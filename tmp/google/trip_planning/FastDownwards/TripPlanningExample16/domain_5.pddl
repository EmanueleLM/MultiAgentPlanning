(define (domain integrated-travel)
  (:requirements :typing :adl)
  (:types city day count)

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
    (has-days ?c - city ?n - count)
    (count-next ?n1 - count ?n2 - count)
    (total-days ?n - count)
  )

  (:action traveler-start-in
    :parameters (?c - city ?d - day ?n0 - count ?n1 - count)
    :precondition (and (not-started) (first ?d) (has-days ?c ?n0) (count-next ?n0 ?n1))
    :effect (and
      (not (not-started))
      (not (has-days ?c ?n0))
      (has-days ?c ?n1)
      (at-day ?c ?d)
      (visited ?c)
    )
  )

  (:action traveler-stay
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and (at-day ?c ?d1) (next ?d1 ?d2) (has-days ?c ?n1) (count-next ?n1 ?n2))
    :effect (and
      (not (at-day ?c ?d1))
      (at-day ?c ?d2)
      (not (has-days ?c ?n1))
      (has-days ?c ?n2)
      (visited ?c)
    )
  )

  (:action traveler-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and (at-day ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (has-days ?to ?n1) (count-next ?n1 ?n2))
    :effect (and
      (not (at-day ?from ?d1))
      (at-day ?to ?d2)
      (not (has-days ?to ?n1))
      (has-days ?to ?n2)
      (visited ?to)
    )
  )

  (:action traveler-hold-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (at-day ?c ?d) (workshop-day ?d) (is-prague ?c))
    :effect (workshop-held)
  )

  ;; Flights agent actions (kept distinct)
  (:action flights-start-in
    :parameters (?c - city ?d - day ?n0 - count ?n1 - count)
    :precondition (and (not-started) (first ?d) (has-days ?c ?n0) (count-next ?n0 ?n1))
    :effect (and
      (not (not-started))
      (not (has-days ?c ?n0))
      (has-days ?c ?n1)
      (at-day ?c ?d)
      (visited ?c)
    )
  )

  (:action flights-stay
    :parameters (?c - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and (at-day ?c ?d1) (next ?d1 ?d2) (has-days ?c ?n1) (count-next ?n1 ?n2))
    :effect (and
      (not (at-day ?c ?d1))
      (at-day ?c ?d2)
      (not (has-days ?c ?n1))
      (has-days ?c ?n2)
      (visited ?c)
    )
  )

  (:action flights-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and (at-day ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (has-days ?to ?n1) (count-next ?n1 ?n2))
    :effect (and
      (not (at-day ?from ?d1))
      (at-day ?to ?d2)
      (not (has-days ?to ?n1))
      (has-days ?to ?n2)
      (visited ?to)
    )
  )

  (:action flights-hold-workshop
    :parameters (?c - city ?d - day)
    :precondition (and (at-day ?c ?d) (workshop-day ?d) (is-prague ?c))
    :effect (workshop-held)
  )
)