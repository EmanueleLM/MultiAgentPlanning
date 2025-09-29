(define (domain multi-satellite-temporal-numeric)
  (:requirements :typing :durative-actions :numeric :negative-preconditions :fluents)
  (:types
    satellite instrument direction mode - object
    object
  )

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (pointing ?s - satellite ?d - direction)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (image-taken ?d - direction ?m - mode)
    (power-available ?s - satellite)
  )

  (:functions
    (power-consumption ?s - satellite) ; number of instruments currently powered on this satellite
    (power-capacity ?s - satellite)    ; capacity (1 for each satellite)
    (slew-time ?from - direction ?to - direction)
    (cal-time ?i - instrument ?d - direction)
    (switch-on-duration)
    (switch-off-duration)
    (take-image-duration)
  )

  ;; Switch on an instrument (consumes satellite power capacity)
  (:durative-action switch-on-instrument
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration (switch-on-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (power-available ?s))
                 ;; ensure capacity remains <= power-capacity after turning on
                 (at start (<= (+ (power-consumption ?s) 1) (power-capacity ?s)))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (assign (power-consumption ?s) (+ (power-consumption ?s) 1)))
              (at start (powered ?i))
            )
  )

  ;; Switch off an instrument (free satellite power)
  (:durative-action switch-off-instrument
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration (switch-off-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at end (assign (power-consumption ?s) (- (power-consumption ?s) 1)))
              (at end (not (powered ?i)))
            )
  )

  ;; Calibrate an instrument: requires instrument powered and satellite pointing to calibration target during the whole calibration
  (:durative-action calibrate-instrument
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (cal-time ?i ?t))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
                 (at start (calibration-target ?i ?t))
                 (over all (pointing ?s ?t))
                 (at start (not (calibrated ?i)))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Slew a satellite from one direction to another
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

  ;; Take an image: requires instrument supports mode, is powered and calibrated, and satellite pointing throughout capture
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration (take-image-duration))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (powered ?i))
                 (at start (calibrated ?i))
                 (over all (pointing ?s ?d))
               )
    :effect (and
              (at end (image-taken ?d ?m))
            )
  )

)