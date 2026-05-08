(define (domain meeting_planning_domain)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time_is ?t - time)
    (next ?t1 ?t2 - time)
    (can_travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  ;; Wait action allows the agent to stay at a location while time progresses
  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and 
      (time_is ?t1) 
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (time_is ?t1)) 
      (time_is ?t2)
    )
  )

  ;; Travel action moves the agent between locations, taking a fixed amount of time
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?from) 
      (time_is ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time_is ?t1)) 
      (time_is ?t2)
    )
  )

  ;; Meet action satisfies the meeting goal if the person and agent are in the same place at the same time
  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?l) 
      (time_is ?t1) 
      (person_at ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (met ?p) 
      (not (time_is ?t1)) 
      (time_is ?t2)
    )
  )
)