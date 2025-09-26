(define (domain multi-satellite)
  (:requirements :strips :typing :negative-preconditions)
  (:types satellite instrument mode direction)

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration_target ?i - instrument ?d - direction)
    (powered ?i - instrument)
    (power_available ?s - satellite)
    (power_used_by ?s - satellite ?i - instrument)
    (calibrated ?i - instrument)
    (have_image ?d - direction ?m - mode)
  )

  (:action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and (pointing ?s ?from) (not (pointing ?s ?to)))
    :effect (and (not (pointing ?s ?from)) (pointing ?s ?to))
  )

  (:action switch-on-instrument
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?i ?s) (power_available ?s))
    :effect (and (powered ?i) (power_used_by ?s ?i) (not (power_available ?s)) (not (calibrated ?i)))
  )

  (:action switch-off-instrument
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?i ?s) (powered ?i) (power_used_by ?s ?i))
    :effect (and (not (powered ?i)) (not (power_used_by ?s ?i)) (power_available ?s))
  )

  (:action calibrate-instrument
    :parameters (?s - satellite ?i - instrument ?t - direction)
    :precondition (and (onboard ?i ?s) (power_used_by ?s ?i) (pointing ?s ?t) (calibration_target ?i ?t))
    :effect (calibrated ?i)
  )

  (:action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and (onboard ?i ?s) (pointing ?s ?d) (power_used_by ?s ?i) (calibrated ?i) (supports ?i ?m))
    :effect (have_image ?d ?m)
  )
)