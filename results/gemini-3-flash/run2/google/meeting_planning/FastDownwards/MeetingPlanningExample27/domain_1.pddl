(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next ?t1 ?t2 - time)
    (met ?p - person)
    (person_present ?p - person ?l - location ?t - time)
    (travel_duration ?l1 ?l2 - location ?t1 ?t2 - time)
    (meet_duration ?p - person ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l1) (current_time ?t1) (travel_duration ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?l1)) (at ?l2) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait_time
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet_person
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (person_present ?p ?l ?t1) (current_time ?t1) (meet_duration ?p ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (met ?p))
  )
)