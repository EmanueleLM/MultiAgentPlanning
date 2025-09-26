(define (domain travel)
  (:requirements :strips :typing)
  (:types location day count)
  (:predicates 
    (at ?loc - location)
    (has-flight ?from ?to - location)
    (visited ?loc - location)
    (at-day ?d - day)
    (next-day-sequence ?current ?next - day)
    (days-in-location ?loc - location ?c - count))
  (:action fly
    :parameters (?from ?to - location)
    :precondition (and (at ?from) (has-flight ?from ?to))
    :effect (and (not (at ?from)) (at ?to) (visited ?to)))
  (:action next-day
    :parameters (?current ?next - day)
    :precondition (and (at-day ?current) (next-day-sequence ?current ?next))
    :effect (and (not (at-day ?current)) (at-day ?next)))
  (:action stay
    :parameters (?loc - location ?d - day ?c - count)
    :precondition (and (at ?loc) (at-day ?d))
    :effect (days-in-location ?loc ?c)))