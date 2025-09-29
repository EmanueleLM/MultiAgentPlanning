(define (domain multiagent_meetings)
  (:requirements :strips :negative-preconditions :action-costs)
  (:predicates
    (at-you-fd)
    (at-you-us)
    (at-joseph-us)
    (met-joseph)
    (time-540)
    (time-1281)
    (time-1290)
    (time-1305)
    (time-1320)
  )

  (:action you-wait-540-to-1281
    :parameters ()
    :precondition (time-540)
    :effect (and (not (time-540)) (time-1281))
    :cost 0
  )

  (:action you-wait-1281-to-1290
    :parameters ()
    :precondition (time-1281)
    :effect (and (not (time-1281)) (time-1290))
    :cost 0
  )

  (:action you-wait-1290-to-1305
    :parameters ()
    :precondition (time-1290)
    :effect (and (not (time-1290)) (time-1305))
    :cost 0
  )

  (:action you-wait-1305-to-1320
    :parameters ()
    :precondition (time-1305)
    :effect (and (not (time-1305)) (time-1320))
    :cost 0
  )

  (:action you-travel-fd-to-us-arrive-1290
    :parameters ()
    :precondition (and (at-you-fd) (time-1281))
    :effect (and (not (at-you-fd)) (at-you-us) (not (time-1281)) (time-1290))
    :cost 0
  )

  (:action you-travel-us-to-fd
    :parameters ()
    :precondition (at-you-us)
    :effect (and (not (at-you-us)) (at-you-fd))
    :cost 0
  )

  (:action joseph-appear-at-1290
    :parameters ()
    :precondition (time-1290)
    :effect (and (at-joseph-us))
    :cost 0
  )

  (:action joseph-appear-at-1305
    :parameters ()
    :precondition (time-1305)
    :effect (and (at-joseph-us))
    :cost 0
  )

  (:action joseph-leave-at-1320
    :parameters ()
    :precondition (time-1320)
    :effect (and (not (at-joseph-us)))
    :cost 0
  )

  (:action you-meet-joseph-30
    :parameters ()
    :precondition (and (at-you-us) (at-joseph-us) (time-1290) (not (met-joseph)))
    :effect (and (met-joseph) (not (time-1290)) (time-1320))
    :cost -1
  )

  (:action you-meet-joseph-15-from-1290
    :parameters ()
    :precondition (and (at-you-us) (at-joseph-us) (time-1290) (not (met-joseph)))
    :effect (and (met-joseph) (not (time-1290)) (time-1305))
    :cost -1
  )

  (:action you-meet-joseph-15-from-1305
    :parameters ()
    :precondition (and (at-you-us) (at-joseph-us) (time-1305) (not (met-joseph)))
    :effect (and (met-joseph) (not (time-1305)) (time-1320))
    :cost -1
  )
)