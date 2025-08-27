(define (domain travel)
  (:requirements :strips :typing)
  (:types location number)
  (:predicates 
    (at ?loc - location)
    (has-flight ?from ?to - location)
    (visited ?loc - location)
    (at-day ?day - number)
    (next-day-sequence ?current ?next - number)
    (days-in-location ?loc - location ?days - number))
  (:action fly
    :parameters (?from ?to - location)
    :precondition (and (at ?from) (has-flight ?from ?to))
    :effect (and (not (at ?from)) (at ?to) (visited ?to)))
  (:action next-day
    :parameters (?current - number ?next - number)
    :precondition (and (at-day ?current) (next-day-sequence ?current ?next))
    :effect (and (not (at-day ?current)) (at-day ?next)))
  (:action stay
    :parameters (?loc - location ?days - number)
    :precondition (and (at ?loc) (at-day 1)) 
    :effect (days-in-location ?loc ?days)))