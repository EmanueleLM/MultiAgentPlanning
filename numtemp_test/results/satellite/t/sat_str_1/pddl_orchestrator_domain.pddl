(define (domain orchestrator)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents :equality)
  (:types satellite instrument mode direction)

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
  )

  (:functions
    (slew-time ?from - direction ?to - direction) ; numeric table for slew durations
    (calibration-time ?i - instrument ?d - direction) ; numeric table for calibration durations
  )

  ;; Turn / slew action: duration taken from slew-time table
  (:durative-action turn
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

  ;; Switch on instrument: occupies the satellite power feed (power-available becomes false at start)
  ;; instrument becomes powered at end of the 2 time units. Power feed remains occupied until switch_off.
  (:durative-action switch_on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2)
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

  ;; Switch off instrument: frees the satellite power feed at end of the action (1 time unit)
  (:durative-action switch_off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1)
    :condition (and
      (at start (onboard ?i ?s))
      (at start (powered ?i))
    )
    :effect (and
      (at end (not (powered ?i)))
      (at end (power-available ?s))
    )
  )

  ;; Calibrate instrument on its calibration target. Duration from calibration-time table.
  ;; Requires the instrument to be onboard and powered and the satellite to point to the calibration target throughout.
  (:durative-action calibrate
    :parameters (?s - satellite ?i - instrument ?t - direction)
    :duration (= ?duration (calibration-time ?i ?t))
    :condition (and
      (at start (onboard ?i ?s))
      (at start (cal-target ?i ?t))
      (at start (pointing ?s ?t))
      (at start (powered ?i))
      (over all (pointing ?s ?t))
      (over all (powered ?i))
    )
    :effect (and
      (at end (calibrated ?i ?t))
    )
  )

  ;; Take an image: fixed duration 7. Requires pointing, instrument powered, instrument calibrated on its calibration target,
  ;; and instrument supports the requested mode throughout the imaging interval.
  (:durative-action take_image
    :parameters (?s - satellite ?i - instrument ?t - direction ?m - mode ?ct - direction)
    :duration (= ?duration 7)
    :condition (and
      (at start (onboard ?i ?s))
      (at start (pointing ?s ?t))
      (at start (powered ?i))
      (at start (supports ?i ?m))
      (at start (cal-target ?i ?ct))
      (at start (calibrated ?i ?ct))
      (over all (pointing ?s ?t))
      (over all (powered ?i))
      (over all (calibrated ?i ?ct))
      (over all (supports ?i ?m))
    )
    :effect (and
      (at end (have-image ?t ?m))
    )
  )
)