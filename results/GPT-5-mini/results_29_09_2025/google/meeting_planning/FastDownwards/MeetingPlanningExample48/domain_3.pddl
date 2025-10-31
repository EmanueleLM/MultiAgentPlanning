(define (domain multiagent_meetings)
  (:requirements :strips :negative-preconditions :action-costs)
  (:predicates
    (at_you_fd)
    (at_you_us)
    (at_joseph_us)
    (met_joseph)
    (time_540)
    (time_1281)
    (time_1290)
    (time_1305)
    (time_1320)
  )

  (:action you_wait_540_to_1281
    :parameters ()
    :precondition (time_540)
    :effect (and (not (time_540)) (time_1281))
    :cost 0
  )

  (:action you_wait_1281_to_1290
    :parameters ()
    :precondition (time_1281)
    :effect (and (not (time_1281)) (time_1290))
    :cost 0
  )

  (:action you_wait_1290_to_1305
    :parameters ()
    :precondition (time_1290)
    :effect (and (not (time_1290)) (time_1305))
    :cost 0
  )

  (:action you_wait_1305_to_1320
    :parameters ()
    :precondition (time_1305)
    :effect (and (not (time_1305)) (time_1320))
    :cost 0
  )

  (:action you_travel_fd_to_us_arrive_1290
    :parameters ()
    :precondition (and (at_you_fd) (time_1281))
    :effect (and (not (at_you_fd)) (at_you_us) (not (time_1281)) (time_1290))
    :cost 0
  )

  (:action you_travel_us_to_fd
    :parameters ()
    :precondition (at_you_us)
    :effect (and (not (at_you_us)) (at_you_fd))
    :cost 0
  )

  (:action joseph_appear_at_1290
    :parameters ()
    :precondition (time_1290)
    :effect (and (at_joseph_us))
    :cost 0
  )

  (:action joseph_appear_at_1305
    :parameters ()
    :precondition (time_1305)
    :effect (and (at_joseph_us))
    :cost 0
  )

  (:action joseph_leave_at_1320
    :parameters ()
    :precondition (time_1320)
    :effect (and (not (at_joseph_us)))
    :cost 0
  )

  (:action you_meet_joseph_30
    :parameters ()
    :precondition (and (at_you_us) (at_joseph_us) (time_1290) (not (met_joseph)))
    :effect (and (met_joseph) (not (time_1290)) (time_1320))
    :cost -1
  )

  (:action you_meet_joseph_15_from_1290
    :parameters ()
    :precondition (and (at_you_us) (at_joseph_us) (time_1290) (not (met_joseph)))
    :effect (and (met_joseph) (not (time_1290)) (time_1305))
    :cost -1
  )

  (:action you_meet_joseph_15_from_1305
    :parameters ()
    :precondition (and (at_you_us) (at_joseph_us) (time_1305) (not (met_joseph)))
    :effect (and (met_joseph) (not (time_1305)) (time_1320))
    :cost -1
  )
)