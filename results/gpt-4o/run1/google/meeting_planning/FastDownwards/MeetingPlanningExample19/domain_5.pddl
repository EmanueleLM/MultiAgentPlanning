(define (domain san_francisco_schedule)
  (:requirements :strips :typing)
  (:types location time_interval person)
  
  (:predicates 
    (at ?loc - location)
    (can_meet ?person - person ?interval - time_interval)
    (visited ?loc - location)
    (next_interval ?current - time_interval ?next - time_interval)
    (available_during ?person - person ?loc - location ?interval - time_interval)
  )

  (:action move
    :parameters (?from - location ?to - location ?current - time_interval ?next - time_interval)
    :precondition (and (at ?from) (next_interval ?current ?next))
    :effect (and (not (at ?from)) (at ?to) (visited ?to))
  )

  (:action meet
    :parameters (?person - person ?loc - location ?current - time_interval)
    :precondition (and (at ?loc) (can_meet ?person ?current) (available_during ?person ?loc ?current))
    :effect (not (can_meet ?person ?current))
  )
)