(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    ;; At a given location at a given time stage
    (at ?loc - location ?t - time)

    ;; Directed travel edges with asymmetric durations encoded by separate action schemas
    (edge11 ?from - location ?to - location)  ;; Nob Hill -> Marina (11 minutes)
    (edge12 ?from - location ?to - location)  ;; Marina -> Nob Hill (12 minutes)

    ;; Ordered time stages (discrete ordered points/stages); succ enforces contiguity in the staged model
    (succ ?t1 - time ?t2 - time)

    ;; Interval predicates mark which pairs of time stages correspond to allowed/declared durations
    (interval-wait ?t1 - time ?t2 - time)
    (interval-move11 ?t1 - time ?t2 - time)
    (interval-move12 ?t1 - time ?t2 - time)
    (interval-meet ?t1 - time ?t2 - time)

    ;; Mary availability is a hard constraint: meeting must be within declared available interval at a location
    (mary-available ?loc - location ?t1 - time ?t2 - time)

    ;; Terminal predicate: meeting Mary for at least the required contiguous interval
    (met-mary)
  )

  ;; Wait advances from one declared stage to the next if that interval is explicitly allowed for waiting.
  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (succ ?t1 ?t2)
      (interval-wait ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  ;; Move along the 11-minute directed edge (e.g., Nob Hill -> Marina)
  (:action move-11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge11 ?from ?to)
      (succ ?t1 ?t2)
      (interval-move11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Move along the 12-minute directed edge (e.g., Marina -> Nob Hill)
  (:action move-12
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge12 ?from ?to)
      (succ ?t1 ?t2)
      (interval-move12 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Meet Mary for a contiguous declared meeting interval. This action is only applicable
  ;; when the interval is explicitly marked as a meeting interval and Mary is available
  ;; for the same location/time pair. Meeting sets the met-mary terminal predicate.
  (:action meet-mary
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (succ ?t1 ?t2)
      (interval-meet ?t1 ?t2)
      (mary-available ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
      (met-mary)
    )
  )
)