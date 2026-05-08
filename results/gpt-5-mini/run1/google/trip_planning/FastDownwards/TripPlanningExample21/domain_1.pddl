(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (succ ?d ?d2 - day)                         ; day successor relation
    (flight ?from ?to - city)                  ; direct flight connectivity
    (at ?p - person ?c - city ?d - day)        ; person is in city on a specific day
    (has-loc ?p - person ?d - day)             ; person has an assigned city for that day
    (allowed-workshop-day ?d - day)            ; day is within allowed workshop window
    (workshop-done ?p - person)                ; workshop attended (once)
    (visited ?p - person ?c - city)            ; person has visited city at least once
  )

  ;; Fly from one city on day D to another city on successor day D2.
  ;; Only allowed when a direct flight exists between the two cities.
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

  ;; Stay in the same city from day D to its successor D2.
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

  ;; Attend the workshop in Venice on an allowed day. Can be done only once.
  ;; This action fixes the workshop city to the Venice constant (object declared in the problem).
  (:action attend-workshop
    :parameters (?p - person ?d - day)
    :precondition (and
                    (at ?p venice ?d)
                    (allowed-workshop-day ?d)
                    (not (workshop-done ?p))
                  )
    :effect (and
              (workshop-done ?p)
            )
  )
)