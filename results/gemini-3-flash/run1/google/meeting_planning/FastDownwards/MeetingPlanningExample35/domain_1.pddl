(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (at_time ?t - time)
    (met ?p - person)
    (next ?t1 ?t2 - time)
    (duration_18 ?t1 ?t2 - time)
    (duration_22 ?t1 ?t2 - time)
    (duration_90 ?t1 ?t2 - time)
    (available ?p - person ?t - time)
  )

  (:action move_bayview_to_chinatown
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at bayview) (at_time ?t1) (duration_18 ?t1 ?t2))
    :effect (and (not (at bayview)) (at chinatown) (not (at_time ?t1)) (at_time ?t2))
  )

  (:action move_chinatown_to_bayview
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at chinatown) (at_time ?t1) (duration_22 ?t1 ?t2))
    :effect (and (not (at chinatown)) (at bayview) (not (at_time ?t1)) (at_time ?t2))
  )

  (:action meet_jason
    :parameters (?t1 - time ?t2 - time)
    :precondition (and 
      (at chinatown) 
      (at_time ?t1) 
      (duration_90 ?t1 ?t2) 
      (available jason ?t1) 
      (available jason ?t2)
    )
    :effect (and 
      (met jason) 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at_time ?t1) (next ?t1 ?t2))
    :effect (and (not (at_time ?t1)) (at_time ?t2))
  )
)