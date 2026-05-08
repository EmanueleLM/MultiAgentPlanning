(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates
    (at ?loc - location)
    (time_reached ?time - time)
    (can_meet ?person - person ?loc - location)
    (goal_met)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?start - time ?end - time)
    :precondition (and (at ?from) (time_reached ?start) (or (and (at marina_district) (at embarcadero)) (and (at embarcadero) (at marina_district))))
    :effect (and (not (at ?from)) (at ?to) (time_reached ?end))
  )
  
  (:action meet
    :parameters (?person - person ?loc - location ?start - time ?end - time)
    :precondition (and (at ?loc) (can_meet ?person ?loc) (time_reached ?start) (time_reached ?end))
    :effect (goal_met)
  )
)