(define (domain satellite-observation)
  (:requirements :strips :typing :negative-preconditions :adl)
  (:types satellite instrument mode direction)

  (:predicates
    (host ?i - instrument ?s - satellite)
    (pointing ?s - satellite ?d - direction)
    (power-available ?s - satellite)
    (on ?i - instrument)
    (calibrated ?i - instrument)
    (supports ?i - instrument ?m - mode)
    (cal-target ?i - instrument ?d - direction)
    (have-image ?d - direction ?m - mode)
  )

  (:action slew
    :parameters (?s - satellite ?from - direction ?to - direction)
    :precondition (pointing ?s ?from)
    :effect (and
              (not (pointing ?s ?from))
              (pointing ?s ?to)
            )
  )

  (:action switch-on
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
                    (host ?i ?s)
                    (power-available ?s)
                    (not (on ?i))
                  )
    :effect (and
              (on ?i)
              (not (power-available ?s))
              (not (calibrated ?i))
            )
  )

  (:action switch-off
    :parameters (?s - satellite ?i - instrument)
    :precondition (and
                    (host ?i ?s)
                    (on ?i)
                  )
    :effect (and
              (not (on ?i))
              (power-available ?s)
            )
  )

  (:action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :precondition (and
                    (host ?i ?s)
                    (on ?i)
                    (cal-target ?i ?d)
                    (pointing ?s ?d)
                  )
    :effect (calibrated ?i)
  )

  (:action take-image
    :parameters (?s - satellite ?i - instrument ?d - direction ?m - mode)
    :precondition (and
                    (host ?i ?s)
                    (pointing ?s ?d)
                    (on ?i)
                    (calibrated ?i)
                    (supports ?i ?m)
                  )
    :effect (have-image ?d ?m)
  )
)