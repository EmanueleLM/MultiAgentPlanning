(define (domain san_francisco_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types 
    person location time_interval)

  (:predicates
    (at ?person - person ?location - location)
    (connected ?from - location ?to - location)
    (can_meet ?friend - person ?location - location ?interval - time_interval)
    (time_for_meeting ?interval - time_interval)
    (visited ?location - location)
    (met ?person - person))

  (:action travel
    :parameters (?person - person ?from - location ?to - location)
    :precondition (and (at ?person ?from) (connected ?from ?to))
    :effect (and (not (at ?person ?from)) (at ?person ?to) (visited ?to))
    )

  (:action meet_friend
    :parameters (?friend - person ?location - location ?interval - time_interval)
    :precondition (and (at self ?location)
                       (can_meet ?friend ?location ?interval)
                       (time_for_meeting ?interval))
    :effect (and (met ?friend))
    )
)