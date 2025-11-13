(define (domain sf_one_day_meetings)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location time person
  )
  (:predicates
    (now ?t - time)                  ; current time instant
    (at ?l - location)              ; current location
    (connected11 ?from - location ?to - location) ; 11-minute travel connection
    (reach11 ?t1 - time ?t2 - time) ; t2 is exactly 11 minutes after t1
    (reach304 ?t1 - time ?t2 - time); t2 is exactly 304 minutes after t1 (wait-to-depart)
    (avail-start ?t - time)         ; availability window start
    (avail-end ?t - time)           ; availability window end
    (kenneth-at ?l - location)      ; Kenneth's location
    (met-kenneth)                   ; goal achieved when true
  )
  (:functions
    (total-cost)
  )

  (:action wait-to
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (now ?t0)
      (reach304 ?t0 ?t1)
    )
    :effect (and
      (not (now ?t0))
      (now ?t1)
      (increase (total-cost) 0)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (connected11 ?from ?to)
      (now ?t1)
      (reach11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (now ?t1))
      (now ?t2)
      (increase (total-cost) 11)
    )
  )

  (:action meet-kenneth
    :parameters (?l - location ?ts - time ?te - time)
    :precondition (and
      (kenneth-at ?l)
      (at ?l)
      (now ?ts)
      (avail-start ?ts)
      (avail-end ?te)
    )
    :effect (and
      (met-kenneth)
      (not (now ?ts))
      (now ?te)
      (increase (total-cost) 0)
    )
  )
)