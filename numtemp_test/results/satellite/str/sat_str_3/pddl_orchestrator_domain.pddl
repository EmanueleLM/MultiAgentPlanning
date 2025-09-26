(define (domain satellite-orchestration)
  (:requirements :typing :negative-preconditions :strips)
  (:types satellite instrument direction mode)

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite) ; true when no instrument currently consuming power on that satellite
    (on ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (onboard ?s - satellite ?i - instrument)
    (have-image ?d - direction ?m - mode)
  )

  ;; Slew/turn action: change satellite pointing from one direction to another (cannot turn to same)
  (:action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and (pointing ?s ?from) (not (pointing ?s ?to)))
    :effect (and (not (pointing ?s ?from)) (pointing ?s ?to))
  )

  ;; Switch an instrument on: requires satellite power available (at most one instrument on per satellite).
  ;; Switching on clears that instrument's calibration.
  (:action switch-on
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?s ?i) (power-available ?s) (not (on ?i)))
    :effect (and (on ?i) (not (power-available ?s)) (not (calibrated ?i)))
  )

  ;; Switch an instrument off: frees satellite power. Does NOT clear calibration.
  (:action switch-off
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?s ?i) (on ?i))
    :effect (and (not (on ?i)) (power-available ?s))
  )

  ;; Calibrate an instrument: satellite must be pointing at the instrument's calibration target and instrument must be on.
  (:action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :precondition (and (onboard ?s ?i) (on ?i) (pointing ?s ?d) (calibration-target ?i ?d))
    :effect (calibrated ?i)
  )

  ;; Take an image: instrument must be on, calibrated, support the requested mode, and satellite must point at the target.
  (:action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and (onboard ?s ?i) (on ?i) (calibrated ?i) (pointing ?s ?d) (supports ?i ?m))
    :effect (have-image ?d ?m)
  )
)