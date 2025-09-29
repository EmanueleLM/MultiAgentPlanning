(define (domain satellite-multiagent)
  (:requirements :typing :durative-actions :numeric-fluents :negative-preconditions :strips :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    satellite instrument direction mode - object
    object
  )

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?t - direction)

    (pointing ?s - satellite ?d - direction)
    (power-free ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (have_image ?d - direction ?m - mode)
    (in-use ?i - instrument)
  )

  (:functions
    (mode-count ?m - mode)
    (slewtime ?d1 - direction ?d2 - direction)
    (calibtime ?i - instrument ?t - direction)
  )

  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (power-free ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (not (power-free ?s)))
              (at start (not (calibrated ?i)))
              (at end (powered ?i))
            )
  )

  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at start (not (powered ?i)))
              (at end (power-free ?s))
            )
  )

  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (calibtime ?i ?t))
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (at start (cal-target ?i ?t))
                 (over all (pointing ?s ?t))
               )
    :effect (and
              (at start (in-use ?i))
              (at end (calibrated ?i))
              (at end (not (in-use ?i)))
            )
  )

  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (at start (calibrated ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?d))
                 (at start (not (in-use ?i)))
               )
    :effect (and
              (at start (in-use ?i))
              (at end (have_image ?d ?m))
              (at end (increase (mode-count ?m) 1.0))
              (at end (not (in-use ?i)))
            )
  )

  (:durative-action slew-satellite
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slewtime ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= ?from ?to)))
                 (at start (> (slewtime ?from ?to) 0.0))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )
)