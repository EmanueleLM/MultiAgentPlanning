(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at ?l - location)
    (time_is ?t - time)
    (person_at ?p - person ?l - location)
    (met ?p - person)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  ;; Generic travel action that uses discrete symbolic time points 
  ;; and transition rules defined in the problem instance.
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (time_is ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (time_is ?t1)) (time_is ?t2))
  )

  ;; Action to meet a friend at a location, taking time from t1 to t2.
  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (person_at ?p ?l) (time_is ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (time_is ?t1)) (time_is ?t2))
  )
)