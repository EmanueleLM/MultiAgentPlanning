(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types 
    location 
    person 
    timepoint
  )
  (:predicates
    (at ?l - location)
    (at_time ?t - timepoint)
    (person_at ?p - person ?l - location)
    (can_travel ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (can_meet ?p - person ?t1 - timepoint ?t2 - timepoint)
    (met ?p - person)
  )

  ;; Travel action: moves the user between locations and advances time.
  ;; The travel must be specifically permitted by a can_travel fact in init.
  (:action travel
    :parameters (?from - location ?to - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and 
      (at ?from) 
      (at_time ?t_start) 
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )

  ;; Meeting action: user meets a person at a shared location, which advances time.
  ;; The meeting must be specifically permitted by a can_meet fact in init.
  (:action meet
    :parameters (?p - person ?l - location ?t_start - timepoint ?t_end - timepoint)
    :precondition (and 
      (at ?l) 
      (at_time ?t_start) 
      (person_at ?p ?l) 
      (can_meet ?p ?t_start ?t_end)
    )
    :effect (and 
      (not (at_time ?t_start)) 
      (at_time ?t_end) 
      (met ?p)
    )
  )
)