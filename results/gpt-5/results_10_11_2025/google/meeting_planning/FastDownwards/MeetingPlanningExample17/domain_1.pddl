(define (domain meet-matthew-exact)
  (:requirements :strips :typing :negative-preconditions)
  (:types traveler location person time)

  (:predicates
    ; State
    (at ?a - traveler ?l - location)
    (time ?t - time)

    ; Allowed temporal jumps (pre-declared waits between specific timepoints)
    (advance ?t1 - time ?t2 - time)

    ; Directed travel leg mapping a specific departure time to its arrival time
    (leg ?from - location ?to - location ?td - time ?ta - time)

    ; Meeting feasibility: a valid continuous meeting span (at least 15 minutes)
    (meeting-span ?ts - time ?te - time)

    ; Achievement
    (meeting-location ?p - person ?l - location)
    (met ?p - person)
  )

  ; Action: wait from one declared timepoint to another (encodes idle/buffer time).
  ; This models discrete time progression via the advance relation.
  (:action wait
    :parameters (?a - traveler ?t1 - time ?t2 - time)
    :precondition (and
      (time ?t1)
      (advance ?t1 ?t2)
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
    )
  )

  ; Action: travel along a declared directed leg with exact departure/arrival timepoints.
  ; This enforces the provided directed travel duration implicitly via the leg pair.
  (:action travel
    :parameters (?a - traveler ?from - location ?to - location ?td - time ?ta - time)
    :precondition (and
      (at ?a ?from)
      (time ?td)
      (leg ?from ?to ?td ?ta)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (time ?td))
      (time ?ta)
    )
  )

  ; Action: meet a person for a full declared meeting-span, which is guaranteed to lie
  ; within their availability window and satisfy the minimum duration (>= 15 minutes).
  (:action meet
    :parameters (?a - traveler ?p - person ?l - location ?ts - time ?te - time)
    :precondition (and
      (at ?a ?l)
      (meeting-location ?p ?l)
      (time ?ts)
      (meeting-span ?ts ?te)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (time ?ts))
      (time ?te)
    )
  )
)