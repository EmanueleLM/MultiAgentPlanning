(define (domain satellite-multiagent)
  (:requirements :typing :fluents :durative-actions :negative-preconditions)
  (:types
    satellite instrument mode direction - thing
    thing
  )

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (on-board ?i - instrument ?s - satellite)
    (supports-mode ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)
    (calibration-time ?i - instrument ?target - direction)
  )

  ;; Satellite action: turn from one direction to another
  (:durative-action satellite-turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              ;; During turn satellite points at no direction: remove at start and add at end
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Instrument action: switch on (claims satellite power at start, becomes powered at end, clears calibration)
  (:durative-action instrument-switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2.0)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              ;; claim power immediately
              (at start (not (power-available ?s)))
              ;; become powered at end
              (at end (powered ?i))
              ;; calibration cleared at end
              (at end (not (calibrated ?i)))
            )
  )

  ;; Instrument action: switch off (releases satellite power at end)
  (:durative-action instrument-switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1.0)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (power-available ?s))
            )
  )

  ;; Instrument action: calibrate (requires satellite pointing at calibration target at start, instrument powered throughout)
  (:durative-action instrument-calibrate
    :parameters (?i - instrument ?s - satellite ?target - direction)
    :duration (= ?duration (calibration-time ?i ?target))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (calibration-target ?i ?target))
                 (at start (pointing ?s ?target))   ; satellite must point at calibration target at start
                 (over all (powered ?i))             ; instrument must be powered throughout
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Instrument action: take an image (requires powered, calibrated, supports mode, and satellite pointing throughout)
  (:durative-action instrument-take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7.0)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (supports-mode ?i ?m))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?d))     ; satellite must point at image direction throughout
               )
    :effect (and
              (at end (have-image ?d ?m))
            )
  )

)