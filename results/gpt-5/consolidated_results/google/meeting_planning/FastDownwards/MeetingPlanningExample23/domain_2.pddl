(define (domain meetingplanningexample23-classical)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location timepoint person)
  (:predicates
    (at ?l - location)
    (time_at ?t - timepoint)
    (met_john)
    (known_location ?l - location)
    (john_at ?l - location)
    (allow_wait ?l - location ?from - timepoint ?to - timepoint)
    (allow_travel ?from - location ?to - location ?tdepart - timepoint ?tarrive - timepoint)
    (allow_meet ?l - location ?tstart - timepoint ?tend - timepoint)
  )
  (:functions (total-cost))

  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (time_at ?t1)
      (allow_wait ?l ?t1 ?t2)
    )
    :effect (and
      (not (time_at ?t1))
      (time_at ?t2)
      (increase (total-cost) 487)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (known_location ?to)
      (time_at ?t1)
      (allow_travel ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time_at ?t1))
      (time_at ?t2)
      (increase (total-cost) 23)
    )
  )

  (:action meet-john
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (john_at ?l)
      (time_at ?t1)
      (allow_meet ?l ?t1 ?t2)
      (not (met_john))
    )
    :effect (and
      (met_john)
      (not (time_at ?t1))
      (time_at ?t2)
      (increase (total-cost) 75)
    )
  )
)