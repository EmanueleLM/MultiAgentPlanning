(define (domain satellite-orchestrator)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :equality :conditional-effects)
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

  ;; Slew: during the turn the satellite should not be considered pointing at any direction.
  ;; Make the satellite busy for the whole duration so no other action requiring non-busy can start.
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
      (at start (busy ?s))
      ;; remove the old pointing immediately so any action that requires continuous pointing will not be allowed during the slew
      (at start (not (pointing ?s ?from)))
      (at end (pointing ?s ?to))
      (at end (not (busy ?s)))
    )
  )

  ;; Switching on: power is required to be available at start, but per spec the power feed is claimed when the switch completes.
  ;; So consume power-available at the end of the switching-on action (not at start).
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
      (at start (busy ?s))
      (at end (powered ?i))
      (at end (not (calibrated ?i)))
      (at end (not (busy ?s)))
      ;; claim the satellite power feed at end
      (at end (not (power-available ?s)))
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
      (at start (busy ?s))
      (at end (not (powered ?i)))
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
      ;; must remain pointing and powered for the whole calibration
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
      ;; must remain pointing, powered, and calibrated for the whole image duration
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