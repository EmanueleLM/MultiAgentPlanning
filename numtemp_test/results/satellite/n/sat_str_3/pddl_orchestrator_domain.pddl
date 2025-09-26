(define (domain multi-sat-observation)
  (:requirements :strips :typing :fluents :negative-preconditions :numeric-fluents)
  (:types satellite instrument mode direction)
  (:predicates
    (onboard ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)
    (power-available ?s - satellite)
    (power-on ?i - instrument)
    (calibrated ?i - instrument)
    (pointing ?s - satellite ?d - direction)
    (have-image ?d - direction ?m - mode)
  )
  (:functions
    (fuel ?s - satellite)            ; remaining fuel on satellite
    (data-capacity ?s - satellite)   ; remaining data capacity on satellite
    (data-stored)                    ; global accumulated data stored
    (fuel-used)                      ; global accumulated fuel used (objective)
    (slew-time ?from - direction ?to - direction) ; numeric table
    (data-size ?d - direction ?m - mode)         ; numeric table
  )

  ;; slew action: moves pointing, consumes fuel, increases global fuel-used
  (:action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and
      (pointing ?s ?from)
      (>= (fuel ?s) (slew-time ?from ?to))
    )
    :effect (and
      (not (pointing ?s ?from))
      (pointing ?s ?to)
      (assign (fuel ?s) (- (fuel ?s) (slew-time ?from ?to)))
      (assign (fuel-used) (+ (fuel-used) (slew-time ?from ?to)))
    )
  )

  ;; switch_on: turns instrument on, consumes satellite power (power-available -> false), clears calibration
  (:action switch_on
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
      (onboard ?i ?s)
      (power-available ?s)
    )
    :effect (and
      (power-on ?i)
      (not (power-available ?s))
      (not (calibrated ?i))
    )
  )

  ;; switch_off: turns instrument off, restores satellite power
  (:action switch_off
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
      (onboard ?i ?s)
      (power-on ?i)
    )
    :effect (and
      (not (power-on ?i))
      (power-available ?s)
    )
  )

  ;; calibrate: requires instrument on and satellite pointing at instrument's calibration target
  (:action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :precondition (and
      (onboard ?i ?s)
      (power-on ?i)
      (pointing ?s ?d)
      (cal-target ?i ?d)
    )
    :effect (and
      (calibrated ?i)
    )
  )

  ;; take_image: requires instrument on, calibrated, supports mode, satellite pointing at direction,
  ;; and sufficient data capacity. Updates per-satellite capacity and global data-stored and asserts have-image
  (:action take_image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and
      (onboard ?i ?s)
      (supports ?i ?m)
      (power-on ?i)
      (calibrated ?i)
      (pointing ?s ?d)
      (>= (data-capacity ?s) (data-size ?d ?m))
    )
    :effect (and
      (have-image ?d ?m)
      (assign (data-capacity ?s) (- (data-capacity ?s) (data-size ?d ?m)))
      (assign (data-stored) (+ (data-stored) (data-size ?d ?m)))
    )
  )
)