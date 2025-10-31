(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (current ?t - timeslot)
    (free ?p - person ?t - timeslot)
    (bob-morning ?t - timeslot)
    (interruption-ack)
    (scheduled)
    (meeting-at ?t - timeslot)
  )

  ;; advance the current time pointer (each advance is one plan step).
  (:action advance
    :parameters (?from - timeslot ?to - timeslot)
    :precondition (current ?from)
    :effect (and (not (current ?from)) (current ?to))
  )

  ;; explicit acknowledgement required before using the "interrupt-Bob" scheduling action.
  ;; This creates an extra plan step penalty when the plan chooses to interrupt Bob's morning.
  (:action acknowledge-interrupt
    :parameters (?t - timeslot)
    :precondition (current ?t)
    :effect (interruption-ack)
  )

  ;; schedule when the chosen start time does NOT interrupt Bob's morning.
  ;; Negative precondition enforces "no interruption" for these slots.
  (:action schedule-no-interrupt
    :parameters (?t - timeslot)
    :precondition (and
                   (current ?t)
                   (free alice ?t)
                   (free bob ?t)
                   (free carol ?t)
                   (not (bob-morning ?t))
                   (not (scheduled)))
    :effect (and (scheduled) (meeting-at ?t))
  )

  ;; schedule even if it interrupts Bob's morning, but only after explicit acknowledgement,
  ;; which requires an extra action step (penalty) so plans that can avoid interruption
  ;; at the same earliest time will be preferred (tie-breaker via plan length).
  (:action schedule-interrupt
    :parameters (?t - timeslot)
    :precondition (and
                   (current ?t)
                   (free alice ?t)
                   (free bob ?t)
                   (free carol ?t)
                   (interruption-ack)
                   (not (scheduled)))
    :effect (and (scheduled) (meeting-at ?t))
  )
)