(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time friend)
  (:predicates
    (at ?l - location)
    (time_now ?t - time)
    (met ?f - friend)
    (travel_link ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (wait_link ?t1 - time ?t2 - time)
    (meet_link ?f - friend ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (time_now ?t1) (travel_link ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time_now ?t1)) (time_now ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (time_now ?t1) (wait_link ?t1 ?t2))
    :effect (and (not (time_now ?t1)) (time_now ?t2))
  )

  (:action meet
    :parameters (?f - friend ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (time_now ?t1) (meet_link ?f ?l ?t1 ?t2))
    :effect (and (met ?f) (not (time_now ?t1)) (time_now ?t2))
  )
)