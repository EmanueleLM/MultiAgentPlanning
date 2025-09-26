(define (domain satellite-multiagent)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (satellite ?s)
    (instrument ?i)
    (host ?i ?s)               ; instrument hosted by satellite
    (direction ?d)
    (mode ?m)
    (supports ?i ?m)
    (cal_target ?i ?d)         ; calibration target direction for instrument
    (pointing ?s ?d)           ; satellite pointing
    (power_available ?s)       ; satellite has power to turn an instrument on
    (instrument_on ?i)         ; instrument is switched on
    (calibrated ?i)            ; instrument has been calibrated since last switch_on
    (have_image ?d ?m)         ; image of direction in mode has been taken
  )

  ;; turn: slewing a satellite to a different direction (cannot turn to same)
  (:action turn
    :parameters (?s ?from ?to)
    :precondition (and
      (satellite ?s)
      (pointing ?s ?from)
      (direction ?to)
      (not (pointing ?s ?to))
    )
    :effect (and
      (not (pointing ?s ?from))
      (pointing ?s ?to)
    )
  )

  ;; switch_on: uses the single-power resource on the satellite; clears calibration
  (:action switch_on
    :parameters (?s ?i)
    :precondition (and
      (satellite ?s)
      (instrument ?i)
      (host ?i ?s)
      (power_available ?s)
      (not (instrument_on ?i))
    )
    :effect (and
      (instrument_on ?i)
      (not (power_available ?s))
      (not (calibrated ?i))   ; switching on clears calibration; requires re-calibration
    )
  )

  ;; switch_off: frees the single-power resource
  (:action switch_off
    :parameters (?s ?i)
    :precondition (and
      (satellite ?s)
      (instrument ?i)
      (host ?i ?s)
      (instrument_on ?i)
    )
    :effect (and
      (not (instrument_on ?i))
      (power_available ?s)
    )
  )

  ;; calibrate: requires instrument on and satellite pointing at instrument's calibration target
  (:action calibrate
    :parameters (?s ?i ?t)
    :precondition (and
      (satellite ?s)
      (instrument ?i)
      (host ?i ?s)
      (instrument_on ?i)
      (pointing ?s ?t)
      (cal_target ?i ?t)
    )
    :effect (calibrated ?i)
  )

  ;; take_image: requires satellite pointing at target, instrument on, instrument calibrated, and instrument supports the mode
  (:action take_image
    :parameters (?s ?i ?d ?m)
    :precondition (and
      (satellite ?s)
      (instrument ?i)
      (host ?i ?s)
      (instrument_on ?i)
      (calibrated ?i)
      (pointing ?s ?d)
      (supports ?i ?m)
      (mode ?m)
      (direction ?d)
    )
    :effect (have_image ?d ?m)
  )
)