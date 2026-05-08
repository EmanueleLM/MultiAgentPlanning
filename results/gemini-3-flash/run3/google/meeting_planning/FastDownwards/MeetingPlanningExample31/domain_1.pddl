(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types
    location
    timepoint
    friend
  )
  (:predicates
    (at ?l - location)
    (time_at ?t - timepoint)
    (met ?f - friend)
    (travel_possible ?l1 - location ?l2 - location ?t1 - timepoint ?t2 - timepoint)
    (meeting_possible ?f - friend ?l - location ?t1 - timepoint ?t2 - timepoint)
  )
  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (time_at ?t1)
      (travel_possible ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )
  (:action meet
    :parameters (?f - friend ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (time_at ?t1)
      (meeting_possible ?f ?l ?t1 ?t2)
    )
    :effect (and
      (not (time_at ?t1))
      (time_at ?t2)
      (met ?f)
    )
  )