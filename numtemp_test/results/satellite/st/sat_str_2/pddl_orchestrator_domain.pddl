(define (domain satellite-domain)
  (:requirements :typing :durative-actions :negative-preconditions :equality :strips)
  (:types satellite instrument mode direction)

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (have-image ?m - mode ?d - direction)
  )

  ;; Turning between directions: takes 5 time units.
  ;; At start satellite must be pointing at the from direction; during turn it is not pointing anywhere.
  (:durative-action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= ?from ?to))))
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to)))
  )

  ;; Switch an instrument on: takes 2 time units.
  ;; Power feed is claimed at start and instrument becomes powered at end.
  ;; Instrument calibration is cleared when switching on.
  (:durative-action switch-on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2)
    :condition (and
                 (at start (power-available ?s))
                 (at start (onboard ?i ?s))
                 (at start (not (powered ?i))))
    :effect (and
              (at start (not (power-available ?s)))
              (at end (powered ?i))
              (at end (not (calibrated ?i))))
  )

  ;; Switch an instrument off: takes 1 time unit.
  ;; Instrument is turned off at start and power becomes available at end.
  (:durative-action switch-off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i)))
    :effect (and
              (at start (not (powered ?i)))
              (at end (power-available ?s)))
  )

  ;; Calibrate an instrument: takes 5 time units.
  ;; Instrument must be powered throughout and satellite must be pointing at calibration target at start.
  ;; Instrument becomes calibrated at end.
  (:durative-action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (cal-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (over all (powered ?i)))
    :effect (and
              (at end (calibrated ?i)))
  )

  ;; Take an image: takes 7 time units.
  ;; Instrument must be powered and calibrated and satellite must point at target throughout.
  ;; Image obtained at end.
  (:durative-action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (calibrated ?i)))
    :effect (and
              (at end (have-image ?m ?d)))
  )
)