(define (domain satellite-multiagent)
  (:requirements :typing :durative-actions :numeric-fluents :negative-preconditions :fluents :strips :equality :constraints)
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
  )

  (:functions
    (mode-count ?m - mode) ; numeric counter per mode
    (slewtime ?d1 - direction ?d2 - direction) ; duration for slews
    (calibtime ?i - instrument ?t - direction) ; calibration durations
  )

  ;; Switch on an instrument (claims the satellite power feed at start, duration 2)
  (:durative-action switch-on-?i
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-free ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (not (power-free ?s))) ; claim feed immediately
              (at end (powered ?i))
            )
  )

  ;; Switch off an instrument (releases power feed at end, duration 1)
  (:durative-action switch-off-?i
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (power-free ?s))
            )
  )

  ;; Calibrate an instrument (duration given by calibtime). Requires pointing at cal target throughout and instrument powered.
  (:durative-action calibrate-?i
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (calibtime ?i ?t))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (cal-target ?i ?t))
                 (over all (pointing ?s ?t))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take image with an instrument in a given mode at a direction (duration fixed 7)
  (:durative-action take-image-?i
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7.0)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (powered ?i))
                 (at start (calibrated ?i))
                 (over all (pointing ?s ?d))
               )
    :effect (and
              (at end (have_image ?d ?m))
              (at end (increase (mode-count ?m) 1.0))
            )
  )

  ;; Slew a satellite from one direction to another. While slewing the satellite points nowhere.
  (:durative-action slew-satellite-?s
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slewtime ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= ?from ?to)))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )
)