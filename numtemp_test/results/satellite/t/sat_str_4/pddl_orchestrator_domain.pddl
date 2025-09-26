(define (domain spacecraft-scheduling)
  (:requirements :strips :typing :durative-actions :negative-preconditions :equality :fluents :numeric-fluents :timed-initial-literals :action-costs)
  (:types satellite instrument direction mode)

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (power-free ?s - satellite)            ; true when the satellite's power feed is free
    (powered ?i - instrument)              ; instrument currently powered
    (calibrated ?i - instrument)           ; instrument is calibrated
    (supports ?i - instrument ?m - mode)   ; static: instrument supports mode
    (instrument-of ?i - instrument ?s - satellite) ; static
    (taken ?d - direction ?m - mode)       ; an image in mode m taken of direction d
  )

  (:functions
    (slew_time ?from - direction ?to - direction) ; numeric table
    (cal_time ?i - instrument ?t - direction)     ; calibration durations
  )

  ;; Switch on: claims satellite power immediately at start, powers instrument at end and clears calibration
  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (instrument-of ?i ?s))
                 (at start (power-free ?s))
                )
    :effect (and
              (at start (not (power-free ?s)))   ; claim power immediately
              (at end (powered ?i))
              (at end (not (calibrated ?i)))     ; powering clears calibration
             )
  )

  ;; Switch off: instrument becomes off at start, power feed released at end
  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (instrument-of ?i ?s))
                 (at start (powered ?i))
                )
    :effect (and
              (at start (not (powered ?i)))     ; instrument off at start
              (at end (power-free ?s))          ; release power at end
             )
  )

  ;; Calibrate: instrument must be powered and satellite must be pointing at the calibration target at start. Duration given by cal_time.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (cal_time ?i ?t))
    :condition (and
                 (at start (instrument-of ?i ?s))
                 (at start (powered ?i))
                 (at start (pointing ?s ?t))
                )
    :effect (and
              (at end (calibrated ?i))
             )
  )

  ;; Slew: satellite moves from one direction to another. While slewing it points nowhere (we remove old pointing at start and add new pointing at end).
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew_time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= ?from ?to)))
                )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
             )
  )

  ;; Take image: requires powered and calibrated instrument, instrument supports mode, and satellite pointing at target for whole duration
  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (instrument-of ?i ?s))
                 (at start (powered ?i))
                 (at start (calibrated ?i))
                 (at start (supports ?i ?m))
                 (over all (pointing ?s ?d))
                )
    :effect (and
              (at end (taken ?d ?m))
             )
  )

)