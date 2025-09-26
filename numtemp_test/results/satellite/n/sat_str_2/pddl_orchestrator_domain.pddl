(define (domain satellite-domain)
  (:requirements :typing :fluents :negative-preconditions :equality)
  (:types satellite instrument mode direction)

  (:predicates
    (satellite ?s - satellite)
    (instrument ?i - instrument)
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (pointing ?s - satellite ?d - direction)
    (power-avail ?s - satellite)
    (instrument-on ?i - instrument)
    (calibrated ?i - instrument)
    (have-image ?d - direction ?m - mode)
  )

  (:functions
    (fuel ?s - satellite)          ; remaining fuel for each satellite
    (data-capacity ?s - satellite) ; remaining data capacity per satellite
    (data-stored)                  ; global accumulated data stored
    (fuel-used)                    ; global accumulated fuel used (objective)
    (slewtime ?from - direction ?to - direction) ; numeric slew time / fuel cost table
    (data-size ?d - direction ?m - mode)        ; data size per direction-mode
  )

  ;; Turn / slew action: consumes per-satellite fuel equal to slewtime(from,to) and increases global fuel-used
  (:action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and
                    (pointing ?s ?from)
                    (>= (fuel ?s) (slewtime ?from ?to))
                  )
    :effect (and
              (not (pointing ?s ?from))
              (pointing ?s ?to)
              (decrease (fuel ?s) (slewtime ?from ?to))
              (increase (fuel-used) (slewtime ?from ?to))
            )
  )

  ;; Switch instrument on (requires satellite power available)
  (:action switch_on
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
                    (onboard ?i ?s)
                    (power-avail ?s)
                    (not (instrument-on ?i))
                  )
    :effect (instrument-on ?i)
  )

  ;; Switch instrument off (clears calibration)
  (:action switch_off
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
                    (onboard ?i ?s)
                    (instrument-on ?i)
                  )
    :effect (and
              (not (instrument-on ?i))
              (not (calibrated ?i))
            )
  )

  ;; Calibrate instrument: requires instrument on and pointing at its calibration target
  (:action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :precondition (and
                    (onboard ?i ?s)
                    (instrument-on ?i)
                    (pointing ?s ?d)
                    (calibration-target ?i ?d)
                  )
    :effect (calibrated ?i)
  )

  ;; Take an image: requires instrument onboard, supports mode, instrument on and calibrated, satellite pointing,
  ;; and sufficient remaining data capacity. Produces have-image, increases global data_stored and decreases per-sat capacity.
  (:action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and
                    (onboard ?i ?s)
                    (supports ?i ?m)
                    (instrument-on ?i)
                    (calibrated ?i)
                    (pointing ?s ?d)
                    (not (have-image ?d ?m))
                    (>= (data-capacity ?s) (data-size ?d ?m))
                  )
    :effect (and
              (have-image ?d ?m)
              (decrease (data-capacity ?s) (data-size ?d ?m))
              (increase (data-stored) (data-size ?d ?m))
            )
  )
)