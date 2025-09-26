(define (domain satellite-orchestrator)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :equality)
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
    (in-use ?i - instrument)
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
      (at start (not (in-use ?i)))
    )
    :effect (and
      (at start (not (power-available ?s)))
      (at start (busy ?s))
      (at end (powered ?i))
      (at end (not (busy ?s)))
      (at start (not (calibrated ?i))) ; switching on clears calibration at start per spec
    )
  )

  (:durative-action switch_off
    :parameters (?s - satellite ?i - instrument)
    :duration (= ?duration 1)
    :condition (and
      (at start (onboard ?i ?s))
      (at start (powered ?i))
      (at start (not (busy ?s)))
      (at start (not (in-use ?i)))
    )
    :effect (and
      (at start (not (powered ?i)))
      (at start (not (calibrated ?i)))
      (at start (busy ?s))
      (at end (power-available ?s))
      (at end (not (busy ?s)))
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
      (at start (not (in-use ?i)))
      (over all (pointing ?s ?t))
      (over all (powered ?i))
    )
    :effect (and
      (at start (busy ?s))
      (at start (in-use ?i))
      (at end (calibrated ?i))
      (at end (not (in-use ?i)))
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
      (at start (not (in-use ?i)))
      (over all (pointing ?s ?t))
      (over all (powered ?i))
      (over all (supports ?i ?m))
      (over all (calibrated ?i))
    )
    :effect (and
      (at start (busy ?s))
      (at start (in-use ?i))
      (at end (have-image ?t ?m))
      (at end (not (in-use ?i)))
      (at end (not (busy ?s)))
    )
  )
)