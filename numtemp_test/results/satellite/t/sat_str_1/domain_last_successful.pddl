(define (domain multi-sat-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :universal-preconditions :numeric-fluents :equality :quantified-preconditions :conditional-effects)
  (:types
    satellite instrument mode direction
  )

  (:predicates
    (on-board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (have_image ?d - direction ?m - mode)
  )

  (:functions
    (slewtime ?from - direction ?to - direction) ; numeric durations for slews
    (calibtime ?i - instrument ?d - direction)   ; numeric durations for calibrations
  )

  ;; Slew action: during the slew the satellite does not point anywhere.
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slewtime ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Switch on instrument. Enforce single-power-feed per satellite via universal condition over all instruments on that satellite.
  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (power-available ?s))
                 (at start (forall (?other - instrument)
                             (imply (and (on-board ?other ?s) (not (= ?other ?i)))
                                    (not (powered ?other)))))
               )
    :effect (and
              (at end (powered ?i))
            )
  )

  ;; Switch off instrument
  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at end (not (powered ?i)))
            )
  )

  ;; Calibrate instrument on its calibration target. Calibration requires instrument powered and the satellite pointing at the calibration direction for the whole calibration.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (calibtime ?i ?d))
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (calibration-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (at start (powered ?i))
                 (at start (not (calibrated ?i)))
                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take an image using an instrument in a supported mode. Requires instrument powered, calibrated and satellite pointing to target throughout.
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (on-board ?i ?s))
                 (at start (supports ?i ?m))
                 (at start (pointing ?s ?d))
                 (at start (powered ?i))
                 (at start (calibrated ?i))
                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
               )
    :effect (and
              (at end (have_image ?d ?m))
            )
  )
)