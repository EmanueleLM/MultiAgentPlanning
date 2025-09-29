(define (domain satellite-orchestration)
  (:requirements :typing :durative-actions :negative-preconditions :equality :fluents)
  (:types
    satellite instrument mode direction
  )

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)               ; satellite is pointing at direction
    (instrument-powered ?i - instrument)                   ; instrument has claimed power and is powered
    (calibrated ?i - instrument)
    (power-available ?s - satellite)                       ; satellite's single power feed free
    (have_image ?d - direction ?m - mode)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)  ; numeric slew time between directions
    (calibration-time ?i - instrument ?d - direction) ; numeric calibration time
  )

  ;; Actions are kept distinct and clearly named for satellite/instrument roles.

  ;; Slew action for satellites: removes pointing at start and establishes new pointing at end.
  (:durative-action slew-satellite
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))  ; during slewing satellite points at no direction
              (at end (pointing ?s ?to))
            )
  )

  ;; Turn on an instrument: claims power at start, finishes powering instrument at end, clears calibration.
  (:durative-action turn-on-instrument
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (instrument-powered ?i)))
               )
    :effect (and
              (at start (not (power-available ?s)))     ; claims power at start
              (at end (instrument-powered ?i))          ; becomes powered at end
              (at end (not (calibrated ?i)))            ; clears calibration at end
            )
  )

  ;; Turn off an instrument: releases power at end.
  (:durative-action turn-off-instrument
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
               )
    :effect (and
              (at end (not (instrument-powered ?i)))
              (at end (power-available ?s))            ; releases power at end
            )
  )

  ;; Calibrate an instrument against its fixed target. Instrument must be powered throughout and satellite
  ;; must be pointing at the target at start (as required).
  (:durative-action calibrate-instrument
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (calibration-time ?i ?d))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (pointing ?s ?d))             ; satellite pointing at d at start
                 (at start (calibration-target ?i ?d))
                 (over all (instrument-powered ?i))       ; instrument must be powered throughout
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take an image: requires instrument powered, calibrated, supporting the mode, and satellite pointing at target throughout.
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (instrument-powered ?i))
                 (at start (calibrated ?i))
                 (at start (supports ?i ?m))
                 (over all (instrument-powered ?i))       ; powered throughout
                 (over all (pointing ?s ?d))             ; pointing throughout
               )
    :effect (and
              (at end (have_image ?d ?m))
            )
  )
)