(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :negative-preconditions :equality)
  (:types
    satellite instrument mode direction image
    ; base types
    satellite instrument mode direction image
  )

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (on-board ?i - instrument ?s - satellite)
    (instrument-powered ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (image-target ?img - image ?d - direction ?m - mode)
    (image-taken ?img - image)
    (power-used ?s - satellite)
  )

  (:functions
    (slew-time ?from - direction ?to - direction) ; numeric matrix provided in problem
    (cal-time ?i - instrument) ; calibration durations per instrument
    (power-switch-on-duration)
    (power-switch-off-duration)
    (take-image-duration)
  )

  ; Durative action to slew a satellite from one direction to another.
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction ?dur - number)
    :duration (= ?dur (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ; Switch on an instrument (consumes the satellite single power feed during the switching and while instrument is powered).
  (:durative-action switch-on-instrument
    :parameters (?i - instrument ?s - satellite ?dur - number)
    :duration (= ?dur (power-switch-on-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (not (instrument-powered ?i)))
                 (at start (not (power-used ?s)))
               )
    :effect (and
              ; reserve the power-feed immediately to prevent others using it while switch-on proceeds/finishes
              (at start (power-used ?s))
              ; instrument becomes powered once switch-on completes
              (at end (instrument-powered ?i))
            )
  )

  ; Switch off an instrument (frees the satellite single power feed)
  (:durative-action switch-off-instrument
    :parameters (?i - instrument ?s - satellite ?dur - number)
    :duration (= ?dur (power-switch-off-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (power-used ?s))
               )
    :effect (and
              (at end (not (instrument-powered ?i)))
              ; free the power feed at the end of switch-off
              (at end (not (power-used ?s)))
            )
  )

  ; Calibrate an instrument to its fixed calibration target (duration per instrument)
  (:durative-action calibrate-instrument
    :parameters (?i - instrument ?s - satellite ?dur - number ?t - direction)
    :duration (= ?dur (cal-time ?i))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (calibration-target ?i ?t))
                 (at start (not (calibrated ?i)))
                 ; must point at the calibration target for the whole calibration interval
                 (over all (pointing ?s ?t))
                 ; and the satellite power feed must remain used during calibration
                 (over all (power-used ?s))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ; Take an image with an instrument for a specified image-goal object
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode ?img - image ?dur - number)
    :duration (= ?dur (take-image-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (calibrated ?i))
                 (at start (supports ?i ?m))
                 (at start (image-target ?img ?d ?m))
                 ; must be pointed at the direction for the whole imaging interval
                 (over all (pointing ?s ?d))
                 ; satellite power-feed must be in use for the whole imaging interval
                 (over all (power-used ?s))
               )
    :effect (and
              (at end (image-taken ?img))
            )
  )

)