(define (domain multi-sat-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :equality :numeric-fluents :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    satellite instrument mode direction object
  )

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (onboard ?i - instrument ?s - satellite)
    (power-available ?s - satellite)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (have_image ?d - direction ?m - mode)
    (using ?i - instrument)
  )

  (:functions
    (slew-time ?from - direction ?to - direction)  ; lookup table from problem
    (cal-time ?i - instrument ?d - direction)      ; calibration times per instrument->target
    (total-time)                                   ; objective to minimize
    (num-images ?m - mode)                         ; numeric counts per mode
  )

  ;; Slew: satellite slews from one direction to another. During slew the satellite points to no direction.
  (:durative-action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration (slew-time ?from ?to))
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))      ; no pointing during slew
              (at end (pointing ?s ?to))
              (at end (increase (total-time) (slew-time ?from ?to)))
            )
  )

  ;; Switch-on: occupies the satellite power feed at start, becomes powered at end, clears calibration at start.
  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-available ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (not (calibrated ?i)))        ; clears calibration at start
              (at start (not (power-available ?s)))  ; occupy power feed during switching and thereafter
              (at end (powered ?i))
              (at end (increase (total-time) 2))
            )
  )

  ;; Switch-off: instrument is switched off immediately at start; power becomes available at end.
  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at start (not (powered ?i)))          ; switched off immediately at start
              (at end (power-available ?s))          ; power feed freed at end
              (at end (increase (total-time) 1))
            )
  )

  ;; Calibrate: instrument must be powered and the satellite pointing at instrument's calibration target.
  ;; Requires pointing to hold throughout calibration.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration (cal-time ?i ?d))
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
                 (over all (pointing ?s ?d))
                 (at start (pointing ?s ?d))
                 (at start (calibration-target ?i ?d))
                 (at start (not (calibrated ?i)))
               )
    :effect (and
              (at end (calibrated ?i))
              (at end (increase (total-time) (cal-time ?i ?d)))
            )
  )

  ;; Take image: fixed duration 7. Requires instrument powered, calibrated, supports the requested mode.
  ;; Requires pointing and power and calibration to hold throughout. Prevent concurrent use of same instrument with 'using' predicate.
  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (not (using ?i)))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?d))
                 (at start (supports ?i ?m))
               )
    :effect (and
              (at start (using ?i))
              (at end (not (using ?i)))
              (at end (have_image ?d ?m))
              (at end (increase (num-images ?m) 1))
              (at end (increase (total-time) 7))
            )
  )
)