(define (domain sf_meet_5min)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    time
    location
    mlevel
  )

  (:predicates
    ; time and movement
    (now ?t - time)                           ; current timepoint
    (next ?t1 - time ?t2 - time)              ; discrete 5-minute successor

    ; positioning
    (at ?l - location)                        ; agent at location

    ; meeting window control
    (meet-start-allowed ?t - time)            ; starting a 5-min meet step at ?t is within Kenneth's availability (ensures end <= 19:45)

    ; meeting progress counter (18 steps = 90 minutes)
    (meeting-level ?m - mlevel)               ; current accumulated 5-min meeting level
    (next-level ?m1 - mlevel ?m2 - mlevel)    ; successor meeting level
  )

  ; Waiting action: advances time by one 5-minute step
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

  ; Travel FW -> NH: 11 minutes rounded up to 15 minutes = 3 successive 5-min steps
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

  ; Travel NH -> FW: 11 minutes rounded up to 15 minutes = 3 successive 5-min steps
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

  ; Meet Kenneth for one 5-minute quantum; only allowed entirely within 14:15–19:45
  ; Repeating this action 18 times (consecutively or with waits between) achieves the 90-minute minimum requirement.
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