(define (domain meeting_planning)
  (:requirements :typing)
  (:types location time)
  (:predicates
    (at ?l - location)
    (time-at ?t - time)
    (next ?t1 ?t2 - time)
    (duration-15min ?t1 ?t2 - time)
    (duration-75min ?t1 ?t2 - time)
    (connected ?l1 ?l2 - location)
    (is-nancy-at ?l - location ?t1 ?t2 - time)
    (met-nancy)
  )

  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - time)
    :precondition (and (at ?l1) (connected ?l1 ?l2) (time-at ?t1) (next ?t1 ?t2) (duration-15min ?t1 ?t2))
    :effect (and (not (at ?l1)) (at ?l2) (not (time-at ?t1)) (time-at ?t2))
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time-at ?t1) (next ?t1 ?t2))
    :effect (and (not (time-at ?t1)) (time-at ?t2))
  )

  (:action meet-nancy
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time-at ?t1) (next ?t1 ?t2) (duration-75min ?t1 ?t2) (is-nancy-at ?l ?t1 ?t2))
    :effect (and (met-nancy) (not (time-at ?t1)) (time-at ?t2))
  )
)