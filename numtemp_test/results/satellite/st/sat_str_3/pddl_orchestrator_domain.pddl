(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types satellite instrument direction mode)

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calib-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (power-busy ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (image-taken ?m - mode ?d - direction)
  )

  (:functions
    (count-mode ?m - mode)
  )

  ;; Switch on: claims satellite power at start, makes instrument powered at end
  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (power-busy ?s)))
               )
    :effect (and
              (at start (power-busy ?s))
              (at end (powered ?i))
            )
  )

  ;; Switch off: instrument becomes not powered at start (instantaneous off at start), frees satellite power at end
  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at start (not (powered ?i)))
              (at end (not (power-busy ?s)))
            )
  )

  ;; Turn: frees previous pointing at start, sets new pointing at end; cannot turn to same direction
  (:durative-action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (pointing ?s ?from))
                 (at start (not (= ?from ?to)))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Calibrate: requires instrument powered for entire action (over all) and satellite pointing at calibration target at start
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?target - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (calib-target ?i ?target))
                 (at start (pointing ?s ?target))
                 (over all (powered ?i))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take image: requires instrument powered and calibrated for entire action and satellite pointing at target for entire action.
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?target - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (supports ?i ?m))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?target))
               )
    :effect (and
              (at end (image-taken ?m ?target))
              (at end (increase (count-mode ?m) 1))
            )
  )

)