(define (domain satellite-orchestrator)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types satellite instrument mode direction)

  (:predicates
    (pointing ?s - satellite ?d - direction)
    (onboard ?i - instrument ?s - satellite)
    (power-available ?s - satellite)
    (on ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (calibration-target ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
  )

  (:action turn
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (and (pointing ?s ?from) (not (pointing ?s ?to)))
    :effect (and (not (pointing ?s ?from)) (pointing ?s ?to))
  )

  (:action switch-on
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?i ?s) (power-available ?s) (not (on ?i)))
    :effect (and (on ?i) (not (power-available ?s)) (not (calibrated ?i)))
  )

  (:action switch-off
    :parameters (?s - satellite ?i - instrument)
    :precondition (and (onboard ?i ?s) (on ?i))
    :effect (and (not (on ?i)) (power-available ?s))
  )

  (:action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :precondition (and (onboard ?i ?s) (on ?i) (pointing ?s ?d) (calibration-target ?i ?d))
    :effect (calibrated ?i)
  )

  (:action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and (onboard ?i ?s) (on ?i) (pointing ?s ?d) (calibrated ?i) (supports ?i ?m))
    :effect (have-image ?d ?m)
  )
)