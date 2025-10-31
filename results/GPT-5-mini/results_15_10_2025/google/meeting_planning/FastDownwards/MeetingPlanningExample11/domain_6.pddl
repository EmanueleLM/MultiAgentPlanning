(define (domain meet-visitors-classical)
  (:requirements :typing :negative-preconditions :fluents :action-costs)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person)
    (accounted ?p - person)
    (time-at ?t - time)
    (wait_slot ?t1 - time ?t2 - time)
    (meeting_slot ?t1 - time ?t2 - time)
    (travel ?from - location ?to - location ?t1 - time ?t2 - time)
  )
  (:functions (total-cost))

  (:action visitor-travel
    :parameters (?v - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?v ?from) (time-at ?t1) (travel ?from ?to ?t1 ?t2))
    :effect (and (not (time-at ?t1)) (time-at ?t2) (not (at ?v ?from)) (at ?v ?to))
  )

  (:action visitor-wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (time-at ?t1) (wait_slot ?t1 ?t2))
    :effect (and (not (time-at ?t1)) (time-at ?t2))
  )

  (:action visitor-meet-carol
    :parameters (?v - person ?c - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?v ?loc)
      (at ?c ?loc)
      (time-at ?t1)
      (meeting_slot ?t1 ?t2)
      (not (met ?c))
      (not (accounted ?c))
    )
    :effect (and
      (met ?c)
      (accounted ?c)
      (not (time-at ?t1))
      (time-at ?t2)
    )
  )

  (:action visitor-skip-carol
    :parameters (?c - person)
    :precondition (and (not (accounted ?c)))
    :effect (and (accounted ?c) (increase (total-cost) 1))
  )
)