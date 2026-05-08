(define (domain san_francisco_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time_window person)
  (:predicates 
    (at ?loc - location)
    (can_meet ?person - person ?window - time_window)
    (visited ?loc - location)
    (next_window ?current - time_window ?next - time_window)
    (available_during ?person - person ?loc - location ?window - time_window)
  )

  (:action move
    :parameters (?from - location ?to - location ?current - time_window ?next - time_window)
    :precondition (and (at ?from) (next_window ?current ?next))
    :effect (and (not (at ?from)) (at ?to) (visited ?to))
  )

  (:action meet
    :parameters (?person - person ?loc - location ?current - time_window)
    :precondition (and (at ?loc) (can_meet ?person ?current) (available_during ?person ?loc ?current))
    :effect (not (can_meet ?person ?current))
  )
)