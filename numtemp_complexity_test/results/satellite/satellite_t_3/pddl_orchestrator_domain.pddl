(define (domain multi-satellite-temporal)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :negative-preconditions :timed-initial-literals :constraints :action-costs)
  (:types
    instrument satellite direction mode - thing
    thing
  )

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)

    (pointing ?s - satellite ?d - direction)         ; satellite is pointed at a direction
    (slewing ?s - satellite)                         ; satellite is currently slewing
    (powered ?i - instrument)                        ; instrument is currently powered on
    (calibrated ?i - instrument)                     ; instrument has been calibrated since last switch-on
    (observed ?d - direction ?m - mode)              ; goal achieved: observed direction in mode
  )

  (:functions
    (slew-time ?from - direction ?to - direction)    ; numeric lookup table for slew durations
    (calibration-time ?i - instrument ?d - direction) ; numeric lookup table for calibration durations
    (power-free ?s - satellite)                      ; 1 if satellite power-feed is free, 0 otherwise
  )

  ; Slew action: change pointing from one direction to another, satellite slews in-between
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at start (slewing ?s))
              (at end (not (slewing ?s)))
              (at end (pointing ?s ?to))
            )
  )

  ; Switch on an instrument: consumes satellite power-feed at start, clears calibration, instrument becomes powered at end
  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (not (powered ?i)))
                 (at start (>= (power-free ?s) 1))
               )
    :effect (and
              (at start (assign (power-free ?s) 0))
              (at start (not (calibrated ?i)))    ; calibration cleared on switch-on (immediate)
              (at end (powered ?i))
            )
  )

  ; Switch off an instrument: instrument becomes unpowered at end and releases satellite power-feed
  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (on-board ?i ?s))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (assign (power-free ?s) 1))
            )
  )

  ; Calibrate an instrument: requires instrument powered and satellite to be continuously pointing at instrument's calibration target
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?t - direction)
    :duration (= ?duration (calibration-time ?i ?t))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
                 (at start (cal-target ?i ?t))
                 (over all (pointing ?s ?t))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ; Take an image / observation: instrument must support the mode, be powered and calibrated, and satellite must point continuously to target
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?t - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
                 (at start (supports ?i ?m))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?t))
               )
    :effect (and
              (at end (observed ?t ?m))
            )
  )

  ; Metric: minimize makespan / total time
  (:metric minimize (total-time))
)