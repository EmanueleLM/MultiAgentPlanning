(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_point friend)

  (:predicates
    (at_location ?l - location)
    (current_time ?t - time_point)
    (has_met ?f - friend)
    (travel_possible ?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    (wait_possible ?t1 - time_point ?t2 - time_point)
    (meeting_possible ?f - friend ?l - location ?t1 - time_point ?t2 - time_point)
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_location ?l1) 
      (current_time ?t1) 
      (travel_possible ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?l1)) 
      (at_location ?l2) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (current_time ?t1) 
      (wait_possible ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet_friend
    :parameters (?f - friend ?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_location ?l) 
      (current_time ?t1) 
      (meeting_possible ?f ?l ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2) 
      (has_met ?f)
    )
  )
)