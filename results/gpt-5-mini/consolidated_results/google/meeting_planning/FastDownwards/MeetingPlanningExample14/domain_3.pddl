(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?loc - location ?t - time)                     ; agent at a location at a specific timepoint
    (edge11 ?from - location ?to - location)           ; directed travel edge with 11-minute duration
    (edge12 ?from - location ?to - location)           ; directed travel edge with 12-minute duration
    (succ ?t1 - time ?t2 - time)                       ; immediate successor relation between timepoints
    (dur-wait ?t1 - time ?t2 - time)                   ; allowed wait interval (contiguous occupancy)
    (dur-move11 ?t1 - time ?t2 - time)                 ; allowed 11-minute move interval
    (dur-move12 ?t1 - time ?t2 - time)                 ; allowed 12-minute move interval
    (dur-meet ?t1 - time ?t2 - time)                   ; allowed meeting interval (120 minutes)
    (mary-at ?loc - location ?t1 - time ?t2 - time)    ; Mary present at a location for an interval
    (met-mary)                                         ; meeting with Mary completed
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

  ;; Move along the 11-minute directed edge (requires the specific edge11 predicate).
  (:action move-11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge11 ?from ?to)
      (dur-move11 ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Move along the 12-minute directed edge (requires the specific edge12 predicate).
  (:action move-12
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge12 ?from ?to)
      (dur-move12 ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Meet Mary at a location for the specified meeting interval; Mary must be present for that interval.
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