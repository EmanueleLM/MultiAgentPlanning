(define (domain satellite-orchestrator)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents :equality)
  (:types satellite instrument mode direction)

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (have-image ?d - direction ?m - mode)
    (busy ?s - satellite)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)
    (calibration-time ?i - instrument ?d - direction)
  )

  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
      (at start (pointing ?s ?from))
      (at start (not (busy ?s)))
      (at start (not (= ?from ?to)))
      (at start (> (slew-time ?from ?to) 0))
    )
    :effect (and
      (at start (not (pointing ?s ?from)))
      (at start (busy ?s))
      (at end (pointing ?s ?to))
      (at end (not (busy ?s)))
    )
  )

  (:durative-action switch_on
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 2)
    :condition (and
      (at start (onboard ?i ?s))
      (at start (power-available ?s))
      (at start (not (powered ?i)))
      (at start (not (busy ?s)))
    )
    :effect (and
      ;; claims satellite power immediately and becomes busy
      (at start (not (power-available ?s)))
      (at start (busy ?s))
      ;; powering clears previous calibration at start per spec
      (at start (not (calibrated ?i)))
      ;; instrument becomes powered at end of the action
      (at end (powered ?i))
      (at end (not (busy ?s)))
    )
  )

  (:durative-action switch_off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1)
    :condition (and
      (at start (onboard ?i ?s))
      (at start (powered ?i))
      (at start (not (busy ?s)))
    )
    :effect (and
      ;; instrument becomes off immediately at action start (becomes non-powered)
      (at start (not (powered ?i)))
      (at start (busy ?s))
      ;; power feed released at end of action
      (at end (power-available ?s))
      (at end (not (busy ?s)))
      ;; calibration state invalidated when instrument is turned off
      (at end (not (calibrated ?i)))
    )
  )

  (:durative-action calibrate
    :parameters (?s - satellite ?i - instrument ?t - direction)
    :duration (= ?duration (calibration-time ?i ?t))
    :condition (and
      (at start (onboard ?i ?s))
      (at start (cal-target ?i ?t))
      (at start (pointing ?s ?t))
      (at start (powered ?i))
      (at start (not (busy ?s)))
      (over all (pointing ?s ?t))
      (over all (powered ?i))
    )
    :effect (and
      (at start (busy ?s))
      (at end (calibrated ?i))
      (at end (not (busy ?s)))
    )
  )

  (:durative-action take_image
    :parameters (?s - satellite ?i - instrument ?t - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
      (at start (onboard ?i ?s))
      (at start (pointing ?s ?t))
      (at start (powered ?i))
      (at start (supports ?i ?m))
      (at start (calibrated ?i))
      (at start (not (busy ?s)))
      (over all (pointing ?s ?t))
      (over all (powered ?i))
      (over all (supports ?i ?m))
      (over all (calibrated ?i))
    )
    :effect (and
      (at start (busy ?s))
      (at end (have-image ?t ?m))
      (at end (not (busy ?s)))
    )
  )
)