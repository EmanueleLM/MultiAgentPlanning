(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (current_at ?l - location)
    (current_time ?t - time)
    (next ?t1 ?t2 - time)
    (travel_duration ?from ?to - location ?t1 ?t2 - time)
    (meeting_duration ?t1 ?t2 - time)
    (person_at ?p - person ?l - location ?t - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and (current_at ?from) (current_time ?t1) (travel_duration ?from ?to ?t1 ?t2))
    :effect (and (not (current_at ?from)) (current_at ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start ?t_end - time)
    :precondition (and (current_at ?l) 
                       (current_time ?t_start) 
                       (meeting_duration ?t_start ?t_end)
                       (person_at ?p ?l ?t_start)
                       (person_at ?p ?l ?t_end))
    :effect (and (not (current_time ?t_start)) (current_time ?t_end) (met ?p))
  )
)