(define (domain satellite-orchestration)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types
    satellite instrument mode direction - object
    object
  )

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (on-board ?i - instrument ?s - satellite)
    (supports-mode ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (power-available ?s - satellite)
    (power-free ?s - satellite) ; true when no instrument on this satellite is consuming the single power feed
    (instrument-powered ?i - instrument)
    (instrument-calibrated ?i - instrument)
    (have-image ?t - direction ?m - mode)
  )

  (:functions
    (slew-time ?from - direction ?to - direction) ; symmetric numeric durations provided in problem
    (calibration-time ?i - instrument) ; numeric calibration duration per instrument (calibration to its fixed target)
    (mode-count ?m - mode) ; numeric counter of images taken per mode
    (total-time) ; accumulated total time (objective to minimize)
  )

  ;; Slew action performed by a satellite to change its pointing
  (:durative-action slew-sat
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
      (at start (pointing ?s ?from))
      (at start (power-available ?s))
    )
    :effect (and
      (at start (not (pointing ?s ?from)))
      (at end (pointing ?s ?to))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Power on an instrument (uses the satellite's single power feed)
  (:durative-action power-on-instrument
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 0)
    :condition (and
      (at start (on-board ?i ?s))
      (at start (power-available ?s))
      (at start (power-free ?s)) ; ensure single power feed is free
    )
    :effect (and
      (at end (instrument-powered ?i))
      (at end (not (power-free ?s)))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Power off an instrument (free the satellite power feed)
  (:durative-action power-off-instrument
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 0)
    :condition (and
      (at start (on-board ?i ?s))
      (at start (instrument-powered ?i))
    )
    :effect (and
      (at end (not (instrument-powered ?i)))
      (at end (power-free ?s))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Calibrate an instrument at its fixed calibration target
  (:durative-action calibrate-instrument
    :parameters (?s - satellite ?i - instrument ?t - direction)
    :duration (= ?duration (calibration-time ?i))
    :condition (and
      (at start (on-board ?i ?s))
      (at start (instrument-powered ?i))
      (at start (pointing ?s ?t))
      (at start (calibration-target ?i ?t))
    )
    :effect (and
      (at end (instrument-calibrated ?i))
      (at end (increase (total-time) ?duration))
    )
  )

  ;; Take an image/observation using an instrument in a supported mode at the satellite's current pointing
  ;; Note: imaging is modeled as instantaneous (duration 0) to avoid assuming unprovided image durations.
  (:durative-action take-image
    :parameters (?s - satellite ?i - instrument ?t - direction ?m - mode)
    :duration (= ?duration 0)
    :condition (and
      (at start (on-board ?i ?s))
      (at start (instrument-powered ?i))
      (at start (instrument-calibrated ?i))
      (at start (pointing ?s ?t))
      (at start (supports-mode ?i ?m))
    )
    :effect (and
      (at end (have-image ?t ?m))
      (at end (increase (mode-count ?m) 1))
      (at end (increase (total-time) ?duration))
    )
  )
)