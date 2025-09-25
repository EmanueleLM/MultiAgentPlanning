(define (domain multi-agent-meeting)
  (:requirements :typing :strips)
  (:types agent location time)

  (:constants
    visitor john - agent
    ggp ph - location
    t_morning t_after_travel t_jstart t_20_00 t_20_30 t_20_45 - time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (time-is ?t - time)
    (meeting-offered-at ?t - time)
    (met ?v - agent ?j - agent)
    (john-available-at ?t - time)
  )

  (:action visitor-travel-ggp-to-ph
    :parameters ()
    :precondition (and
      (at visitor ggp)
      (time-is t_morning)
    )
    :effect (and
      (not (at visitor ggp))
      (at visitor ph)
      (not (time-is t_morning))
      (time-is t_after_travel)
    )
  )

  (:action wait-to-jstart-from-morning
    :parameters ()
    :precondition (and (time-is t_morning))
    :effect (and
      (not (time-is t_morning))
      (time-is t_jstart)
    )
  )

  (:action wait-to-jstart-from-after-travel
    :parameters ()
    :precondition (and (time-is t_after_travel))
    :effect (and
      (not (time-is t_after_travel))
      (time-is t_jstart)
    )
  )

  (:action visitor-start-meeting-at-jstart
    :parameters ()
    :precondition (and
      (at visitor ph)
      (at john ph)
      (time-is t_jstart)
      (john-available-at t_jstart)
    )
    :effect (and
      (meeting-offered-at t_jstart)
    )
  )

  (:action visitor-start-meeting-at-20_00
    :parameters ()
    :precondition (and
      (at visitor ph)
      (at john ph)
      (time-is t_20_00)
      (john-available-at t_20_00)
    )
    :effect (and
      (meeting-offered-at t_20_00)
    )
  )

  (:action john-accept-meeting-at-jstart
    :parameters ()
    :precondition (and
      (at visitor ph)
      (at john ph)
      (meeting-offered-at t_jstart)
      (time-is t_jstart)
      (john-available-at t_jstart)
    )
    :effect (and
      (not (meeting-offered-at t_jstart))
      (met visitor john)
      (not (time-is t_jstart))
      (time-is t_20_30)
    )
  )

  (:action john-accept-meeting-at-20_00
    :parameters ()
    :precondition (and
      (at visitor ph)
      (at john ph)
      (meeting-offered-at t_20_00)
      (time-is t_20_00)
      (john-available-at t_20_00)
    )
    :effect (and
      (not (meeting-offered-at t_20_00))
      (met visitor john)
      (not (time-is t_20_00))
      (time-is t_20_45)
    )
  )
)