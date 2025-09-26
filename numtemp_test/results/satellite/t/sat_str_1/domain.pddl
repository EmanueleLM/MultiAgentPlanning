(define (domain satellite-temporal)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :numeric-fluents)
  (:types satellite instrument mode direction)

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?t - direction)
    (inst_on ?i - instrument)
    (calibrated ?i - instrument)
    (pointing ?s - satellite ?d - direction)
    (taken ?m - mode ?d - direction)
  )

  (:functions
    (power-available ?s - satellite) ; 1 = free, 0 = claimed
    (have-images ?m - mode) ; numeric count of images taken for mode
    (slew-time ?from - direction ?to - direction)
    (calib-time ?i - instrument ?t - direction)
  )

  ;; Switch an instrument on: requires the satellite power feed to be free at start.
  ;; At end the instrument is on and the satellite power is claimed (set to 0).
  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (not (inst_on ?i)))
                 (at start (>= (power-available ?s) 1))
               )
    :effect (and
              (at end (inst_on ?i))
              (at end (assign (power-available ?s) 0))
            )
  )

  ;; Switch an instrument off: releases the satellite power feed at end.
  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (inst_on ?i))
               )
    :effect (and
              (at end (not (inst_on ?i)))
              (at end (assign (power-available ?s) 1))
            )
  )

  ;; Calibrate an instrument while the satellite is pointing at its calibration target.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (calib-time ?i ?t))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (inst_on ?i))
                 (at start (pointing ?s ?t))
                 (at start (cal-target ?i ?t))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take an image: instrument must be on, calibrated, support the mode, and satellite must be pointing at target.
  ;; Increases numeric counter and records that a picture for (mode,direction) was taken.
  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?t - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (inst_on ?i))
                 (at start (calibrated ?i))
                 (at start (pointing ?s ?t))
                 (at start (supports ?i ?m))
               )
    :effect (and
              (at end (increase (have-images ?m) 1))
              (at end (taken ?m ?t))
            )
  )

  ;; Slew a satellite from one direction to another; duration is given by slew-time table.
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at end (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )
)