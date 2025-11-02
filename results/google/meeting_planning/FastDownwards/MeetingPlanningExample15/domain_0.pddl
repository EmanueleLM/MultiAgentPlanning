(define (domain meeting-day)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent friend location minute count
  )

  (:predicates
    ; temporal backbone
    (time ?m - minute)
    (next ?m1 - minute ?m2 - minute)

    ; locations
    (at ?a - agent ?l - location)

    ; availability and anchors
    (john-available-at ?m - minute)       ; minutes within 13:00–18:15 window (780..1094)
    (john-window-start ?m - minute)       ; marks 13:00 minute (= m780)
    (day-end ?m - minute)                 ; marks 18:34 minute (= m1114)

    ; asymmetric travel offsets encoded as target times
    (plus21 ?m-depart - minute ?m-arrive - minute) ; RH -> GGP takes 21 minutes
    (plus19 ?m-depart - minute ?m-arrive - minute) ; GGP -> RH takes 19 minutes

    ; transit control
    (in-transit-out)                      ; traveling RH -> GGP
    (in-transit-in)                       ; traveling GGP -> RH
    (arrive-out-at ?m - minute)           ; scheduled arrival minute for outbound leg
    (arrive-in-at ?m - minute)            ; scheduled arrival minute for inbound leg

    ; meeting progress counter (0..315)
    (met-count ?c - count)
    (count-next ?c1 - count ?c2 - count)
  )

  ; advance time by one minute
  (:action advance-time
    :parameters (?t - minute ?t2 - minute)
    :precondition (and
      (time ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
    )
  )

  ; depart Russian Hill to Golden Gate Park, constrained to arrive exactly at the window start (13:00)
  (:action depart-rh-ggp
    :parameters (?a - agent ?t - minute ?arr - minute)
    :precondition (and
      (at ?a russian_hill)
      (time ?t)
      (plus21 ?t ?arr)
      (john-window-start ?arr)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a russian_hill))
      (in-transit-out)
      (arrive-out-at ?arr)
    )
  )

  ; complete arrival at Golden Gate Park when the current time hits the scheduled arrival minute
  (:action arrive-ggp
    :parameters (?a - agent ?t - minute)
    :precondition (and
      (in-transit-out)
      (time ?t)
      (arrive-out-at ?t)
    )
    :effect (and
      (at ?a golden_gate_park)
      (not (in-transit-out))
      (not (arrive-out-at ?t))
    )
  )

  ; meet John for exactly one minute inside his availability window; increments the meeting counter
  (:action meet-minute
    :parameters (?a - agent ?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (next ?t ?t2)
      (john-available-at ?t)
      (met-count ?c)
      (count-next ?c ?c2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (met-count ?c))
      (met-count ?c2)
    )
  )

  ; depart Golden Gate Park to Russian Hill, constrained to arrive exactly at day-end (18:34)
  (:action depart-ggp-rh
    :parameters (?a - agent ?t - minute ?arr - minute)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (plus19 ?t ?arr)
      (day-end ?arr)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a golden_gate_park))
      (in-transit-in)
      (arrive-in-at ?arr)
    )
  )

  ; complete arrival at Russian Hill when the current time hits the scheduled arrival minute
  (:action arrive-rh
    :parameters (?a - agent ?t - minute)
    :precondition (and
      (in-transit-in)
      (time ?t)
      (arrive-in-at ?t)
    )
    :effect (and
      (at ?a russian_hill)
      (not (in-transit-in))
      (not (arrive-in-at ?t))
    )
  )
)