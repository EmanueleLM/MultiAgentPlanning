(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)                      ; person ?p is at location ?l at time ?t
    (next ?tfrom - time ?tto - time)                             ; immediate successor timepoints
    (travel_link ?from - location ?to - location ?tfrom - time ?tto - time) ; allowed travel leg from a timepoint to another
    (met-with-mary)                                               ; goal predicate: traveler met Mary for required span
  )

  ;; Wait: advance a person from one timepoint to its immediate successor while staying at the same location.
  (:action wait
    :parameters (?p - person ?loc - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?p ?loc ?tfrom)
      (next ?tfrom ?tto)
    )
    :effect (and
      (not (at ?p ?loc ?tfrom))
      (at ?p ?loc ?tto)
    )
  )

  ;; Travel along an explicitly declared travel_link (prevents inventing routes or durations).
  (:action travel
    :parameters (?p - person ?from - location ?to - location ?tfrom - time ?tto - time)
    :precondition (and
      (at ?p ?from ?tfrom)
      (travel_link ?from ?to ?tfrom ?tto)
    )
    :effect (and
      (not (at ?p ?from ?tfrom))
      (at ?p ?to ?tto)
    )
  )

  ;; Meet Mary: requires both participants to be at the same location at both the meeting start and end times.
  ;; This enforces a contiguous presence spanning the two timepoints (used to represent the 120-minute span).
  (:action meet_mary
    :parameters (?tr - person ?m - person ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?tr ?loc ?tstart)
      (at ?m ?loc ?tstart)
      (at ?tr ?loc ?tend)
      (at ?m ?loc ?tend)
    )
    :effect (and
      (met-with-mary)
    )
  )
)