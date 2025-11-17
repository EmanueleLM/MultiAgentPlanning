(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?loc - location ?t - time)                     ; agent at location at a specific timepoint
    (edge ?from - location ?to - location)             ; directed travel connectivity
    (succ ?t1 - time ?t2 - time)                       ; immediate successor in the discretized timeline
    (dur-wait ?t1 - time ?t2 - time)                   ; permitted wait interval
    (dur-move11 ?t1 - time ?t2 - time)                 ; permitted 11-minute move interval (Nob Hill -> Marina)
    (dur-move12 ?t1 - time ?t2 - time)                 ; permitted 12-minute move interval (Marina -> Nob Hill)
    (dur-meet ?t1 - time ?t2 - time)                   ; permitted 120-minute meeting interval
    (mary-at ?loc - location ?t1 - time ?t2 - time)    ; Mary is at a specific location for an interval
    (met-mary)                                         ; meeting-with-Mary completed
  )

  ;; Wait at the same location from t1 to t2 (must be an allowed wait interval and contiguous).
  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (dur-wait ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  ;; Move using the 11-minute Nob Hill -> Marina interval.
  (:action move-11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge ?from ?to)
      (dur-move11 ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Move using the 12-minute Marina -> Nob Hill interval.
  (:action move-12
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge ?from ?to)
      (dur-move12 ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Meet Mary at a location for the exact meeting interval; Mary must be present at that location for the same interval.
  (:action meet-mary
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (dur-meet ?t1 ?t2)
      (succ ?t1 ?t2)
      (mary-at ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
      (met-mary)
    )
  )
)