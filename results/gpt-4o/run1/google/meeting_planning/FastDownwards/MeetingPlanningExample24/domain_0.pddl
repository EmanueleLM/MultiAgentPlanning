(define (domain san_francisco_day_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates 
    (at ?loc - location)
    (met ?person - person)
    (available ?person - person ?start - time ?end - time)
    (current_time ?time - time)
    (can_travel ?from - location ?to - location ?start - time ?end - time)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?start - time ?end - time)
    :precondition (and (at ?from) (can_travel ?from ?to ?start ?end) (current_time ?start))
    :effect (and (not (at ?from)) (at ?to) (not (current_time ?start)) (current_time ?end))
  )
  
  (:action meet_matthew
    :parameters (?location - location ?person - person ?start - time ?end - time)
    :precondition (and 
      (at ?location) 
      (available ?person ?start ?end) 
      (current_time ?start) 
      (can_travel ?location ?location ?start ?end) ; This ensures meeting is within the time window
      )
    :effect (and 
      (met ?person) 
      (not (current_time ?start)) 
      (current_time ?end))
  )
)