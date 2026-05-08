(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (can-travel ?from - location ?to - location ?ts - time ?te - time)
    (consecutive ?t1 - time ?t2 - time)
    (loc-available ?l - location ?ts - time ?te - time)
    (beth-min ?ts - time ?te - time)
    (meeting-held ?l - location ?ts - time ?te - time)
  )

  ;; Travel: instantaneous encoding of a multi-step travel interval.
  ;; Requires the agent to be at the origin at the declared start time,
  ;; and a precomputed can-travel fact linking the start and end times.
  (:action travel
    :parameters (?p - person ?from - location ?to - location ?ts - time ?te - time)
    :precondition (and
      (at ?p ?from ?ts)
      (can-travel ?from ?to ?ts ?te)
    )
    :effect (and
      (not (at ?p ?from ?ts))
      (at ?p ?to ?te)
    )
  )

  ;; Stay: propagate presence from one time point to the immediate successor.
  ;; This enforces contiguous presence when required (e.g., to attend a meeting).
  (:action stay
    :parameters (?p - person ?loc - location ?ts - time ?te - time)
    :precondition (and
      (at ?p ?loc ?ts)
      (consecutive ?ts ?te)
    )
    :effect (and
      (at ?p ?loc ?te)
    )
  )

  ;; Hold a meeting of duration 2 time steps (occupying two consecutive time instants).
  ;; This action enforces:
  ;; - the location is available for the entire interval (?ts -> ?te),
  ;; - Betty's minimum-meeting-duration constraint for this interval (beth-min),
  ;; - both participants are present for both occupied timepoints (?ts and the middle ?tm).
  ;; Effects record that the meeting occurred and propagate presence to the declared end instant.
  (:action hold-meeting-2
    :parameters (?loc - location ?p1 - person ?p2 - person ?ts - time ?tm - time ?te - time)
    :precondition (and
      (loc-available ?loc ?ts ?te)
      (beth-min ?ts ?te)
      (consecutive ?ts ?tm)
      (consecutive ?tm ?te)
      (at ?p1 ?loc ?ts)
      (at ?p2 ?loc ?ts)
      (at ?p1 ?loc ?tm)
      (at ?p2 ?loc ?tm)
    )
    :effect (and
      (meeting-held ?loc ?ts ?te)
      (at ?p1 ?loc ?te)
      (at ?p2 ?loc ?te)
    )
  )
)