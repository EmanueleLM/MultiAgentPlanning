(define (domain SatelliteImagingFleet)
  (:requirements :typing :durative-actions :negative-preconditions :equality :numeric-fluents :universal-preconditions)
  (:types satellite instrument direction mode)

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calib-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (have-image ?d - direction ?m - mode)
    (is-turning ?s - satellite)
    (busy-calibrating ?i - instrument)
    (calibrating-on ?s - satellite)
  )

  (:functions
    (count-mode ?m - mode)
  )

  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
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
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
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
                 (over all (not (calibrating-on ?s)))
                 ;; ensure no calibration on any instrument starts simultaneously on this satellite
                 (at start (forall (?i - instrument) (not (busy-calibrating ?i))))
                 (over all (forall (?i - instrument) (not (busy-calibrating ?i))))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at start (is-turning ?s))
              (at end (not (is-turning ?s)))
              (at end (pointing ?s ?to))
            )
  )

  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?target - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (calib-target ?i ?target))
                 (at start (pointing ?s ?target))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (over all (pointing ?s ?target))
                 (at start (not (is-turning ?s)))
                 (over all (not (is-turning ?s)))
               )
    :effect (and
              (at start (busy-calibrating ?i))
              (at start (calibrating-on ?s))
              (at end (calibrated ?i))
              (at end (not (busy-calibrating ?i)))
              (at end (not (calibrating-on ?s)))
            )
  )

  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?target - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (over all (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (at start (calibrated ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?target))
                 (at start (not (is-turning ?s)))
                 (over all (not (is-turning ?s)))
                 (at start (not (busy-calibrating ?i)))
                 (over all (not (busy-calibrating ?i)))
               )
    :effect (and
              (at end (have-image ?target ?m))
              (at end (increase (count-mode ?m) 1))
            )
  )

)