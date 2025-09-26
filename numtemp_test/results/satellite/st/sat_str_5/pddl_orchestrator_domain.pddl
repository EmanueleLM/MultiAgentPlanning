(define (domain multi-sat-observations)
  (:requirements :typing :durative-actions :negative-preconditions :fluents)
  (:types satellite instrument mode direction)

  (:predicates
    ;; static relations
    (on ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)

    ;; dynamic state
    (pointing ?s - satellite ?d - direction)        ;; satellite currently pointing at direction
    (pointing-none ?s - satellite)                  ;; satellite is between pointings (during turn)
    (powered ?i - instrument)                       ;; instrument currently powered
    (calibrated ?i - instrument)                    ;; instrument has been calibrated
    (power-free ?s - satellite)                     ;; satellite's power feed is free (no instrument currently using it)
    (using ?s - satellite ?i - instrument)          ;; satellite s is currently allocating power to instrument i
    (observed ?d - direction ?m - mode)             ;; an observation of direction d in mode m has been completed
  )

  ;; Durations are encoded as numeric equalities in each action per provided durations.
  ;; Turn: during turn satellite points nowhere (pointing-none true), start removes previous pointing, end sets new pointing.
  (:durative-action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :duration (= ?duration 5)
    :condition (and
                (at start (pointing ?s ?from))
                (over all (pointing-none ?s)) )
    :effect (and
             (at start (not (pointing ?s ?from)))
             (at start (pointing-none ?s))
             (at end (not (pointing-none ?s)))
             (at end (pointing ?s ?to)) )
  )

  ;; Switch on claims the satellite power feed at start (so no other instrument on that satellite can be switched on),
  ;; and the instrument becomes powered at end of the switching action.
  (:durative-action switch_on
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 2)
    :condition (and
                (at start (on ?i ?s))
                (at start (power-free ?s))
                (at start (not (powered ?i))) )
    :effect (and
             (at start (not (power-free ?s)))
             (at start (using ?s ?i))
             (at end (powered ?i)) )
  )

  ;; Switch off releases the power feed at the end of the action.
  (:durative-action switch_off
    :parameters (?i - instrument ?s - satellite)
    :duration (= ?duration 1)
    :condition (and
                (at start (on ?i ?s))
                (at start (powered ?i))
                (at start (using ?s ?i)) )
    :effect (and
             (at end (not (powered ?i)))
             (at end (not (using ?s ?i)))
             (at end (power-free ?s)) )
  )

  ;; Calibrate requires the satellite to be pointing at the instrument's calibration target and the instrument must remain powered during the calibration interval.
  (:durative-action calibrate
    :parameters (?i - instrument ?s - satellite ?d - direction)
    :duration (= ?duration 5)
    :condition (and
                (at start (on ?i ?s))
                (at start (powered ?i))
                (at start (calibration-target ?i ?d))
                (at start (pointing ?s ?d))
                (over all (powered ?i))
                (over all (pointing ?s ?d)) )
    :effect (and
             (at end (calibrated ?i)) )
  )

  ;; Take image requires instrument powered, calibrated, and supporting the requested mode.
  ;; The satellite must be continuously pointing at the target direction for the full imaging duration.
  (:durative-action take_image
    :parameters (?i - instrument ?s - satellite ?d - direction ?m - mode)
    :duration (= ?duration 7)
    :condition (and
                (at start (on ?i ?s))
                (at start (powered ?i))
                (at start (calibrated ?i))
                (at start (supports ?i ?m))
                (at start (pointing ?s ?d))
                (over all (powered ?i))
                (over all (pointing ?s ?d)) )
    :effect (and
             (at end (observed ?d ?m)) )
  )
)