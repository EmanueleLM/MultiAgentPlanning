(define (domain SatelliteImaging)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents :equality)
  (:types satellite instrument direction mode)

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calib-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (image-taken ?m - mode ?d - direction)
    (is-turning ?s - satellite)
    (calibrating ?s - satellite)
  )

  (:functions
    (count-mode ?m - mode)
  )

  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (on-board ?i ?s))
                 (over all (on-board ?i ?s))
                 (at start (power-available ?s))
               )
    :effect (and
              (at start (not (power-available ?s)))
              (at start (not (calibrated ?i)))
              (at end (powered ?i))
            )
  )

  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (on-board ?i ?s))
                 (over all (on-board ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at start (not (powered ?i)))
              (at end (power-available ?s))
            )
  )

  (:durative-action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= ?from ?to)))
                 (at start (not (is-turning ?s)))
                 (at start (not (calibrating ?s)))
                 (over all (not (calibrating ?s)))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at start (is-turning ?s))
              (at end (pointing ?s ?to))
              (at end (not (is-turning ?s)))
            )
  )

  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?target - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (on-board ?i ?s))
                 (over all (on-board ?i ?s))
                 (at start (calib-target ?i ?target))
                 (at start (pointing ?s ?target))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (over all (pointing ?s ?target))
                 (at start (not (is-turning ?s)))
                 (over all (not (is-turning ?s)))
                 (at start (not (calibrating ?s)))
               )
    :effect (and
              (at start (calibrating ?s))
              (at end (not (calibrating ?s)))
              (at end (calibrated ?i))
            )
  )

  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?target - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (on-board ?i ?s))
                 (over all (on-board ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (at start (calibrated ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?target))
                 (at start (not (is-turning ?s)))
                 (over all (not (is-turning ?s)))
                 (at start (not (calibrating ?s)))
                 (over all (not (calibrating ?s)))
               )
    :effect (and
              (at end (image-taken ?m ?target))
              (at end (increase (count-mode ?m) 1))
            )
  )

)