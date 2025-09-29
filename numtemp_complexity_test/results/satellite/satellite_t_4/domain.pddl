(define (domain multi-satellite)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :equality :numeric-fluents)
  (:types
    satellite instrument mode direction - object
    object
  )

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (pointing ?s - satellite ?d - direction)
    (supports ?i - instrument ?m - mode)
    (power-available ?s - satellite)
    (power-in-use ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (have-image ?d - direction ?m - mode)
    (calib-target ?i - instrument ?t - direction)
  )

  (:functions
    (slew-duration ?from - direction ?to - direction)
    (calib-duration ?i - instrument ?t - direction)
  )

  ;; Slew action: moves satellite pointing from one direction to another;
  ;; duration given by (slew-duration ?from ?to). Require that the numeric
  ;; duration entry is positive so zero/undefined durations cannot be used.
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-duration ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= (slew-duration ?from ?to) 0)))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Switch on an instrument: claims the satellite power feed at start (exclusive)
  ;; and results in instrument powered at end. Duration 2.
  (:durative-action switch_on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (powered ?i)))
                 (at start (not (power-in-use ?s)))
               )
    :effect (and
              ;; consume the available feed at start and indicate it's in use
              (at start (not (power-available ?s)))
              (at start (power-in-use ?s))
              ;; instrument becomes powered at end of the switch-on
              (at end (powered ?i))
            )
  )

  ;; Switch off an instrument: instrument becomes off at start, frees power at end. Duration 1.
  (:durative-action switch_off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at start (not (powered ?i)))
              ;; free up the satellite power feed at end
              (at end (not (power-in-use ?s)))
              (at end (power-available ?s))
            )
  )

  ;; Calibrate an instrument: requires satellite pointing at the instrument's fixed calibration target at start,
  ;; instrument powered at start and throughout. Duration given by (calib-duration ?i ?t).
  ;; Also require that the instrument-target pair is the declared calibration target.
  (:durative-action calibrate
    :parameters (?s - satellite ?i - instrument ?t - direction)
    :duration (= ?duration (calib-duration ?i ?t))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (pointing ?s ?t))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (over all (pointing ?s ?t))
                 (at start (calib-target ?i ?t))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take image: requires instrument supports the mode, is calibrated and powered,
  ;; and satellite pointing maintained throughout. Duration 7.
  (:durative-action take_image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (calibrated ?i))
                 (at start (powered ?i))
                 (at start (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (pointing ?s ?d))
               )
    :effect (and
              (at end (have-image ?d ?m))
            )
  )

)