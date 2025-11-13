(define (domain MeetingPlanningExample24)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location person timepoint)
  (:predicates
    (at ?who - person ?loc - location)
    (connected ?from - location ?to - location)
    (available ?p - person)
    (met ?p - person)
    (current ?t - timepoint)
  )
  (:functions (total-cost))

  (:action wait-0900-1043
    :parameters ()
    :precondition (current t0900)
    :effect (and
      (not (current t0900))
      (current t1043)
      (increase (total-cost) 103)
    )
  )

  (:action move-nobhill-presidio-1043-1100
    :parameters (?who - person)
    :precondition (and
      (current t1043)
      (at ?who nobhill)
      (connected nobhill presidio)
    )
    :effect (and
      (not (current t1043))
      (current t1100)
      (not (at ?who nobhill))
      (at ?who presidio)
      (available matthew)
      (increase (total-cost) 17)
    )
  )

  (:action meet-matthew-1100-1130
    :parameters (?who - person)
    :precondition (and
      (current t1100)
      (at ?who presidio)
      (available matthew)
    )
    :effect (and
      (not (current t1100))
      (current t1130)
      (met matthew)
      (increase (total-cost) 30)
    )
  )

  (:action move-presidio-nobhill-1130-1148
    :parameters (?who - person)
    :precondition (and
      (current t1130)
      (at ?who presidio)
      (connected presidio nobhill)
    )
    :effect (and
      (not (current t1130))
      (current t1148)
      (not (at ?who presidio))
      (at ?who nobhill)
      (increase (total-cost) 18)
    )
  )
)