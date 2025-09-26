(define (domain satellite-multi-agent)
  (:requirements :strips :typing :negative-preconditions :equality
                 :conditional-effects :quantified-preconditions :disjunctive-preconditions
                 :numeric-fluents)
  (:types satellite instrument mode direction)
  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (power_avail ?s - satellite)
    (power_on ?i - instrument)
    (calibrated ?i - instrument)
    (pointing ?s - satellite ?d - direction)
    (have_image ?d - direction ?m - mode)
  )

  (:functions
    (fuel ?s - satellite)
    (data-capacity ?s - satellite)
    (fuel-used)
    (data-stored)
    (slew-time ?from - direction ?to - direction)
    (image-size ?d - direction ?m - mode)
  )

  ;; Slew/turn action: specific satellite performs the turn and consumes fuel
  (:action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and
      (pointing ?s ?from)
      (>= (fuel ?s) (slew-time ?from ?to))
    )
    :effect (and
      (not (pointing ?s ?from))
      (pointing ?s ?to)
      (decrease (fuel ?s) (slew-time ?from ?to))
      (increase (fuel-used) (slew-time ?from ?to))
    )
  )

  ;; Switch an instrument on: requires satellite power availability, clears calibration
  (:action switch_on
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
      (onboard ?i ?s)
      (power_avail ?s)
      (not (power_on ?i))
    )
    :effect (and
      (power_on ?i)
      (not (power_avail ?s))
      (not (calibrated ?i))
    )
  )

  ;; Switch an instrument off: frees satellite power
  (:action switch_off
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
      (onboard ?i ?s)
      (power_on ?i)
    )
    :effect (and
      (not (power_on ?i))
      (power_avail ?s)
    )
  )

  ;; Calibrate an instrument: requires instrument on and pointing at its calibration target
  (:action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :precondition (and
      (onboard ?i ?s)
      (power_on ?i)
      (pointing ?s ?d)
      (calibration-target ?i ?d)
    )
    :effect (and
      (calibrated ?i)
    )
  )

  ;; Take an image: requires instrument on, calibrated, supports the mode, pointing at direction,
  ;; and sufficient data capacity on the satellite. Updates global and per-satellite numeric fluents.
  (:action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :precondition (and
      (onboard ?i ?s)
      (power_on ?i)
      (calibrated ?i)
      (pointing ?s ?d)
      (supports ?i ?m)
      (>= (data-capacity ?s) (image-size ?d ?m))
    )
    :effect (and
      (have_image ?d ?m)
      (decrease (data-capacity ?s) (image-size ?d ?m))
      (increase (data-stored) (image-size ?d ?m))
    )
  )

)