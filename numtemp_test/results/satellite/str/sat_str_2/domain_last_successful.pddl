(define (domain multi-sat)
  (:requirements :strips :typing)
  (:predicates
    (pointing ?s ?d)
    (power-available ?s)
    (instrument-on ?i)
    (calibrated ?i)
    (supports ?i ?m)
    (instrument-of ?i ?s)
    (calibration-target ?i ?d)
    (have-image ?d ?m)
  )

  ;; Slew / turn: change the single pointing of a satellite.
  (:action turn
    :parameters (?s ?from ?to)
    :precondition (pointing ?s ?from)
    :effect (and
      (not (pointing ?s ?from))
      (pointing ?s ?to)
    )
  )

  ;; Switch an instrument on: requires the satellite power to be available.
  ;; Switching on consumes the satellite power and clears the instrument calibration.
  (:action switch_on
    :parameters (?i ?s)
    :precondition (and
      (instrument-of ?i ?s)
      (power-available ?s)
    )
    :effect (and
      (instrument-on ?i)
      (not (calibrated ?i))
      (not (power-available ?s))
    )
  )

  ;; Switch an instrument off: frees the satellite power.
  (:action switch_off
    :parameters (?i ?s)
    :precondition (and
      (instrument-of ?i ?s)
      (instrument-on ?i)
    )
    :effect (and
      (not (instrument-on ?i))
      (power-available ?s)
    )
  )

  ;; Calibrate an instrument: requires instrument on and satellite pointing at instrument's calibration target.
  (:action calibrate
    :parameters (?i ?s ?d)
    :precondition (and
      (instrument-of ?i ?s)
      (instrument-on ?i)
      (pointing ?s ?d)
      (calibration-target ?i ?d)
    )
    :effect (calibrated ?i)
  )

  ;; Take an image: requires pointing at the target, instrument on, instrument calibrated, and instrument supports the mode.
  (:action take_image
    :parameters (?i ?s ?d ?m)
    :precondition (and
      (instrument-of ?i ?s)
      (instrument-on ?i)
      (calibrated ?i)
      (pointing ?s ?d)
      (supports ?i ?m)
    )
    :effect (have-image ?d ?m)
  )
)