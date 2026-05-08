(define (domain san_francisco_day_trip)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types 
    location person time)
  
  (:predicates 
    (at ?person - person ?location - location ?time - time)
    (connected ?from - location ?to - location)
    (can_meet ?person - person ?location - location ?time_start - time ?time_end - time)
    (schedule ?person - person ?location - location ?time_start - time ?time_end - time)
    (visited ?location - location)
    (met ?person - person)
    )
  
  (:action travel
    :parameters (?person - person ?from - location ?to - location ?start - time ?end - time)
    :precondition (and (at ?person ?from ?start) (connected ?from ?to))
    :effect (and (at ?person ?to ?end) (visited ?to))
    )
  
  (:action meet
    :parameters (?person - person ?location - location ?meet_start - time ?meet_end - time)
    :precondition (and (at self ?location ?meet_start) 
                       (can_meet ?person ?location ?meet_start ?meet_end))
    :effect (and (met ?person) (schedule ?person ?location ?meet_start ?meet_end))
    )
)