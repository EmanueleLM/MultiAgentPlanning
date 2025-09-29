(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions :numeric-fluents :durative-actions)
  (:types
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
    (power-switch-on-duration) ; number
    (power-switch-off-duration) ; number
    (take-image-duration) ; number
  )

  (:durative-action slew
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

  (:durative-action switch-on-instrument
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration (power-switch-on-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (not (instrument-powered ?i)))
                 (at start (not (power-used ?s)))
               )
    :effect (and
              (at start (power-used ?s))
              (at end (instrument-powered ?i))
            )
  )

  (:durative-action switch-off-instrument
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration (power-switch-off-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (power-used ?s))
               )
    :effect (and
              (at end (not (instrument-powered ?i)))
              (at end (not (power-used ?s)))
            )
  )

  (:durative-action calibrate-instrument
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (cal-time ?i))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (calibration-target ?i ?t))
                 (at start (not (calibrated ?i)))
                 (over all (pointing ?s ?t))
                 (over all (power-used ?s))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode ?img - image)
    :duration (= ?duration (take-image-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (calibrated ?i))
                 (at start (supports ?i ?m))
                 (at start (image-target ?img ?d ?m))
                 (over all (pointing ?s ?d))
                 (over all (power-used ?s))
               )
    :effect (and
              (at end (image-taken ?img))
            )
  )

)