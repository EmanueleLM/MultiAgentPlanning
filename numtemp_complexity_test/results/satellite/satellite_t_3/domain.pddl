(define (domain multi-satellite-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    instrument satellite direction mode - thing
    thing
  )

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)

    (pointing ?s - satellite ?d - direction)
    (slewing ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (observed ?d - direction ?m - mode)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)
    (calibration-time ?i - instrument ?d - direction)
    (power-free ?s - satellite)
  )

  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at start (slewing ?s))
              (at end (not (slewing ?s)))
              (at end (pointing ?s ?to))
            )
  )

  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (not (powered ?i)))
                 (at start (>= (power-free ?s) 1))
               )
    :effect (and
              (at start (assign (power-free ?s) 0))
              (at start (not (calibrated ?i)))
              (at end (powered ?i))
            )
  )

  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (on-board ?i ?s))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (assign (power-free ?s) 1))
            )
  )

  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (calibration-time ?i ?t))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
                 (at start (cal-target ?i ?t))
                 (over all (pointing ?s ?t))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?t - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
                 (at start (supports ?i ?m))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?t))
               )
    :effect (and
              (at end (observed ?t ?m))
            )
  )
)