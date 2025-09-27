(define (domain meet-visitors-classical)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person)
    (accounted ?p - person)
    (time-at ?t - time)
    (travel_ns ?t1 - time ?t2 - time)
    (travel_sn ?t1 - time ?t2 - time)
    (wait_slot ?t1 - time ?t2 - time)
    (meeting_slot ?t1 - time ?t2 - time)
  )

  (:action visitor-travel-nobhill-to-sunset
    :parameters (?v - person ?t1 - time ?t2 - time)
    :precondition (and (at ?v nob_hill) (time-at ?t1) (travel_ns ?t1 ?t2))
    :effect (and (not (time-at ?t1)) (time-at ?t2) (not (at ?v nob_hill)) (at ?v sunset_district))
    :cost 0
  )

  (:action visitor-travel-sunset-to-nobhill
    :parameters (?v - person ?t1 - time ?t2 - time)
    :precondition (and (at ?v sunset_district) (time-at ?t1) (travel_sn ?t1 ?t2))
    :effect (and (not (time-at ?t1)) (time-at ?t2) (not (at ?v sunset_district)) (at ?v nob_hill))
    :cost 0
  )

  (:action visitor-wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (time-at ?t1) (wait_slot ?t1 ?t2))
    :effect (and (not (time-at ?t1)) (time-at ?t2))
    :cost 0
  )

  (:action visitor-meet-carol
    :parameters (?v - person ?c - person ?t1 - time ?t2 - time)
    :precondition (and
      (at ?v sunset_district)
      (at ?c sunset_district)
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
    :cost 0
  )

  (:action visitor-skip-carol
    :parameters (?c - person)
    :precondition (and (not (accounted ?c)))
    :effect (and (accounted ?c))
    :cost 1
  )
)