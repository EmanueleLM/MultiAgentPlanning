(define (domain satellite-multiagent)
  (:requirements :strips :typing :fluents :negative-preconditions :numeric-fluents)
  (:types satellite instrument direction mode)

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (power-on ?i - instrument)
    (calibrated ?i - instrument)
    (instrument-onboard ?i - instrument ?s - satellite)
    (instrument-supports ?i - instrument ?m - mode)
    (instrument-cal-target ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
  )

  (:functions
    (fuel-used)           ; global accumulator
    (data-stored)         ; global accumulator
    (data_size ?d - direction ?m - mode)
    (slew ?from - direction ?to - direction)
    ; per-satellite numeric fluents
    (fuel-satellite0)
    (fuel-satellite1)
    (fuel-satellite2)
    (fuel-satellite3)
    (fuel-satellite4)
    (data-capacity-satellite0)
    (data-capacity-satellite1)
    (data-capacity-satellite2)
    (data-capacity-satellite3)
    (data-capacity-satellite4)
  )

  ; Actions per-satellite: turn (slew)
  (:action turn-satellite0
    :parameters (?from - direction ?to - direction)
    :precondition (and
      (pointing satellite0 ?from)
      (not (= ?from ?to))
      (>= (fuel-satellite0) (slew ?from ?to))
    )
    :effect (and
      (not (pointing satellite0 ?from))
      (pointing satellite0 ?to)
      (decrease (fuel-satellite0) (slew ?from ?to))
      (increase (fuel-used) (slew ?from ?to))
    )
  )

  (:action turn-satellite1
    :parameters (?from - direction ?to - direction)
    :precondition (and
      (pointing satellite1 ?from)
      (not (= ?from ?to))
      (>= (fuel-satellite1) (slew ?from ?to))
    )
    :effect (and
      (not (pointing satellite1 ?from))
      (pointing satellite1 ?to)
      (decrease (fuel-satellite1) (slew ?from ?to))
      (increase (fuel-used) (slew ?from ?to))
    )
  )

  (:action turn-satellite2
    :parameters (?from - direction ?to - direction)
    :precondition (and
      (pointing satellite2 ?from)
      (not (= ?from ?to))
      (>= (fuel-satellite2) (slew ?from ?to))
    )
    :effect (and
      (not (pointing satellite2 ?from))
      (pointing satellite2 ?to)
      (decrease (fuel-satellite2) (slew ?from ?to))
      (increase (fuel-used) (slew ?from ?to))
    )
  )

  (:action turn-satellite3
    :parameters (?from - direction ?to - direction)
    :precondition (and
      (pointing satellite3 ?from)
      (not (= ?from ?to))
      (>= (fuel-satellite3) (slew ?from ?to))
    )
    :effect (and
      (not (pointing satellite3 ?from))
      (pointing satellite3 ?to)
      (decrease (fuel-satellite3) (slew ?from ?to))
      (increase (fuel-used) (slew ?from ?to))
    )
  )

  (:action turn-satellite4
    :parameters (?from - direction ?to - direction)
    :precondition (and
      (pointing satellite4 ?from)
      (not (= ?from ?to))
      (>= (fuel-satellite4) (slew ?from ?to))
    )
    :effect (and
      (not (pointing satellite4 ?from))
      (pointing satellite4 ?to)
      (decrease (fuel-satellite4) (slew ?from ?to))
      (increase (fuel-used) (slew ?from ?to))
    )
  )

  ; Actions per-satellite: switch_on (instrument)
  (:action switch_on-satellite0
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite0)
      (power-available satellite0)
    )
    :effect (and
      (power-on ?i)
      (not (power-available satellite0))
      (not (calibrated ?i)) ; switching on clears calibration
    )
  )

  (:action switch_on-satellite1
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite1)
      (power-available satellite1)
    )
    :effect (and
      (power-on ?i)
      (not (power-available satellite1))
      (not (calibrated ?i))
    )
  )

  (:action switch_on-satellite2
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite2)
      (power-available satellite2)
    )
    :effect (and
      (power-on ?i)
      (not (power-available satellite2))
      (not (calibrated ?i))
    )
  )

  (:action switch_on-satellite3
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite3)
      (power-available satellite3)
    )
    :effect (and
      (power-on ?i)
      (not (power-available satellite3))
      (not (calibrated ?i))
    )
  )

  (:action switch_on-satellite4
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite4)
      (power-available satellite4)
    )
    :effect (and
      (power-on ?i)
      (not (power-available satellite4))
      (not (calibrated ?i))
    )
  )

  ; Actions per-satellite: switch_off (instrument)
  (:action switch_off-satellite0
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite0)
      (power-on ?i)
    )
    :effect (and
      (not (power-on ?i))
      (power-available satellite0)
    )
  )

  (:action switch_off-satellite1
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite1)
      (power-on ?i)
    )
    :effect (and
      (not (power-on ?i))
      (power-available satellite1)
    )
  )

  (:action switch_off-satellite2
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite2)
      (power-on ?i)
    )
    :effect (and
      (not (power-on ?i))
      (power-available satellite2)
    )
  )

  (:action switch_off-satellite3
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite3)
      (power-on ?i)
    )
    :effect (and
      (not (power-on ?i))
      (power-available satellite3)
    )
  )

  (:action switch_off-satellite4
    :parameters (?i - instrument)
    :precondition (and
      (instrument-onboard ?i satellite4)
      (power-on ?i)
    )
    :effect (and
      (not (power-on ?i))
      (power-available satellite4)
    )
  )

  ; Actions per-satellite: calibrate (instrument)
  (:action calibrate-satellite0
    :parameters (?i - instrument ?d - direction)
    :precondition (and
      (instrument-onboard ?i satellite0)
      (instrument-cal-target ?i ?d)
      (pointing satellite0 ?d)
      (power-on ?i)
    )
    :effect (and
      (calibrated ?i)
    )
  )

  (:action calibrate-satellite1
    :parameters (?i - instrument ?d - direction)
    :precondition (and
      (instrument-onboard ?i satellite1)
      (instrument-cal-target ?i ?d)
      (pointing satellite1 ?d)
      (power-on ?i)
    )
    :effect (and
      (calibrated ?i)
    )
  )

  (:action calibrate-satellite2
    :parameters (?i - instrument ?d - direction)
    :precondition (and
      (instrument-onboard ?i satellite2)
      (instrument-cal-target ?i ?d)
      (pointing satellite2 ?d)
      (power-on ?i)
    )
    :effect (and
      (calibrated ?i)
    )
  )

  (:action calibrate-satellite3
    :parameters (?i - instrument ?d - direction)
    :precondition (and
      (instrument-onboard ?i satellite3)
      (instrument-cal-target ?i ?d)
      (pointing satellite3 ?d)
      (power-on ?i)
    )
    :effect (and
      (calibrated ?i)
    )
  )

  (:action calibrate-satellite4
    :parameters (?i - instrument ?d - direction)
    :precondition (and
      (instrument-onboard ?i satellite4)
      (instrument-cal-target ?i ?d)
      (pointing satellite4 ?d)
      (power-on ?i)
    )
    :effect (and
      (calibrated ?i)
    )
  )

  ; Actions per-satellite: take_image
  (:action take_image-satellite0
    :parameters (?i - instrument ?d - direction ?m - mode)
    :precondition (and
      (instrument-onboard ?i satellite0)
      (instrument-supports ?i ?m)
      (power-on ?i)
      (calibrated ?i)
      (pointing satellite0 ?d)
      (>= (data-capacity-satellite0) (data_size ?d ?m))
    )
    :effect (and
      (have-image ?d ?m)
      (decrease (data-capacity-satellite0) (data_size ?d ?m))
      (increase (data-stored) (data_size ?d ?m))
    )
  )

  (:action take_image-satellite1
    :parameters (?i - instrument ?d - direction ?m - mode)
    :precondition (and
      (instrument-onboard ?i satellite1)
      (instrument-supports ?i ?m)
      (power-on ?i)
      (calibrated ?i)
      (pointing satellite1 ?d)
      (>= (data-capacity-satellite1) (data_size ?d ?m))
    )
    :effect (and
      (have-image ?d ?m)
      (decrease (data-capacity-satellite1) (data_size ?d ?m))
      (increase (data-stored) (data_size ?d ?m))
    )
  )

  (:action take_image-satellite2
    :parameters (?i - instrument ?d - direction ?m - mode)
    :precondition (and
      (instrument-onboard ?i satellite2)
      (instrument-supports ?i ?m)
      (power-on ?i)
      (calibrated ?i)
      (pointing satellite2 ?d)
      (>= (data-capacity-satellite2) (data_size ?d ?m))
    )
    :effect (and
      (have-image ?d ?m)
      (decrease (data-capacity-satellite2) (data_size ?d ?m))
      (increase (data-stored) (data_size ?d ?m))
    )
  )

  (:action take_image-satellite3
    :parameters (?i - instrument ?d - direction ?m - mode)
    :precondition (and
      (instrument-onboard ?i satellite3)
      (instrument-supports ?i ?m)
      (power-on ?i)
      (calibrated ?i)
      (pointing satellite3 ?d)
      (>= (data-capacity-satellite3) (data_size ?d ?m))
    )
    :effect (and
      (have-image ?d ?m)
      (decrease (data-capacity-satellite3) (data_size ?d ?m))
      (increase (data-stored) (data_size ?d ?m))
    )
  )

  (:action take_image-satellite4
    :parameters (?i - instrument ?d - direction ?m - mode)
    :precondition (and
      (instrument-onboard ?i satellite4)
      (instrument-supports ?i ?m)
      (power-on ?i)
      (calibrated ?i)
      (pointing satellite4 ?d)
      (>= (data-capacity-satellite4) (data_size ?d ?m))
    )
    :effect (and
      (have-image ?d ?m)
      (decrease (data-capacity-satellite4) (data_size ?d ?m))
      (increase (data-stored) (data_size ?d ?m))
    )
  )

)