(define (domain meet-joseph-nobhill)
  (:requirements :strips :typing :negative-preconditions)
  (:types minute location)

  (:constants
    chinatown nobhill - location
  )

  (:predicates
    (current ?t - minute)
    (at ?loc - location)
    (met-joseph)
    ;; sparse successor predicates only for the time-jumps the model needs
    (succ172 ?t1 - minute ?t2 - minute)  ; jump from 09:00 to planned departure 11:52
    (succ8 ?t1 - minute ?t2 - minute)    ; Chinatown -> Nob Hill travel (8 minutes)
    (succ75 ?t1 - minute ?t2 - minute)   ; meeting duration (75 minutes)
    (allowed-meeting-start ?t - minute)  ; Joseph availability window encoded sparsely
  )

  (:action wait-until-departure
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (current ?t) (succ172 ?t ?t2))
    :effect (and
              (not (current ?t)) (current ?t2)
            )
  )

  (:action move-chinatown-to-nobhill
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (current ?t) (at chinatown) (succ8 ?t ?t2))
    :effect (and
              (not (current ?t)) (current ?t2)
              (not (at chinatown)) (at nobhill)
            )
  )

  (:action meet-joseph-nobhill-75min
    :parameters (?t - minute ?t2 - minute)
    :precondition (and (current ?t) (at nobhill) (allowed-meeting-start ?t) (succ75 ?t ?t2) (not (met-joseph)))
    :effect (and
              (not (current ?t)) (current ?t2)
              (met-joseph)
              (at nobhill)
            )
  )
)