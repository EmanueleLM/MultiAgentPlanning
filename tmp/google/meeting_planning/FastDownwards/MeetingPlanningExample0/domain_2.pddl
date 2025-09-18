(define (domain combined-meet-domain)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:types location time)
  (:predicates
    (at-you ?l - location)
    (at-time ?t - time)
    (stephanie-at ?l - location ?t - time)
    (met)
    (available)
  )
  (:functions
    (total-cost)
  )

  (:action travel-marina-to-mission-t0-t20
    :precondition (and (at-you marina) (at-time t0) (available))
    :effect (and
             (not (at-you marina)) (at-you mission)
             (not (at-time t0)) (at-time t20)
             (increase (total-cost) 20)
            )
  )

  (:action travel-mission-to-marina-t0-t19
    :precondition (and (at-you mission) (at-time t0) (available))
    :effect (and
             (not (at-you mission)) (at-you marina)
             (not (at-time t0)) (at-time t19)
             (increase (total-cost) 19)
            )
  )

  (:action wait-t0-t90
    :precondition (and (at-time t0) (available))
    :effect (and
             (not (at-time t0)) (at-time t90)
             (increase (total-cost) 90)
            )
  )

  (:action wait-t20-t90
    :precondition (and (at-time t20) (available))
    :effect (and
             (not (at-time t20)) (at-time t90)
             (increase (total-cost) 70)
            )
  )

  (:action wait-t20-t150
    :precondition (and (at-time t20) (available))
    :effect (and
             (not (at-time t20)) (at-time t150)
             (increase (total-cost) 130)
            )
  )

  (:action meet-start-t90-end-t210
    :precondition (and
      (at-you mission)
      (at-time t90)
      (available)
      (stephanie-at mission t90)
      (stephanie-at mission t210)
    )
    :effect (and
      (not (at-time t90)) (at-time t210)
      (met)
      (increase (total-cost) 120)
    )
  )

  (:action meet-start-t150-end-t270
    :precondition (and
      (at-you mission)
      (at-time t150)
      (available)
      (stephanie-at mission t150)
      (stephanie-at mission t270)
    )
    :effect (and
      (not (at-time t150)) (at-time t270)
      (met)
      (increase (total-cost) 120)
    )
  )
)