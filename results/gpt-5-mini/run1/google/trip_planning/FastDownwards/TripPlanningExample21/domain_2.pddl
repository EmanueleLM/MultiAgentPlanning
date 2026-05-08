(define (domain travel-domain)
  (:requirements :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (succ ?d ?d2 - day)
    (flight ?from ?to - city)
    (at ?p - person ?c - city ?d - day)
    (has-loc ?p - person ?d - day)
    (allowed-workshop-day ?d - day)
    (workshop-done ?p - person)
    (visited ?p - person ?c - city)
    (workshop-city ?c - city)
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?p ?from ?d)
                    (succ ?d ?d2)
                    (flight ?from ?to)
                    (not (has-loc ?p ?d2))
                  )
    :effect (and
              (at ?p ?to ?d2)
              (has-loc ?p ?d2)
              (visited ?p ?to)
            )
  )

  (:action stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?p ?c ?d)
                    (succ ?d ?d2)
                    (not (has-loc ?p ?d2))
                  )
    :effect (and
              (at ?p ?c ?d2)
              (has-loc ?p ?d2)
              (visited ?p ?c)
            )
  )

  (:action attend-workshop
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and
                    (at ?p ?c ?d)
                    (workshop-city ?c)
                    (allowed-workshop-day ?d)
                    (not (workshop-done ?p))
                  )
    :effect (and
              (workshop-done ?p)
            )
  )
)