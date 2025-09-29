(define (domain multi-sat-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :fluents)
  (:types
    satellite instrument direction imagemode
  )

  (:predicates
    (onboard ?inst - instrument ?sat - satellite)
    (supports ?inst - instrument ?mode - imagemode)
    (calib-target ?inst - instrument ?dir - direction)

    (pointing ?sat - satellite ?dir - direction)
    (power-available ?sat - satellite)
    (power-allocated ?sat - satellite ?inst - instrument)
    (powered ?inst - instrument)
    (calibrated ?inst - instrument)
    (have-image ?dir - direction ?mode - imagemode)
    (slewing ?sat - satellite)
  )

  (:functions
    (slew-time ?from - direction ?to - direction) - number
    (calibration-time ?inst - instrument ?dir - direction) - number
  )

  (:durative-action satellite-slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (slewing ?s)))
                 (at start (not (= ?from ?to)))
               )
    :effect (and
              (at start (slewing ?s))
              (at start (not (pointing ?s ?from)))
              (at end (not (slewing ?s)))
              (at end (pointing ?s ?to))
            )
  )

  (:durative-action instrument-switch-on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at start (not (power-available ?s)))
              (at start (power-allocated ?s ?i))
              (at start (not (calibrated ?i)))
              (at end (powered ?i))
            )
  )

  (:durative-action instrument-switch-off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (power-allocated ?s ?i))
                 (at start (powered ?i))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at start (not (powered ?i)))
              (at end (power-available ?s))
              (at end (not (power-allocated ?s ?i)))
            )
  )

  (:durative-action calibrate-instrument
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :duration (= ?duration (calibration-time ?i ?d))
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (calib-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (at start (not (slewing ?s)))
                 (over all (powered ?i))
                 (over all (not (slewing ?s)))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  (:durative-action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - imagemode)
    :duration (= ?duration 7.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (pointing ?s ?d))
                 (at start (not (slewing ?s)))
                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (not (slewing ?s)))
               )
    :effect (and
              (at end (have-image ?d ?m))
            )
  )
)