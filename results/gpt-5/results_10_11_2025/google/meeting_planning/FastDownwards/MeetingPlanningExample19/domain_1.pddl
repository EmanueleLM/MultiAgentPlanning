(define (domain meeting_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    traveler
    location
    minute
    step
  )
  (:predicates
    ; agent and John state
    (at ?p - traveler ?l - location)
    (john-at ?l - location)
    (met-john-45)

    ; time
    (now ?t - minute)
    (next ?t1 - minute ?t2 - minute)      ; successor relation (minute granularity)
    (span ?t1 - minute ?t2 - minute)      ; explicitly enumerated long idle jumps
    (john-available ?t - minute)          ; John present at PH at this minute

    ; travel states (asymmetric)
    (travelling ?p - traveler ?from - location ?to - location)

    ; route GP->PH minute counter (16 steps)
    (cur-gp-ph ?p - traveler ?s - step)
    (gp-ph-succ ?s1 - step ?s2 - step)
    (gp-ph-last ?s - step)

    ; route PH->GP minute counter (15 steps)
    (cur-ph-gp ?p - traveler ?s - step)
    (ph-gp-succ ?s1 - step ?s2 - step)
    (ph-gp-last ?s - step)

    ; meeting minute counter (45 steps)
    (meeting ?p - traveler)
    (cur-meet ?p - traveler ?s - step)
    (meet-succ ?s1 - step ?s2 - step)
    (meet-last ?s - step)
  )

  ; Idle wait by one minute
  (:action wait-minute
    :parameters (?p - traveler ?t - minute ?u - minute)
    :precondition (and
      (now ?t)
      (next ?t ?u)
      (not (meeting ?p))
      (not (travelling ?p golden_gate_park pacific_heights))
      (not (travelling ?p pacific_heights golden_gate_park))
    )
    :effect (and
      (not (now ?t))
      (now ?u)
    )
  )

  ; Explicit long idle jump using a predeclared span edge
  (:action wait-span
    :parameters (?p - traveler ?t - minute ?u - minute)
    :precondition (and
      (now ?t)
      (span ?t ?u)
      (not (meeting ?p))
      (not (travelling ?p golden_gate_park pacific_heights))
      (not (travelling ?p pacific_heights golden_gate_park))
    )
    :effect (and
      (not (now ?t))
      (now ?u)
    )
  )

  ; Start travel Golden Gate Park -> Pacific Heights (16 minute chain)
  (:action start-travel-gp-ph
    :parameters (?p - traveler ?t - minute)
    :precondition (and
      (at ?p golden_gate_park)
      (now ?t)
      (not (meeting ?p))
      (not (travelling ?p golden_gate_park pacific_heights))
      (not (travelling ?p pacific_heights golden_gate_park))
    )
    :effect (and
      (travelling ?p golden_gate_park pacific_heights)
      (not (at ?p golden_gate_park))
      (cur-gp-ph ?p gp_ph_1)
    )
  )

  ; One minute of travel on GP->PH when not at the last step
  (:action travel-minute-gp-ph-step
    :parameters (?p - traveler ?s1 - step ?s2 - step ?t - minute ?u - minute)
    :precondition (and
      (travelling ?p golden_gate_park pacific_heights)
      (cur-gp-ph ?p ?s1)
      (gp-ph-succ ?s1 ?s2)
      (not (gp-ph-last ?s1))
      (now ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (cur-gp-ph ?p ?s1))
      (cur-gp-ph ?p ?s2)
      (not (now ?t))
      (now ?u)
    )
  )

  ; Final minute of travel GP->PH (arrive)
  (:action travel-minute-gp-ph-last
    :parameters (?p - traveler ?s - step ?t - minute ?u - minute)
    :precondition (and
      (travelling ?p golden_gate_park pacific_heights)
      (cur-gp-ph ?p ?s)
      (gp-ph-last ?s)
      (now ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (cur-gp-ph ?p ?s))
      (not (travelling ?p golden_gate_park pacific_heights))
      (at ?p pacific_heights)
      (not (now ?t))
      (now ?u)
    )
  )

  ; Start travel Pacific Heights -> Golden Gate Park (15 minute chain) [not required for goal, but provided]
  (:action start-travel-ph-gp
    :parameters (?p - traveler ?t - minute)
    :precondition (and
      (at ?p pacific_heights)
      (now ?t)
      (not (meeting ?p))
      (not (travelling ?p golden_gate_park pacific_heights))
      (not (travelling ?p pacific_heights golden_gate_park))
    )
    :effect (and
      (travelling ?p pacific_heights golden_gate_park)
      (not (at ?p pacific_heights))
      (cur-ph-gp ?p ph_gp_1)
    )
  )

  (:action travel-minute-ph-gp-step
    :parameters (?p - traveler ?s1 - step ?s2 - step ?t - minute ?u - minute)
    :precondition (and
      (travelling ?p pacific_heights golden_gate_park)
      (cur-ph-gp ?p ?s1)
      (ph-gp-succ ?s1 ?s2)
      (not (ph-gp-last ?s1))
      (now ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (cur-ph-gp ?p ?s1))
      (cur-ph-gp ?p ?s2)
      (not (now ?t))
      (now ?u)
    )
  )

  (:action travel-minute-ph-gp-last
    :parameters (?p - traveler ?s - step ?t - minute ?u - minute)
    :precondition (and
      (travelling ?p pacific_heights golden_gate_park)
      (cur-ph-gp ?p ?s)
      (ph-gp-last ?s)
      (now ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (cur-ph-gp ?p ?s))
      (not (travelling ?p pacific_heights golden_gate_park))
      (at ?p golden_gate_park)
      (not (now ?t))
      (now ?u)
    )
  )

  ; Start a meeting minute sequence with John at Pacific Heights
  (:action start-meeting-john
    :parameters (?p - traveler ?t - minute)
    :precondition (and
      (at ?p pacific_heights)
      (john-at pacific_heights)
      (now ?t)
      (john-available ?t)
      (not (meeting ?p))
      (not (travelling ?p golden_gate_park pacific_heights))
      (not (travelling ?p pacific_heights golden_gate_park))
    )
    :effect (and
      (meeting ?p)
      (cur-meet ?p meet_1)
    )
  )

  ; One minute of meeting when not at the last meeting step
  (:action meet-minute-step
    :parameters (?p - traveler ?s1 - step ?s2 - step ?t - minute ?u - minute)
    :precondition (and
      (meeting ?p)
      (cur-meet ?p ?s1)
      (meet-succ ?s1 ?s2)
      (not (meet-last ?s1))
      (at ?p pacific_heights)
      (john-at pacific_heights)
      (now ?t)
      (next ?t ?u)
      (john-available ?t)
    )
    :effect (and
      (not (cur-meet ?p ?s1))
      (cur-meet ?p ?s2)
      (not (now ?t))
      (now ?u)
    )
  )

  ; Final minute of the 45-minute meeting
  (:action meet-minute-last
    :parameters (?p - traveler ?s - step ?t - minute ?u - minute)
    :precondition (and
      (meeting ?p)
      (cur-meet ?p ?s)
      (meet-last ?s)
      (at ?p pacific_heights)
      (john-at pacific_heights)
      (now ?t)
      (next ?t ?u)
      (john-available ?t)
    )
    :effect (and
      (not (cur-meet ?p ?s))
      (not (meeting ?p))
      (met-john-45)
      (not (now ?t))
      (now ?u)
    )
  )
)