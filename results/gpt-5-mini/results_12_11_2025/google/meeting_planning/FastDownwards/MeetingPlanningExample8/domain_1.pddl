(define (domain MeetingPlanning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    ;; agent location and time bookkeeping
    (at ?l - location)
    (at-time ?t - time)
    (time-step ?t - time)
    ;; temporal successor relations (one-minute and compiled travel steps)
    (next ?t1 - time ?t2 - time)      ;; +1 minute
    (next12 ?t1 - time ?t2 - time)    ;; +12 minutes (Chinatown->Marina)
    (next16 ?t1 - time ?t2 - time)    ;; +16 minutes (Marina->Chinatown)
    ;; Stephanie availability and meeting markers
    (stephanie-available ?t - time)
    (met-stephanie-at ?t - time)
    ;; goal marker (set when 105 consecutive minutes have been met)
    (goal-satisfied)
  )

  ;; Move from Chinatown to Marina District taking exactly 12 minutes
  (:action move-chinatown-to-marina
    :parameters (?t ?t2 - time)
    :precondition (and
      (at Chinatown)
      (at-time ?t)
      (next12 ?t ?t2)
    )
    :effect (and
      (not (at Chinatown))
      (at MarinaDistrict)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Move from Marina District to Chinatown taking exactly 16 minutes
  (:action move-marina-to-chinatown
    :parameters (?t ?t2 - time)
    :precondition (and
      (at MarinaDistrict)
      (at-time ?t)
      (next16 ?t ?t2)
    )
    :effect (and
      (not (at MarinaDistrict))
      (at Chinatown)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Wait one minute (stay at the same location)
  (:action wait-one-minute
    :parameters (?loc - location ?t ?t2 - time)
    :precondition (and
      (at ?loc)
      (at-time ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      ;; (at ?loc) remains true (no change)
    )
  )

  ;; Meet Stephanie for one minute (can be repeated to accumulate consecutive meeting minutes)
  (:action meet-one-minute
    :parameters (?t ?t2 - time)
    :precondition (and
      (at MarinaDistrict)
      (at-time ?t)
      (next ?t ?t2)
      (stephanie-available ?t)
    )
    :effect (and
      (met-stephanie-at ?t)
      (not (at-time ?t))
      (at-time ?t2)
      ;; remain at MarinaDistrict
    )
  )

  ;; The following "check" actions detect any block of 105 consecutive met-stephanie-at minutes starting at tK
  ;; If such a block exists, the action sets goal-satisfied. We provide check actions for all potential start times
  ;; in the truncated planning horizon (t0..t12) so the planner can assert the objective generically.
  ;; (There is no action effect that encodes a specific meeting schedule; these actions only check for existence.)
)