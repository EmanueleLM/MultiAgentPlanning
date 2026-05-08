(define (domain sf_visit)
  (:requirements :strips :typing)
  (:types location time person count)
  (:constants
    marina mission - location
    stephanie - person
    v120 - count
  )
  (:predicates
    (at ?l - location)
    (time_now ?t - time)
    (meeting_progress ?p - person ?v - count)
    (next_t ?t1 ?t2 - time)
    (next_v ?v1 ?v2 - count)
    (travel_marina_mission ?t1 ?t2 - time)
    (travel_mission_marina ?t1 ?t2 - time)
    (available ?p - person ?t - time)
    (met_goal ?p - person)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?l) 
      (time_now ?t1) 
      (next_t ?t1 ?t2)
    )
    :effect (and 
      (not (time_now ?t1)) 
      (time_now ?t2)
    )
  )

  (:action move_marina_to_mission
    :parameters (?t1 - time ?t2 - time)
    :precondition (and 
      (at marina) 
      (time_now ?t1) 
      (travel_marina_mission ?t1 ?t2)
    )
    :effect (and 
      (not (at marina)) 
      (at mission) 
      (not (time_now ?t1)) 
      (time_now ?t2)
    )
  )

  (:action move_mission_to_marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and 
      (at mission) 
      (time_now ?t1) 
      (travel_mission_marina ?t1 ?t2)
    )
    :effect (and 
      (not (at mission)) 
      (at marina) 
      (not (time_now ?t1)) 
      (time_now ?t2)
    )
  )

  (:action meet_stephanie
    :parameters (?t1 - time ?t2 - time ?v1 - count ?v2 - count)
    :precondition (and 
      (at mission) 
      (time_now ?t1) 
      (next_t ?t1 ?t2) 
      (available stephanie ?t1) 
      (meeting_progress stephanie ?v1) 
      (next_v ?v1 ?v2)
    )
    :effect (and 
      (not (time_now ?t1)) 
      (time_now ?t2) 
      (not (meeting_progress stephanie ?v1)) 
      (meeting_progress stephanie ?v2)
    )
  )

  (:action complete_meeting_goal
    :parameters (?p - person)
    :precondition (meeting_progress ?p v120)
    :effect (met_goal ?p)
  )
)