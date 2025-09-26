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
    (calibrated ?i - instrument)
    (have_image ?d - direction ?m - mode)
  )

  ;; Turning: satellite changes pointing from one direction to another (cannot turn to same direction)
  (:action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and (pointing ?s ?from) (not (pointing ?s ?to)))
    :effect (and (not (pointing ?s ?from)) (pointing ?s ?to))
  )

  ;; Switch an instrument on for a satellite: consumes the satellite's power resource and clears calibration
  (:action switch-on-instrument
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?i ?s) (power_available ?s))
    :effect (and (powered ?i) (not (power_available ?s)) (not (calibrated ?i)))
  )

  ;; Switch an instrument off: frees the satellite's power resource
  (:action switch-off-instrument
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?i ?s) (powered ?i))
    :effect (and (not (powered ?i)) (power_available ?s))
  )

  ;; Calibrate an instrument: requires instrument powered and satellite pointing at instrument's calibration target
  (:action calibrate-instrument
    :parameters (?s - satellite ?i - instrument ?t - direction)
    :precondition (and (onboard ?i ?s) (powered ?i) (pointing ?s ?t) (calibration_target ?i ?t))
    :effect (calibrated ?i)
  )

  ;; Take an image: requires satellite pointing at direction, instrument onboard, powered, calibrated, and supporting the mode
  (:action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and (onboard ?i ?s) (pointing ?s ?d) (powered ?i) (calibrated ?i) (supports ?i ?m))
    :effect (have_image ?d ?m)
  )
)