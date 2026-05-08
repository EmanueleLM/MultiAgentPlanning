(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location timepoint person)
  (:predicates
    (at_loc ?l - location)
    (at_time ?t - timepoint)
    (met ?p - person)
    (travel_possible ?from ?to - location ?t_start ?t_end - timepoint)
    (meeting_possible ?p - person ?l - location ?t_start ?t_end - timepoint)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and 
      (at_loc ?from) 
      (at_time ?t_start) 
      (travel_possible ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at_loc ?from)) 
      (at_loc ?to) 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and 
      (at_loc ?l) 
      (at_time ?t_start) 
      (meeting_possible ?p ?l ?t_start ?t_end)
    )
    :effect (and 
      (met ?p) 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )
)