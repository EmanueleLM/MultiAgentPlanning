(define (domain satellite-orchestrator)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (pointing ?s ?d)
    (onboard ?i ?s)
    (power-available ?s)
    (on ?i)
    (calibrated ?i)
    (supports ?i ?m)
    (calibration-target ?i ?d)
    (have-image ?d ?m)
  )

  ;; Turn (slew) action: change pointing from one direction to another.
  (:action turn
    :parameters (?s ?from ?to)
    :precondition (and (pointing ?s ?from) (not (pointing ?s ?to)))
    :effect (and (not (pointing ?s ?from)) (pointing ?s ?to))
  )

  ;; Switch an instrument on: consumes satellite power and clears instrument calibration.
  (:action switch-on
    :parameters (?s ?i)
    :precondition (and (onboard ?i ?s) (power-available ?s) (not (on ?i)))
    :effect (and (on ?i) (not (power-available ?s)) (not (calibrated ?i)))
  )

  ;; Switch an instrument off: frees satellite power. Does NOT clear calibration.
  (:action switch-off
    :parameters (?s ?i)
    :precondition (and (onboard ?i ?s) (on ?i))
    :effect (and (not (on ?i)) (power-available ?s))
  )

  ;; Calibrate an instrument: requires satellite pointing at the instrument's calibration target and the instrument to be on.
  (:action calibrate
    :parameters (?s ?i ?d)
    :precondition (and (onboard ?i ?s) (on ?i) (pointing ?s ?d) (calibration-target ?i ?d))
    :effect (calibrated ?i)
  )

  ;; Take an image: requires satellite pointing at target, instrument on, instrument calibrated, and instrument supports the mode.
  (:action take-image
    :parameters (?s ?i ?d ?m)
    :precondition (and (onboard ?i ?s) (on ?i) (pointing ?s ?d) (calibrated ?i) (supports ?i ?m))
    :effect (have-image ?d ?m)
  )
)