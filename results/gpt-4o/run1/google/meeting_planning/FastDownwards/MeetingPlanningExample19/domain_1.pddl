(define (domain san_francisco_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time_window person)
  (:predicates 
    (at ?loc - location)
    (can_meet ?person - person ?window - time_window)
    (visited ?loc - location)
    (next ?window - time_window))

  (:action move
    :parameters (?from - location ?to - location ?window - time_window)
    :precondition (and (at ?from) (next ?window) (not (visited ?to)))
    :effect (and (not (at ?from)) (at ?to) (visited ?to)))

  (:action meet_friend
    :parameters (?person - person ?loc - location ?window - time_window)
    :precondition (and (at ?loc) (can_meet ?person ?window))
    :effect (not (can_meet ?person ?window)))
)