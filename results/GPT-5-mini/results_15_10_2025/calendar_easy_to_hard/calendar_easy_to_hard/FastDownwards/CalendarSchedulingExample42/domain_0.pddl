(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types person time)
  (:constants samantha brian arthur matthew marilyn mark andrea - person)
  (:predicates
    (available ?p - person ?t - time)
    (proposed ?t - time)
    (chosen)
    (attending ?p - person)
  )
  (:functions
    (total-cost)
    (time-value ?t - time)
  )
  (:metric minimize (total-cost))

  ;; set a proposed meeting time (only once). Cost equals the time-value (earlier times smaller).
  (:action set-proposed
    :parameters (?t - time)
    :precondition (not (chosen))
    :effect (and
      (proposed ?t)
      (chosen)
      (increase (total-cost) (time-value ?t))
    )
  )

  ;; Distinct attend actions for each participant (each requires that the chosen time is available for that person).
  (:action attend-samantha
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available samantha ?t) (not (attending samantha)))
    :effect (attending samantha)
  )

  (:action attend-brian
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available brian ?t) (not (attending brian)))
    :effect (attending brian)
  )

  (:action attend-arthur
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available arthur ?t) (not (attending arthur)))
    :effect (attending arthur)
  )

  (:action attend-matthew
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available matthew ?t) (not (attending matthew)))
    :effect (attending matthew)
  )

  (:action attend-marilyn
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available marilyn ?t) (not (attending marilyn)))
    :effect (attending marilyn)
  )

  (:action attend-mark
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available mark ?t) (not (attending mark)))
    :effect (attending mark)
  )

  (:action attend-andrea
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available andrea ?t) (not (attending andrea)))
    :effect (attending andrea)
  )
)