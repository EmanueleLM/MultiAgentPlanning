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
    (fuel ?s - satellite)
    (data-capacity ?s - satellite)
    (data-stored)
    (fuel-used)
    (slew-time ?from - direction ?to - direction)
    (data-size ?d - direction ?m - mode)
  )

  (:action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and
      (pointing ?s ?from)
      (not (= ?from ?to))
      (>= (fuel ?s) (slew-time ?from ?to))
    )
    :effect (and
      (not (pointing ?s ?from))
      (pointing ?s ?to)
      (assign (fuel ?s) (- (fuel ?s) (slew-time ?from ?to)))
      (assign (fuel-used) (+ (fuel-used) (slew-time ?from ?to)))
    )
  )

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