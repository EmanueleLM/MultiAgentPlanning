(define (domain multi-sat-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types
    instrument satellite direction mode - object
    object
  )

  (:predicates
    (on ?i - instrument ?s - satellite)
    (pointing ?s - satellite ?d - direction)
    (turning ?s - satellite)
    (power-free ?s - satellite)
    (powered ?i - instrument)
    (instrument-calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
  )

  (:functions
    (calibration-time ?i - instrument ?d - direction)  ; time to calibrate instrument ?i on direction ?d
    (slew-time ?from - direction ?to - direction)      ; time to slew from ?from to ?to
  )

  ;; Power on an instrument (uses the satellite's single power feed)
  (:durative-action power-on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2)
    :condition (and
      (at start (on ?i ?s))
      (at start (power-free ?s))
      (over all (not (turning ?s)))
    )
    :effect (and
      (at start (not (power-free ?s)))
      (at end (powered ?i))
    )
  )

  ;; Power off an instrument, frees the satellite power feed at end
  (:durative-action power-off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1)
    :condition (and
      (at start (on ?i ?s))
      (at start (powered ?i))
      (over all (not (turning ?s)))
    )
    :effect (and
      (at start (not (powered ?i)))
      (at end (power-free ?s))
    )
  )

  ;; Calibrate an instrument on its calibration target direction
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (calibration-time ?i ?d))
    :condition (and
      (at start (on ?i ?s))
      (at start (calibration-target ?i ?d))
      (at start (pointing ?s ?d))
      (at start (powered ?i))
      (over all (powered ?i))
      (over all (pointing ?s ?d))
    )
    :effect (and
      (at end (instrument-calibrated ?i))
    )
  )

  ;; Slew a satellite from one direction to another (satellite is 'turning' during the slew)
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
      (at start (pointing ?s ?from))
      (at start (not (turning ?s)))
    )
    :effect (and
      (at start (not (pointing ?s ?from)))
      (at start (turning ?s))
      (at end (not (turning ?s)))
      (at end (pointing ?s ?to))
    )
  )

  ;; Take an image (mode-specific). Requires instrument supports the mode, is powered and calibrated,
  ;; and the satellite points at the target for the duration.
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
      (at start (on ?i ?s))
      (at start (pointing ?s ?d))
      (at start (powered ?i))
      (at start (supports ?i ?m))
      (at start (instrument-calibrated ?i))
      (over all (powered ?i))
      (over all (pointing ?s ?d))
    )
    :effect (and
      (at end (have-image ?d ?m))
    )
  )

)