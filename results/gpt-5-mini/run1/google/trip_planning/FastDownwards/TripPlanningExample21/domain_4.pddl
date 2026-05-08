(define (domain travel-domain)
  (:requirements :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (succ ?d ?d2 - day)
    (flight ?from ?to - city)
    (at ?p - person ?c - city ?d - day)
    (has_loc ?p - person ?d - day)
    (allowed_workshop_day ?d - day)
    (workshop_done ?p - person)
    (workshop_city ?c - city)
    (visited ?p - person ?c - city)
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?p ?from ?d)
                    (succ ?d ?d2)
                    (flight ?from ?to)
                    (not (has_loc ?p ?d2))
                  )
    :effect (and
              (at ?p ?to ?d2)
              (has_loc ?p ?d2)
              (visited ?p ?to)
            )
  )

  (:action stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and
                    (at ?p ?c ?d)
                    (succ ?d ?d2)
                    (not (has_loc ?p ?d2))
                  )
    :effect (and
              (at ?p ?c ?d2)
              (has_loc ?p ?d2)
              (visited ?p ?c)
            )
  )

  (:action attend_workshop
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and
                    (at ?p ?c ?d)
                    (workshop_city ?c)
                    (allowed_workshop_day ?d)
                    (not (workshop_done ?p))
                  )
    :effect (and
              (workshop_done ?p)
            )
  )
)