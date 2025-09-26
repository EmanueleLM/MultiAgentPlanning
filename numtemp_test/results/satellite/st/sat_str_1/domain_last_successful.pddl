(define (domain satellite-imaging-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :fluents)
  (:types satellite instrument direction mode)

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (powered ?i - instrument)
    (calibrated ?i - instrument)
    (power-free ?s - satellite)
    (image-taken ?d - direction ?m - mode)
  )

  ;; Turn: satellite changes pointing. Old pointing lost at start, new pointing established at end.
  (:durative-action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (pointing ?s ?from))
               )
    :effect (and
              (at start (not (pointing ?s ?from)))
              (at end (pointing ?s ?to))
            )
  )

  ;; Switch on an instrument: claims satellite power at start, instrument becomes powered at end.
  ;; Calibration is cleared when switching on (done at start).
  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-free ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (not (power-free ?s)))
              (at start (not (calibrated ?i)))
              (at end (powered ?i))
            )
  )

  ;; Switch off an instrument: instrument is de-powered at start, power becomes available at end.
  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at start (not (powered ?i)))
              (at end (power-free ?s))
            )
  )

  ;; Calibrate an instrument: instrument must be powered throughout; satellite must be pointing at calibration target at start.
  ;; Instrument becomes calibrated at end.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (calibration-target ?i ?d))
                 (at start (pointing ?s ?d))
                 (over all (powered ?i))
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ;; Take an image: instrument must support the requested mode; instrument must be powered and calibrated and satellite must point at target throughout.
  ;; Image is obtained at end.
  (:durative-action take-image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i ?m))
                 (over all (pointing ?s ?d))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
               )
    :effect (and
              (at end (image-taken ?d ?m))
            )
  )

)