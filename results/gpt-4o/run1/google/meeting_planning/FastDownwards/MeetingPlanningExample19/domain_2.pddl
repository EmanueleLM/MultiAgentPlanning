(define (domain san_francisco_schedule)
  (:requirements :strips :typing)
  (:types location time_window person)
  (:predicates 
    (at ?loc - location)
    (can_meet ?person - person ?window - time_window)
    (visited ?loc - location)
    (current_window ?window - time_window)
    (available_time ?time_start - time_window ?time_end - time_window)
  )

  (:action move
    :parameters (?from - location ?to - location ?current - time_window ?next - time_window)
    :precondition (and (at ?from) (current_window ?current) (not (visited ?to)) (available_time ?current ?next))
    :effect (and (not (at ?from)) (at ?to) (visited ?to) (not (current_window ?current)) (current_window ?next))
  )

  (:action meet_friend
    :parameters (?person - person ?loc - location ?current - time_window)
    :precondition (and (at ?loc) (can_meet ?person ?current))
    :effect (not (can_meet ?person ?current))
  )
)