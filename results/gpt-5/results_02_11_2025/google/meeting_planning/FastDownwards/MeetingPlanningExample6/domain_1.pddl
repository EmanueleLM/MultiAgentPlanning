(define (domain meeting_planning_example6_5min)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    time
    location
    mlevel
  )

  (:predicates
    ; temporal grid
    (now ?t - time)
    (next ?t1 - time ?t2 - time)

    ; position
    (at ?l - location)

    ; Kenneth availability control: a 5-min meeting step may start at ?t iff fully within 14:15–19:45
    (meet-start-allowed ?t - time)

    ; progress counter for meeting duration: 18 quanta = 90 minutes
    (meeting-level ?m - mlevel)
    (next-level ?m1 - mlevel ?m2 - mlevel)
  )

  ; Wait for one 5-minute tick
  (:action wait-5
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
    )
  )

  ; Travel Fisherman's Wharf -> Nob Hill
  ; Note: Real travel = 11 minutes. We conservatively round up to the nearest 5-min multiple = 15 minutes,
  ; implemented as three successive 5-minute ticks to preserve feasibility on the discrete grid.
  (:action travel-fw-to-nh
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time)
    :precondition (and
      (at fishermans_wharf)
      (now ?t0)
      (next ?t0 ?t1)
      (next ?t1 ?t2)
      (next ?t2 ?t3)
    )
    :effect (and
      (not (at fishermans_wharf))
      (at nob_hill)
      (not (now ?t0))
      (now ?t3)
    )
  )

  ; Travel Nob Hill -> Fisherman's Wharf (same rounding: 11 -> 15 minutes)
  (:action travel-nh-to-fw
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time)
    :precondition (and
      (at nob_hill)
      (now ?t0)
      (next ?t0 ?t1)
      (next ?t1 ?t2)
      (next ?t2 ?t3)
    )
    :effect (and
      (not (at nob_hill))
      (at fishermans_wharf)
      (not (now ?t0))
      (now ?t3)
    )
  )

  ; Meet Kenneth for a single 5-minute quantum
  ; Allowed only at Nob Hill and when starting within his window so the entire step ends by 19:45.
  ; Accumulates 5 minutes via meeting-level progression; 18 applications reach the 90-minute requirement.
  (:action meet-kenneth-5
    :parameters (?t1 - time ?t2 - time ?m1 - mlevel ?m2 - mlevel)
    :precondition (and
      (at nob_hill)
      (now ?t1)
      (next ?t1 ?t2)
      (meet-start-allowed ?t1)
      (meeting-level ?m1)
      (next-level ?m1 ?m2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (meeting-level ?m1))
      (meeting-level ?m2)
    )
  )
)