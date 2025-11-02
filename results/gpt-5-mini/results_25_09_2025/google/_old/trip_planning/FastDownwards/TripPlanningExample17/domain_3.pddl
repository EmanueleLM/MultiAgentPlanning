(define (domain integrated-trip-domain)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)
  (:types city day num)

  (:predicates
    (direct ?from - city ?to - city)
    (at ?city - city ?day - day)
    (today ?d - day)
    (next ?d - day ?d2 - day)
    (counted ?d - day)
    (spent ?city - city ?n - num)
    (nextnum ?n - num ?n2 - num)
    (conference ?city - city ?d - day)
    (attended ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (direct ?from ?to) (today ?d) (at ?from ?d) (next ?d ?d2))
    :effect (and
              (not (today ?d)) (today ?d2)
              (not (at ?from ?d)) (at ?to ?d2)
            )
  )

  (:action stay
    :parameters (?city - city ?d - day ?d2 - day)
    :precondition (and (today ?d) (at ?city ?d) (next ?d ?d2))
    :effect (and
              (not (today ?d)) (today ?d2)
              (not (at ?city ?d)) (at ?city ?d2)
            )
  )

  (:action mark-spent
    :parameters (?city - city ?d - day ?n - num ?n2 - num)
    :precondition (and (today ?d) (at ?city ?d) (not (counted ?d)) (spent ?city ?n) (nextnum ?n ?n2))
    :effect (and (not (spent ?city ?n)) (spent ?city ?n2) (counted ?d))
  )

  (:action attend-conference
    :parameters (?city - city ?d - day)
    :precondition (and (today ?d) (at ?city ?d) (conference ?city ?d))
    :effect (attended ?d)
  )
)