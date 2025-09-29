(define (domain orchestrator)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types
    satellite instrument direction mode
  )

  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)

    (pointing ?s - satellite ?d - direction)
    (slewing ?s - satellite)

    (power-available ?s - satellite)
    (power-claimed ?s - satellite)

    (powered ?i - instrument)
    (calibrated ?i - instrument)

    (have-image ?d - direction ?m - mode)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)
    (calibration-time ?i - instrument ?d - direction)
    (switch-on-duration)
    (switch-off-duration)
    (take-image-duration)
  )

  ;; Slew action: during slew the satellite points at no direction
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at start (slewing ?s))
              (at end (not (slewing ?s)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Switch on an instrument: claims the single satellite power feed at start, completes powering at end
  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration (switch-on-duration))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (not (power-available ?s)))
              (at start (power-claimed ?s))
              (at end (powered ?i))
            )
  )

  ;; Switch off an instrument: frees the power feed at the end
  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration (switch-off-duration))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (power-claimed ?s))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (power-available ?s))
              (at end (not (power-claimed ?s)))
            )
  )

  ;; Calibration: instrument must be powered and satellite must point at calibration target; calibration completes at end
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (calibration-time ?i ?d))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (cal-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (at start (powered ?i))
                 (at start (power-claimed ?s))
                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (power-claimed ?s))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take image: instrument must be powered and calibrated and remain so; satellite must point at target during the entire imaging
  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration (take-image-duration))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (pointing ?s ?d))
                 (at start (powered ?i))
                 (at start (calibrated ?i))
                 (at start (power-claimed ?s))

                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (power-claimed ?s))
               )
    :effect (and
              (at end (have-image ?d ?m))
            )
  )
)