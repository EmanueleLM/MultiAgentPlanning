(define (domain satellite-domain)
  (:requirements :typing :durative-actions :negative-preconditions :equality :fluents)
  (:types satellite instrument mode direction)

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration_target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (slewing ?s - satellite)
    (image_taken ?d - direction ?m - mode)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)
    (cal-time ?i - instrument ?d - direction)
  )

  ;; Slew action: changes pointing from one direction to another.
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at start (slewing ?s))
              (at end (not (slewing ?s)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Switch instrument on: reserves the satellite power feed for the instrument for the time it is on.
  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (not (power-available ?s)))
              (at end (powered ?i))
            )
  )

  ;; Switch instrument off: frees the satellite power feed.
  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (power-available ?s))
            )
  )

  ;; Calibrate instrument: requires instrument powered and satellite pointing at calibration target for entire calibration duration.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (cal-time ?i ?d))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (calibration_target ?i ?d))
                 (over all (pointing ?s ?d))
                 (at start (not (calibrated ?i)))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take an image: requires instrument powered, calibrated, supports the mode, and satellite pointing at the target during the exposure.
  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (supports ?i ?m))
                 (at start (calibrated ?i))
                 (over all (pointing ?s ?d))
               )
    :effect (and
              (at end (image_taken ?d ?m))
            )
  )

)