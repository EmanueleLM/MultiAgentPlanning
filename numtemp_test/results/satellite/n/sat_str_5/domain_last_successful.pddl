(define (domain satellite-domain)
  (:requirements :typing :negative-preconditions :equality :numeric-fluents)
  (:types satellite instrument mode direction)

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-avail ?s - satellite)
    (instrument-on ?i - instrument)
    (calibrated ?i - instrument)
    (have-image ?d - direction ?m - mode)
  )

  (:functions
    (fuel ?s - satellite)
    (data-capacity ?s - satellite)
    (data-stored)
    (fuel-used)
    (slewtime ?from - direction ?to - direction)
    (data-size ?d - direction ?m - mode)
  )

  (:action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and
                    (pointing ?s ?from)
                    (not (= ?from ?to))
                    (>= (fuel ?s) (slewtime ?from ?to))
                  )
    :effect (and
              (not (pointing ?s ?from))
              (pointing ?s ?to)
              (decrease (fuel ?s) (slewtime ?from ?to))
              (increase (fuel-used) (slewtime ?from ?to))
            )
  )

  (:action switch_on
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
                    (onboard ?i ?s)
                    (power-avail ?s)
                    (not (instrument-on ?i))
                  )
    :effect (and
              (instrument-on ?i)
              (not (power-avail ?s))
              (not (calibrated ?i))
            )
  )

  (:action switch_off
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
                    (onboard ?i ?s)
                    (instrument-on ?i)
                  )
    :effect (and
              (not (instrument-on ?i))
              (power-avail ?s)
            )
  )

  (:action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :precondition (and
                    (onboard ?i ?s)
                    (instrument-on ?i)
                    (pointing ?s ?d)
                    (calibration-target ?i ?d)
                  )
    :effect (calibrated ?i)
  )

  (:action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and
                    (onboard ?i ?s)
                    (supports ?i ?m)
                    (instrument-on ?i)
                    (calibrated ?i)
                    (pointing ?s ?d)
                    (not (have-image ?d ?m))
                    (>= (data-capacity ?s) (data-size ?d ?m))
                  )
    :effect (and
              (have-image ?d ?m)
              (decrease (data-capacity ?s) (data-size ?d ?m))
              (increase (data-stored) (data-size ?d ?m))
            )
  )
)