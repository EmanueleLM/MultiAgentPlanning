(define (domain meet-john-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (offset23 ?t1 - time ?t2 - time)
    (offset75 ?t1 - time ?t2 - time)
    (travel-23 ?from - location ?to - location)
    (john-start ?t - time)
    (met-john)
  )

  ;; Travel action: moves from ?from at time ?t1 to ?to at time ?t2 if the 23-minute offset applies.
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

  ;; Wait one minute at the same location (enables contiguous occupancy and explicit waiting).
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

  ;; Meet John for the required contiguous 75 minutes. Start time must be a john-start and the offset75 must hold.
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