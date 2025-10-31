(define (domain multiagent-travel)
  (:requirements :strips :typing :fluents)
  (:types city day)
  (:predicates
    (at ?c - city)
    (day-now ?d - day)
    (day-next ?d1 ?d2 - day)
    (visited ?c - city ?d - day)
    (connected ?c1 ?c2 - city)
  )
  (:functions
    (visited-count ?c - city)
    (total-days)
  )

  (:action stay
    :parameters (?c - city ?d - day ?e - day)
    :precondition (and (at ?c) (day-now ?d) (day-next ?d ?e))
    :effect (and
              (not (day-now ?d))
              (day-now ?e)
              (visited ?c ?d)
              (increase (visited-count ?c) 1)
              (increase (total-days) 1)
            )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?e - day)
    :precondition (and (at ?from) (connected ?from ?to) (day-now ?d) (day-next ?d ?e))
    :effect (and
              (not (at ?from))
              (at ?to)
              (not (day-now ?d))
              (day-now ?e)
              (visited ?to ?d)
              (increase (visited-count ?to) 1)
              (increase (total-days) 1)
            )
  )
)