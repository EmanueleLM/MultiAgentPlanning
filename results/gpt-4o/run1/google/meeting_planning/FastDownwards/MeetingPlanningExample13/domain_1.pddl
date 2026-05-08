(define (domain san_francisco_meetup)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time_point)
  (:predicates 
    (at ?p - person ?l - location)
    (time_reached ?t - time_point)
    (betty_available)
    (met_betty)
    (travel_possible ?from - location ?to - location)
  )
  
  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and (at yourself ?from) (travel_possible ?from ?to))
    :effect (and (not (at yourself ?from)) (at yourself ?to))
  )
  
  (:action wait_until
    :parameters (?t - time_point)
    :precondition (time_reached 9_00am)
    :effect (time_reached ?t)
  )
  
  (:action meet_betty
    :parameters ()
    :precondition (and 
      (at yourself north_beach) 
      (betty_available) 
      (time_reached 6_45pm) 
      (not (time_reached 10_00pm))
    )
    :effect (met_betty)
  )
)