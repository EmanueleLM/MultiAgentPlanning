(define (domain multi-satellite)
  (:requirements :typing :negative-preconditions :fluents)
  (:types satellite instrument mode direction)
  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered-on ?i - instrument)
    (calibrated ?i - instrument)
    (have-image ?d - direction ?m - mode)
  )
  (:functions
    (fuel ?s - satellite)
    (data-capacity ?s - satellite)
    (fuel-used)
    (data-stored)
    (slew-time ?d1 - direction ?d2 - direction)
    (data-size ?d - direction ?m - mode)
  )

  ;; Slew / turn action: change pointing, consume fuel equal to slew-time, and accumulate global fuel-used
  (:action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and (pointing ?s ?from) (>= (fuel ?s) (slew-time ?from ?to)))
    :effect (and
      (not (pointing ?s ?from))
      (pointing ?s ?to)
      (decrease (fuel ?s) (slew-time ?from ?to))
      (increase (fuel-used) (slew-time ?from ?to))
    )
  )

  ;; Switch an instrument on: requires satellite power available, consumes that power and clears calibration
  (:action switch-on
    :parameters (?i - instrument ?s - satellite)
    :precondition (and (on-board ?i ?s) (power-available ?s) (not (powered-on ?i)))
    :effect (and
      (powered-on ?i)
      (not (power-available ?s))
      (not (calibrated ?i))
    )
  )

  ;; Switch an instrument off: frees satellite power
  (:action switch-off
    :parameters (?i - instrument ?s - satellite)
    :precondition (and (on-board ?i ?s) (powered-on ?i))
    :effect (and
      (not (powered-on ?i))
      (power-available ?s)
    )
  )

  ;; Calibrate an instrument: requires it to be on and the satellite pointing at its calibration target
  (:action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :precondition (and (on-board ?i ?s) (powered-on ?i) (pointing ?s ?d) (calibration-target ?i ?d))
    :effect (calibrated ?i)
  )

  ;; Take an image: requires instrument on, calibrated, supports mode, satellite pointing at direction,
  ;; and enough data capacity. Reduces satellite data-capacity and increases global data-stored, and records image.
  (:action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :precondition (and
      (on-board ?i ?s)
      (supports ?i ?m)
      (powered-on ?i)
      (calibrated ?i)
      (pointing ?s ?d)
      (>= (data-capacity ?s) (data-size ?d ?m))
    )
    :effect (and
      (have-image ?d ?m)
      (decrease (data-capacity ?s) (data-size ?d ?m))
      (increase (data-stored) (data-size ?d ?m))
    )
  )
)