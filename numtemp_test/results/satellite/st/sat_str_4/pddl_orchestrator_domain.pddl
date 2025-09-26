(define (domain multi-satellite-temporal)
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :numeric-fluents :equality :conditional-effects)
  (:types satellite instrument direction mode)

  (:predicates
    (onboard ?inst - instrument ?sat - satellite)
    (supports ?inst - instrument ?m - mode)
    (calibration-target ?inst - instrument ?dir - direction)
    (pointing ?sat - satellite ?dir - direction)
    (power-free ?sat - satellite)
    (powered ?inst - instrument)
    (calibrated ?inst - instrument)
    (has-image ?dir - direction ?m - mode)
  )

  (:functions
    (count_image1) ; number of images taken in mode image1
    (count_image2) ; number of images taken in mode image2
    (count_thermograph0)
    (count_thermograph3)
    (count_thermograph4)
  )

  ; TURN: satellite rotates from one direction to another.
  ; During turn the satellite is unpointed (so pointing predicate removed at start and set at end).
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

  ; SWITCH-ON: claims satellite power feed at start, instrument becomes powered at end.
  (:durative-action switch-on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (power-free ?s))
                 (at start (not (powered ?i)))
               )
    :effect (and
              (at start (not (power-free ?s))) ; claim power at start
              (at end (powered ?i))            ; instrument powered at end
            )
  )

  ; SWITCH-OFF: begin while instrument is powered; instrument becomes unpowered at start of this action,
  ; and the satellite power feed is freed at the end.
  (:durative-action switch-off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (powered ?i))
               )
    :effect (and
              (at start (not (powered ?i))) ; instrument unpowered during the interval
              (at end (power-free ?s))      ; power feed freed at the end
            )
  )

  ; CALIBRATE: requires instrument powered throughout and satellite pointing at calibration target at start.
  ; instrument becomes calibrated at end.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?target - direction)
    :duration (= ?duration 5)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (calibration-target ?i ?target))
                 (at start (pointing ?s ?target))
                 (at start (powered ?i))
                 (over all (powered ?i)) ; must remain powered throughout
               )
    :effect (and
              (at end (calibrated ?i))
            )
  )

  ; TAKE-IMAGE for image1 mode
  (:durative-action take-image-image1
    :parameters (?i - instrument ?s - satellite ?dir - direction)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i image1))
                 (at start (pointing ?s ?dir))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?dir))
               )
    :effect (and
              (at end (has-image ?dir image1))
              (at end (increase (count_image1) 1))
            )
  )

  ; TAKE-IMAGE for image2 mode
  (:durative-action take-image-image2
    :parameters (?i - instrument ?s - satellite ?dir - direction)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i image2))
                 (at start (pointing ?s ?dir))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?dir))
               )
    :effect (and
              (at end (has-image ?dir image2))
              (at end (increase (count_image2) 1))
            )
  )

  ; TAKE-IMAGE for thermograph0 mode
  (:durative-action take-image-thermograph0
    :parameters (?i - instrument ?s - satellite ?dir - direction)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i thermograph0))
                 (at start (pointing ?s ?dir))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?dir))
               )
    :effect (and
              (at end (has-image ?dir thermograph0))
              (at end (increase (count_thermograph0) 1))
            )
  )

  ; TAKE-IMAGE for thermograph3 mode
  (:durative-action take-image-thermograph3
    :parameters (?i - instrument ?s - satellite ?dir - direction)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i thermograph3))
                 (at start (pointing ?s ?dir))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?dir))
               )
    :effect (and
              (at end (has-image ?dir thermograph3))
              (at end (increase (count_thermograph3) 1))
            )
  )

  ; TAKE-IMAGE for thermograph4 mode
  (:durative-action take-image-thermograph4
    :parameters (?i - instrument ?s - satellite ?dir - direction)
    :duration (= ?duration 7)
    :condition (and
                 (at start (onboard ?i ?s))
                 (at start (supports ?i thermograph4))
                 (at start (pointing ?s ?dir))
                 (over all (powered ?i))
                 (over all (calibrated ?i))
                 (over all (pointing ?s ?dir))
               )
    :effect (and
              (at end (has-image ?dir thermograph4))
              (at end (increase (count_thermograph4) 1))
            )
  )

)