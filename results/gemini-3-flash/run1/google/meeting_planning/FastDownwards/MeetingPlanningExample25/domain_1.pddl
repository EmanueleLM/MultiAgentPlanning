(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location timepoint)
  (:predicates
    (at ?p - person ?l - location)
    (time_is ?t - timepoint)
    (met ?p - person)
    (connected ?l1 - location ?l2 - location ?t1 - timepoint ?t2 - timepoint)
    (waiting_possible ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
  )

  ;; Action to travel between two locations, taking the time specified by timepoints.
  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and 
      (at ?p ?from) 
      (time_is ?t_start) 
      (connected ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at ?p ?from)) 
      (at ?p ?to) 
      (not (time_is ?t_start)) 
      (time_is ?t_end)
    )
  )

  ;; Action to wait at a location until a specific time.
  (:action wait
    :parameters (?p - person ?l - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and 
      (at ?p ?l) 
      (time_is ?t_start) 
      (waiting_possible ?t_start ?t_end)
    )
    :effect (and 
      (not (time_is ?t_start)) 
      (time_is ?t_end)
    )
  )

  ;; Action to meet a friend at a location for a specific duration (t_start to t_end).
  (:action meet
    :parameters (?me - person ?friend - person ?loc - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and 
      (at ?me ?loc) 
      (time_is ?t_start) 
      (available ?friend ?loc ?t_start ?t_end)
    )
    :effect (and 
      (met ?friend) 
      (not (time_is ?t_start)) 
      (time_is ?t_end)
    )
  )
)