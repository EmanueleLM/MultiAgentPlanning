(define (domain meet-orchestrator-classical)
  (:requirements :typing :action-costs)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location)
    (at-time ?ag - agent ?t - time)
    (before ?t1 - time ?t2 - time)
    (travel-presidio-nb ?from - time ?to - time)
    (min-duration ?from - time ?to - time)
    (met)
  )

  (:action travel_you_presidio_to_north_beach
    :parameters (?from - time ?to - time)
    :precondition (and
      (at you presidio)
      (at-time you ?from)
      (travel-presidio-nb ?from ?to)
    )
    :effect (and
      (not (at-time you ?from))
      (at-time you ?to)
      (not (at you presidio))
      (at you north_beach)
    )
    :cost 18
  )

  (:action advance_you_time
    :parameters (?from - time ?to - time)
    :precondition (and
      (at-time you ?from)
      (before ?from ?to)
    )
    :effect (and
      (not (at-time you ?from))
      (at-time you ?to)
    )
    :cost 0
  )

  (:action meet_you_betty_585_660
    :parameters ()
    :precondition (and
      (at you north_beach)
      (at betty north_beach)
      (at-time you t585)
      (at-time betty t585)
      (at-time betty t660)
      (min-duration t585 t660)
    )
    :effect (and
      (not (at-time you t585))
      (at-time you t660)
      (met)
    )
    :cost -75
  )

  (:action meet_you_betty_585_705
    :parameters ()
    :precondition (and
      (at you north_beach)
      (at betty north_beach)
      (at-time you t585)
      (at-time betty t585)
      (at-time betty t705)
      (min-duration t585 t705)
    )
    :effect (and
      (not (at-time you t585))
      (at-time you t705)
      (met)
    )
    :cost -120
  )

  (:action meet_you_betty_585_735
    :parameters ()
    :precondition (and
      (at you north_beach)
      (at betty north_beach)
      (at-time you t585)
      (at-time betty t585)
      (at-time betty t735)
      (min-duration t585 t735)
    )
    :effect (and
      (not (at-time you t585))
      (at-time you t735)
      (met)
    )
    :cost -150
  )

  (:action meet_you_betty_585_780
    :parameters ()
    :precondition (and
      (at you north_beach)
      (at betty north_beach)
      (at-time you t585)
      (at-time betty t585)
      (at-time betty t780)
      (min-duration t585 t780)
    )
    :effect (and
      (not (at-time you t585))
      (at-time you t780)
      (met)
    )
    :cost -195
  )

  (:action meet_you_betty_660_735
    :parameters ()
    :precondition (and
      (at you north_beach)
      (at betty north_beach)
      (at-time you t660)
      (at-time betty t660)
      (at-time betty t735)
      (min-duration t660 t735)
    )
    :effect (and
      (not (at-time you t660))
      (at-time you t735)
      (met)
    )
    :cost -75
  )

  (:action meet_you_betty_660_780
    :parameters ()
    :precondition (and
      (at you north_beach)
      (at betty north_beach)
      (at-time you t660)
      (at-time betty t660)
      (at-time betty t780)
      (min-duration t660 t780)
    )
    :effect (and
      (not (at-time you t660))
      (at-time you t780)
      (met)
    )
    :cost -120
  )

  (:action meet_you_betty_705_780
    :parameters ()
    :precondition (and
      (at you north_beach)
      (at betty north_beach)
      (at-time you t705)
      (at-time betty t705)
      (at-time betty t780)
      (min-duration t705 t780)
    )
    :effect (and
      (not (at-time you t705))
      (at-time you t780)
      (met)
    )
    :cost -75
  )
)