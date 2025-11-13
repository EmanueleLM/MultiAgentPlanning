(define (domain meet-joseph-nobhill)
  (:requirements :strips :typing :negative-preconditions)
  (:types minute location)

  (:predicates
    (current ?t - minute)
    (at ?loc - location)
    (met-joseph)
    (succ1 ?t1 - minute ?t2 - minute)
    (succ6 ?t1 - minute ?t2 - minute)
    (succ8 ?t1 - minute ?t2 - minute)
    (succ75 ?t1 - minute ?t2 - minute)
    (allowed-meeting-start ?t - minute)
  )

  ;; Move from Chinatown to Nob Hill consuming exactly 8 minutes
  (:action move-chinatown-to-nobhill
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (current ?t) (at chinatown) (succ8 ?t ?t2))
    :effect (and
              (not (current ?t)) (current ?t2)
              (not (at chinatown)) (at nobhill)
            )
  )

  ;; Move from Nob Hill to Chinatown consuming exactly 6 minutes
  (:action move-nobhill-to-chinatown
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (current ?t) (at nobhill) (succ6 ?t ?t2))
    :effect (and
              (not (current ?t)) (current ?t2)
              (not (at nobhill)) (at chinatown)
            )
  )

  ;; Wait for 1 minute (idle)
  (:action wait-1min
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (current ?t) (succ1 ?t ?t2))
    :effect (and
              (not (current ?t)) (current ?t2)
            )
  )

  ;; Meet Joseph for a contiguous block of 75 minutes.
  ;; Allowed only if start minute is explicitly marked allowed (ensures meeting fits fully within 11:30-15:15).
  (:action meet-joseph-nobhill-75min
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (current ?t) (at nobhill) (allowed-meeting-start ?t) (succ75 ?t ?t2))
    :effect (and
              (not (current ?t)) (current ?t2)
              (met-joseph)
              (at nobhill)
            )
  )
)