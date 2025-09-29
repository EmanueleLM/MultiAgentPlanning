(define (domain multi-sat-temporal)
  (:requirements :strips :typing :durative-actions :negative-preconditions :equality :numeric-fluents :conditional-effects)
  (:types
    satellite instrument mode direction
  )

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (onboard ?i - instrument ?s - satellite)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
    (using ?i - instrument)
    (slewing ?s - satellite)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)
    (cal-time ?i - instrument ?d - direction)
    (total-time)
    (num-images ?m - mode)
  )

  (:durative-action slew
    :parameters (?s - satellite ?prev - direction ?new - direction)
    :duration (= ?duration (slew-time ?prev ?new))
    :condition (and
                 (at start (pointing ?s ?prev))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at start (not (pointing ?s ?prev)))
              (at start (slewing ?s))
              (at end (not (slewing ?s)))
              (at end (pointing ?s ?new))
              (at end (increase (total-time) (slew-time ?prev ?new)))
            )
  )

  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (powered ?i)))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at start (not (calibrated ?i)))
              (at start (not (power-available ?s)))
              (at end (powered ?i))
              (at end (increase (total-time) 2))
            )
  )

  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (power-available ?s))
              (at end (increase (total-time) 1))
            )
  )

  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (cal-time ?i ?d))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (calibration-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (at start (not (slewing ?s)))
                 (at start (not (calibrated ?i)))
                 (over all (pointing ?s ?d))
                 (over all (not (slewing ?s)))
               )
    :effect (and
              (at end (calibrated ?i))
              (at end (increase (total-time) (cal-time ?i ?d)))
            )
  )

  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (not (using ?i)))
                 (at start (supports ?i ?m))
                 (at start (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?d))
                 (over all (not (slewing ?s)))
               )
    :effect (and
              (at start (using ?i))
              (at end (not (using ?i)))
              (at end (have-image ?d ?m))
              (at end (increase (num-images ?m) 1))
              (at end (increase (total-time) 7))
            )
  )
)