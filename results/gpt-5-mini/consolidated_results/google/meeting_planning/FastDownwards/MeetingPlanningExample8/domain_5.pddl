(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (at-time ?t - time)
    (time-step ?t - time)
    (next ?t1 - time ?t2 - time)
    (next12 ?t1 - time ?t2 - time)
    (next16 ?t1 - time ?t2 - time)
    (steph-available ?t - time)
    (met-steph ?t - time)
  )

  ;; Move from Chinatown to Marina District takes 12 minutes (compiled as next12)
  (:action move-chinatown-to-marina
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at chinatown)
      (at-time ?t)
      (next12 ?t ?t2)
    )
    :effect (and
      (not (at chinatown))
      (at marinadistrict)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Move from Marina District to Chinatown takes 16 minutes (compiled as next16)
  (:action move-marina-to-chinatown
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at marinadistrict)
      (at-time ?t)
      (next16 ?t ?t2)
    )
    :effect (and
      (not (at marinadistrict))
      (at chinatown)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Wait in-place for 1 minute (advances time by one next link)
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

  ;; Meet Stephanie for exactly one minute step: can only be executed at MarinaDistrict,
  ;; requires Stephanie to be available at that minute, and advances time by one minute.
  ;; Repeated applications produce contiguous meeting minutes.
  (:action meet-one-minute
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at marinadistrict)
      (at-time ?t)
      (next ?t ?t2)
      (steph-available ?t)
    )
    :effect (and
      (met-steph ?t)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )
)