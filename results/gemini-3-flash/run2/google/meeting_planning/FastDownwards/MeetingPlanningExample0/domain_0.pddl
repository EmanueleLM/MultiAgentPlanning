(define (domain sf_visit)
  (:requirements :strips :typing)
  (:types location time person count)
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

  ;; Advance time by 1 minute while staying at the same location
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

  ;; Move from Marina to Mission (20 minutes)
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

  ;; Move from Mission to Marina (19 minutes)
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

  ;; Meet Stephanie for 1 minute at the Mission
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

  ;; Complete the goal for meeting Stephanie for the minimum duration
  (:action complete_meeting_goal
    :parameters (?p - person)
    :precondition (meeting_progress ?p v120)
    :effect (met_goal ?p)
  )
)