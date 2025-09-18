(define (domain combined-meet-domain)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:types agent location time)
  (:constants
    you stephanie - agent
    marina mission - location
    t0 t19 t20 t90 t150 t210 t270 - time
  )
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - time)
    (stephanie-at ?l - location ?t - time)
    (met)
  )
  (:functions
    (total-cost)
  )

  (:action travel-you-marina-to-mission-t0-t20
    :parameters ()
    :precondition (and (at you marina) (at-time t0))
    :effect (and
             (not (at you marina)) (at you mission)
             (not (at-time t0)) (at-time t20)
             (increase (total-cost) 20)
            )
  )

  (:action wait-you-t20-t90
    :parameters ()
    :precondition (and (at you mission) (at-time t20))
    :effect (and
             (not (at-time t20)) (at-time t90)
            )
  )

  (:action wait-you-t20-t150
    :parameters ()
    :precondition (and (at you mission) (at-time t20))
    :effect (and
             (not (at-time t20)) (at-time t150)
            )
  )

  (:action meet-you-stephanie-t90-t210
    :parameters ()
    :precondition (and
      (at you mission)
      (at stephanie mission)
      (at-time t90)
      (stephanie-at mission t90)
      (stephanie-at mission t210)
    )
    :effect (and
      (not (at-time t90)) (at-time t210)
      (met)
    )
  )

  (:action meet-you-stephanie-t150-t270
    :parameters ()
    :precondition (and
      (at you mission)
      (at stephanie mission)
      (at-time t150)
      (stephanie-at mission t150)
      (stephanie-at mission t270)
    )
    :effect (and
      (not (at-time t150)) (at-time t270)
      (met)
    )
  )
)