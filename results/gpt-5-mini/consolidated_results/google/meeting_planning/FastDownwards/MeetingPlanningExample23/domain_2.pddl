(define (domain meet-john-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time person)
  (:predicates
    (at ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (offset23 ?t1 - time ?t2 - time)
    (offset75 ?t1 - time ?t2 - time)
    (john-start ?t - time)
    (met-john)
    (known-location ?l - location)
    (travel-23 ?from - location ?to - location)
  )

  ;; Travel: move from ?from at time ?t1 to ?to at time ?t2 if travel takes 23 minutes
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (offset23 ?t1 ?t2)
      (travel-23 ?from ?to)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Wait one minute while staying at the same location (enforces contiguous occupancy)
  (:action wait-minute
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  ;; Meet John: start at a timepoint that is allowed (john-start) and occupy 75 contiguous minutes
  (:action meet-john
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at russian_hill ?t1)
      (john-start ?t1)
      (offset75 ?t1 ?t2)
      (not (met-john))
    )
    :effect (and
      (not (at russian_hill ?t1))
      (at russian_hill ?t2)
      (met-john)
    )
  )
)