(define (domain meet-john-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (offset23 ?t1 - time ?t2 - time)
    (offset75 ?t1 - time ?t2 - time)
    (john-start ?t - time)
    (is-russian-hill ?l - location)
    (met-john)
    (travel-23 ?from - location ?to - location)
  )

  ;; Travel action: move from ?from at ?t1 to ?to at ?t2 if a 23-minute offset is available
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (travel-23 ?from ?to)
      (offset23 ?t1 ?t2)
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

  ;; Meet John for a contiguous 75 minutes while at Russian Hill and starting within John's window.
  (:action meet-john
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (is-russian-hill ?loc)
      (john-start ?t1)
      (offset75 ?t1 ?t2)
      (not (met-john))
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
      (met-john)
    )
  )
)