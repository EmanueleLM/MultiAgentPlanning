(define (domain multi-sat-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :fluents)
  (:types
    satellite instrument direction imagemode
  )

  (:predicates
    ;; static / initial relations
    (onboard ?inst - instrument ?sat - satellite)
    (supports ?inst - instrument ?mode - imagemode)
    (calib-target ?inst - instrument ?dir - direction)

    ;; dynamic state
    (pointing ?sat - satellite ?dir - direction)    ; satellite currently pointing at dir
    (power-available ?sat - satellite)              ; satellite's single power feed is free
    (power-allocated ?sat - satellite ?inst - instrument) ; power is reserved for inst on sat
    (powered ?inst - instrument)                    ; instrument is powered (on)
    (calibrated ?inst - instrument)                 ; instrument has been calibrated
    (have-image ?dir - direction ?mode - imagemode) ; image of dir in mode is available
  )

  (:functions
    (slew-time ?from - direction ?to - direction) - number
    (calibration-time ?inst - instrument ?dir - direction) - number
  )

  ;; Slew action: satellite slews from one direction to another; during the slew it points nowhere.
  (:durative-action satellite-slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Switch an instrument on: claims the satellite power feed at start and holds it while on.
  ;; Clears calibration at start. Instrument becomes powered at end of the action.
  (:durative-action instrument-switch-on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-available ?s))
               )
    :effect (and
              ;; claim power at start, clear calibration at start, mark allocation persists until switched off
              (at start (not (power-available ?s)))
              (at start (power-allocated ?s ?i))
              (at start (not (calibrated ?i)))
              ;; instrument becomes powered at end
              (at end (powered ?i))
            )
  )

  ;; Switch an instrument off: instrument is considered off immediately at start.
  ;; Frees the satellite power feed at the end.
  (:durative-action instrument-switch-off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-allocated ?s ?i))
               )
    :effect (and
              ;; instrument off immediately
              (at start (not (powered ?i)))
              ;; free the power feed at end and remove allocation
              (at end (power-available ?s))
              (at end (not (power-allocated ?s ?i)))
            )
  )

  ;; Calibrate an instrument. Requires the satellite to be pointing at the calibration target at start,
  ;; and the instrument to be powered throughout the calibration.
  (:durative-action calibrate-instrument
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :duration (= ?duration (calibration-time ?i ?d))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (calib-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (over all (powered ?i))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take an image: requires the instrument to support the mode, and be powered and calibrated throughout,
  ;; and the satellite to be pointing at the target throughout.
  (:durative-action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - imagemode)
    :duration (= ?duration 7.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (pointing ?s ?d))
                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
               )
    :effect (and
              (at end (have-image ?d ?m))
            )
  )
)