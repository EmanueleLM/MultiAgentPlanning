(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person friend location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (friend_at ?f - friend ?l - location ?t - time)
    (met ?f - friend)
    (dist ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (wait_at ?l - location ?t1 - time ?t2 - time)
    (meeting_duration ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from ?t1) (dist ?from ?to ?t1 ?t2))
    :effect (and (not (at ?p ?from ?t1)) (at ?p ?to ?t2))
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?l ?t1) (wait_at ?l ?t1 ?t2))
    :effect (and (not (at ?p ?l ?t1)) (at ?p ?l ?t2))
  )

  (:action meet
    :parameters (?p - person ?f - friend ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l ?t1) 
      (friend_at ?f ?l ?t1) 
      (friend_at ?f ?l ?t2) 
      (meeting_duration ?t1 ?t2)
    )
    :effect (and 
      (not (at ?p ?l ?t1)) 
      (at ?p ?l ?t2) 
      (met ?f)
    )
  )
)