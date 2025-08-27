(define (domain travel)
  (:requirements :strips :typing)
  (:types location)

  (:predicates 
    (at ?loc - location)
    (has-flight ?from ?to - location)
    (visited ?loc - location)
    (at-day ?day - number))

  (:action fly
    :parameters (?from ?to - location ?day - number)
    :precondition (and (at ?from) (has-flight ?from ?to) (at-day ?day))
    :effect (and (not (at ?from)) (at ?to) (visited ?to)))

  (:action next-day
    :parameters (?current - number ?next - number)
    :precondition (and (at-day ?current))
    :effect (and (not (at-day ?current)) (at-day ?next)))
)