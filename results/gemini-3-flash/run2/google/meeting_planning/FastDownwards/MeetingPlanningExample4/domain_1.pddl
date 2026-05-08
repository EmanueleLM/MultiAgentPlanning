(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time progress person)
  (:predicates
    (at_loc ?l - location)
    (curr_time ?t - time)
    (person_at ?p - person ?l - location ?t - time)
    (meeting_status ?p - person ?pr - progress)
    (next_time ?t1 ?t2 - time)
    (next_progress ?pr1 ?pr2 - progress)
  )

  ;; Travel between locations takes one time interval (15 minutes),
  ;; which comfortably covers the 10-minute travel requirement.
  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?from) (curr_time ?t1) (next_time ?t1 ?t2))
    :effect (and (at_loc ?to) (not (at_loc ?from)) (curr_time ?t2) (not (curr_time ?t1)))
  )

  ;; Wait at a location for one time interval.
  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_loc ?l) (curr_time ?t1) (next_time ?t1 ?t2))
    :effect (and (curr_time ?t2) (not (curr_time ?t1)))
  )

  ;; Meet a person at a location for one time interval (15 minutes).
  ;; The meeting can only occur if both the agent and the person are at the same location.
  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?pr1 - progress ?pr2 - progress)
    :precondition (and 
      (at_loc ?l) 
      (person_at ?p ?l ?t1) 
      (curr_time ?t1) 
      (next_time ?t1 ?t2) 
      (meeting_status ?p ?pr1) 
      (next_progress ?pr1 ?pr2)
    )
    :effect (and 
      (meeting_status ?p ?pr2) 
      (not (meeting_status ?p ?pr1)) 
      (curr_time ?t2) 
      (not (curr_time ?t1))
    )
  )
)