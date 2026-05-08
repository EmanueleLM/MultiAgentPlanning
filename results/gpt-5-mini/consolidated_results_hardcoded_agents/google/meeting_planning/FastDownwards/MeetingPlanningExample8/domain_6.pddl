(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (at-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (next12 ?t1 - time ?t2 - time)
    (next16 ?t1 - time ?t2 - time)
    (edge12 ?from - location ?to - location)
    (edge16 ?from - location ?to - location)
    (steph-available ?t - time)
    (steph-location ?l - location)
    (met-steph ?t - time)
  )

  ;; Move along a directed edge that takes 12 minutes
  (:action move-12
    :parameters (?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (at ?from)
      (at-time ?t)
      (next12 ?t ?t2)
      (edge12 ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Move along a directed edge that takes 16 minutes
  (:action move-16
    :parameters (?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (at ?from)
      (at-time ?t)
      (next16 ?t ?t2)
      (edge16 ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Wait in-place for one minute (advance time by one contiguous minute)
  (:action wait-one-minute
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and
      (at ?loc)
      (at-time ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Meet Stephanie for one minute. Must be at Stephanie's location and during her availability.
  ;; Repeated application yields contiguous meeting minutes.
  (:action meet-one-minute
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and
      (at ?loc)
      (at-time ?t)
      (next ?t ?t2)
      (steph-available ?t)
      (steph-location ?loc)
    )
    :effect (and
      (met-steph ?t)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )
)