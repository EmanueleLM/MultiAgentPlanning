(define (domain multi-satellite)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types satellite instrument mode direction)

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-free ?s - satellite)                      ; logical single-power resource per satellite
    (instrument-on ?i - instrument)                  ; instrument is powered on
    (powered-by ?i - instrument ?s - satellite)      ; instrument ?i is powered and consuming ?s power
    (calibrated ?i - instrument)                     ; instrument has been calibrated since last power-on
    (have-image ?d - direction ?m - mode)
  )

  ;; Slew (turn) action: changes pointing from one direction to another. Cannot turn to same direction.
  (:action slew
    :parameters (?sat - satellite ?from - direction ?to - direction)
    :precondition (and (pointing ?sat ?from) (not (= ?from ?to)))
    :effect (and (not (pointing ?sat ?from)) (pointing ?sat ?to))
  )

  ;; Switch an instrument on: consumes the satellite's free power resource.
  ;; Switching on clears the instrument's calibration (calibration must be redone after power-on).
  (:action switch-on-instrument
    :parameters (?inst - instrument ?sat - satellite)
    :precondition (and (on-board ?inst ?sat) (power-free ?sat))
    :effect (and
              (instrument-on ?inst)
              (powered-by ?inst ?sat)
              (not (power-free ?sat))
              (not (calibrated ?inst))
            )
  )

  ;; Switch an instrument off: frees the satellite power resource.
  (:action switch-off-instrument
    :parameters (?inst - instrument ?sat - satellite)
    :precondition (and (on-board ?inst ?sat) (instrument-on ?inst) (powered-by ?inst ?sat))
    :effect (and
              (power-free ?sat)
              (not (instrument-on ?inst))
              (not (powered-by ?inst ?sat))
            )
  )

  ;; Calibrate an instrument: requires the satellite to be pointing at the instrument's calibration target and the instrument powered on.
  (:action calibrate-instrument
    :parameters (?inst - instrument ?sat - satellite ?d - direction)
    :precondition (and (on-board ?inst ?sat) (powered-by ?inst ?sat) (pointing ?sat ?d) (cal-target ?inst ?d))
    :effect (and (calibrated ?inst))
  )

  ;; Take an image: requires the satellite pointing at the target, the specified instrument onboard and powered, the instrument supports the requested mode, and the instrument is calibrated.
  (:action take-image
    :parameters (?inst - instrument ?sat - satellite ?d - direction ?m - mode)
    :precondition (and (on-board ?inst ?sat) (powered-by ?inst ?sat) (pointing ?sat ?d) (supports ?inst ?m) (calibrated ?inst))
    :effect (and (have-image ?d ?m))
  )

)