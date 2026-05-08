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
  
  (:action travel_to_north_beach
    :parameters ()
    :precondition (and (at yourself presidio) (time_reached 9_00am) (travel_possible presidio north_beach))
    :effect (and (not (at yourself presidio)) (at yourself north_beach) (time_reached 9_18am))
  )
  
  (:action travel_back_to_presidio
    :parameters ()
    :precondition (and (at yourself north_beach) (time_reached 9_45pm) (travel_possible north_beach presidio))
    :effect (and (not (at yourself north_beach)) (at yourself presidio))
  )
  
  (:action wait_until_betty_available
    :parameters ()
    :precondition (and (at yourself north_beach) (time_reached 9_18am))
    :effect (and (time_reached 6_45pm) (betty_available))
  )
  
  (:action meet_betty
    :parameters ()
    :precondition (and 
      (at yourself north_beach) 
      (betty_available) 
      (time_reached 6_45pm) 
      (not (time_reached 10_00pm))
    )
    :effect (and (met_betty) (not (betty_available)))
  )
)