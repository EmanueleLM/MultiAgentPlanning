(define (domain trip-planning)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)        ; currently at city c on day d (transient)
    (visited ?c - city ?d - day)   ; was in city c on day d (persists)
    (next ?d1 - day ?d2 - day)     ; d2 is the day after d1
    (flight ?from - city ?to - city) ; direct flight edge
  )

  ;; spend the next day in the same city (stay)
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (not (at ?c ?d1))
              (at ?c ?d2)
              (visited ?c ?d2)
            )
  )

  ;; fly using a direct flight from one city to another (consumes one day)
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (flight ?from ?to) (next ?d1 ?d2))
    :effect (and
              (not (at ?from ?d1))
              (at ?to ?d2)
              (visited ?to ?d2)
            )
  )
)