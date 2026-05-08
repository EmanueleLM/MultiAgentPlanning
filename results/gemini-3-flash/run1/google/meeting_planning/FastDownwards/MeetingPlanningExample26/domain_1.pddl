(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time step)

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (next_time ?t1 ?t2 - time)
    (sarah_at ?l - location ?t - time)
    (meeting_progress ?s - step)
    (next_step ?s1 ?s2 - step)
    (travel_possible ?l1 ?l2 - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and 
      (at ?from) 
      (time_at ?t1) 
      (travel_possible ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and 
      (at ?l) 
      (time_at ?t1) 
      (next_time ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?l - location ?t1 ?t2 - time ?s1 ?s2 - step)
    :precondition (and 
      (at ?l) 
      (time_at ?t1) 
      (next_time ?t1 ?t2)
      (sarah_at ?l ?t1)
      (sarah_at ?l ?t2)
      (meeting_progress ?s1)
      (next_step ?s1 ?s2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2)
      (not (meeting_progress ?s1)) 
      (meeting_progress ?s2)
    )
  )
)