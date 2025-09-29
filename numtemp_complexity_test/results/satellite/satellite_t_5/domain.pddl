(define (domain multi-sat-temporal)
  (:requirements :strips :typing :durative-actions :negative-preconditions :equality :numeric-fluents :conditional-effects)
  (:types
    satellite instrument mode direction - object
    object
  )

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (onboard ?i - instrument ?s - satellite)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
    (using ?i - instrument)
    (slewing ?s - satellite)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)
    (cal-time ?i - instrument ?d - direction)
    (total-time)
    (num-images ?m - mode)
  )

  ;; Slew action: enforce non-zero positive duration, require exclusive pointing and not already slewing
  (:durative-action slew
    :parameters (?s - satellite ?prev - direction ?new - direction)
    :duration (= ?duration (slew-time ?prev ?new))
    :condition (and
                 (at start (pointing ?s ?prev))
                 (at start (not (= ?prev ?new)))
                 (at start (not (slewing ?s)))
                 (at start (> (slew-time ?prev ?new) 0.0))
               )
    :effect (and
              (at start (not (pointing ?s ?prev)))
              (at start (slewing ?s))
              (at end (not (slewing ?s)))
              (at end (pointing ?s ?new))
              (at end (increase (total-time) (slew-time ?prev ?new)))
            )
  )

  ;; Switching on an instrument: must be onboard that satellite, satellite not slewing, power available, and instrument not powered.
  ;; Claim power at start, clear calibrated at start, become powered at end.
  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (powered ?i)))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at start (not (calibrated ?i)))
              (at start (not (power-available ?s)))
              (at end (powered ?i))
              (at end (increase (total-time) 2))
            )
  )

  ;; Switching off: must be onboard, currently powered, and satellite not slewing. Releases power at end.
  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (not (slewing ?s)))
               )
    :effect (and
              (at end (not (powered ?i)))
              (at end (power-available ?s))
              (at end (increase (total-time) 1))
            )
  )

  ;; Calibration: instrument must be onboard, powered throughout, satellite must point at the instrument's declared calibration target at start and during calibration,
  ;; instrument must not already be calibrated. The calibration-target fact ties each instrument to its unique direction, preventing calibrating at other directions.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (cal-time ?i ?d))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (at start (calibration-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (at start (not (slewing ?s)))
                 (at start (not (calibrated ?i)))
                 (over all (pointing ?s ?d))
                 (over all (not (slewing ?s)))
                 (over all (powered ?i))
               )
    :effect (and
              (at end (calibrated ?i))
              (at end (increase (total-time) (cal-time ?i ?d)))
            )
  )

  ;; Taking an image: instrument must be onboard, supporting the requested mode, powered and calibrated throughout,
  ;; satellite must point continuously at the target direction and not slew during exposure.
  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (not (using ?i)))
                 (at start (supports ?i ?m))
                 (at start (pointing ?s ?d))
                 (at start (powered ?i))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?d))
                 (over all (not (slewing ?s)))
               )
    :effect (and
              (at start (using ?i))
              (at end (not (using ?i)))
              (at end (have-image ?d ?m))
              (at end (increase (num-images ?m) 1))
              (at end (increase (total-time) 7))
            )
  )
)