(define (domain meeting_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:constants nobhill marinadistrict - location)
  (:predicates
    (at ?l - location)
    (time-is ?t - time)
    (next ?t1 - time ?t2 - time)
    (move11 ?t1 - time ?t2 - time)
    (move12 ?t1 - time ?t2 - time)
    (meeting-span-mary ?t1 - time ?t2 - time)
    (met-mary)
  )
  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (time-is ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
    )
  )
  (:action travel-nobhill-to-marinadistrict
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (time-is ?t1)
      (at nobhill)
      (move11 ?t1 ?t2)
    )
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
      (not (at nobhill))
      (at marinadistrict)
    )
  )
  (:action travel-marinadistrict-to-nobhill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (time-is ?t1)
      (at marinadistrict)
      (move12 ?t1 ?t2)
    )
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
      (not (at marinadistrict))
      (at nobhill)
    )
  )
  (:action meet-mary
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (time-is ?t1)
      (at marinadistrict)
      (meeting-span-mary ?t1 ?t2)
    )
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
      (met-mary)
    )
  )
)