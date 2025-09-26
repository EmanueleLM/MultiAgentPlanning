(define (domain satellite-orchestrator)
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types satellite instrument direction mode)

  (:predicates
    (on-board ?i - instrument ?s - satellite)        ; static
    (supports ?i - instrument ?m - mode)            ; static
    (cal-target ?i - instrument ?d - direction)     ; static
    (pointing ?s - satellite ?d - direction)        ; dynamic
    (instrument_powered ?i - instrument)            ; dynamic
    (calibrated ?i - instrument)                    ; dynamic
    (power-available ?s - satellite)                ; dynamic, one feed per satellite
    (have_image ?d - direction ?m - mode)           ; goal fluent
  )

  (:functions
    (slew-time ?from - direction ?to - direction)  ; numeric symmetric times
    (calibration-time ?i - instrument ?d - direction) ; numeric
  )

  ;; Slew / turn action: satellite turns from ?from to ?to, during which it points to no direction.
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= ?from ?to)))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Switch an instrument on: duration 2. Claims satellite power at start, instrument powered at end, clears calibration at start.
  (:durative-action switch_on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2)
    :condition (and
                 (at start (power-available ?s))
                 (at start (on-board ?i ?s))
               )
    :effect (and
              (at start (not (power-available ?s)))
              (at start (not (calibrated ?i)))
              (at end (instrument_powered ?i))
            )
  )

  ;; Switch an instrument off: duration 1. Instrument must be powered at start, becomes off immediately at start, satellite power available at end.
  (:durative-action switch_off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1)
    :condition (and
                 (at start (instrument_powered ?i))
                 (at start (on-board ?i ?s))
               )
    :effect (and
              (at start (not (instrument_powered ?i)))
              (at end (power-available ?s))
            )
  )

  ;; Calibrate an instrument: duration given by calibration-time(inst,target). Requires satellite pointing at target at start and instrument powered throughout. Calibrated at end.
  (:durative-action calibrate
    :parameters (?s - satellite ?i - instrument ?target - direction)
    :duration (= ?duration (calibration-time ?i ?target))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (pointing ?s ?target))
                 (at start (instrument_powered ?i))
                 (over all (instrument_powered ?i))
                 (at start (cal-target ?i ?target))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take image: duration 7. Requires instrument powered & calibrated and satellite pointing at target throughout. Produces have_image(direction,mode) at end.
  (:durative-action take_image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (instrument_powered ?i))
                 (at start (calibrated ?i))
                 (at start (pointing ?s ?d))
                 (over all (instrument_powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?d))
               )
    :effect (and
              (at end (have_image ?d ?m))
            )
  )

)