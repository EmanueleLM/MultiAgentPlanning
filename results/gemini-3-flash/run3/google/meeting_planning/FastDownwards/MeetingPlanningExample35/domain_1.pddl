(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time_point)
  (:predicates
    (at ?l - location)
    (time_at ?t - time_point)
    (met ?p - person)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time_point)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time_point)
  )

  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - time_point)
    :precondition (and
      (at ?l1)
      (time_at ?t1)
      (can_travel ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and
      (not (at ?l1))
      (at ?l2)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time_point)
    :precondition (and
      (at ?l)
      (time_at ?t1)
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and
      (not (time_at ?t1))
      (time_at ?t2)
      (met ?p)
    )
  )
)