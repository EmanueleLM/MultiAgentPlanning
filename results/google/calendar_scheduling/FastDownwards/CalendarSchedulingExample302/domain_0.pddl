(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  ; An action to schedule the meeting at a specific slot (one action per slot).
  ; Each schedule action requires every agent to be free at that slot and that no meeting is already scheduled.
  ; Effects set meeting-scheduled and record the slot where the meeting is scheduled.
  (:action schedule-09_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s09_00)
      (free christine s09_00)
      (free anna s09_00)
      (free terry s09_00)
      (free julie s09_00)
      (free abigail s09_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s09_00))
  )

  (:action schedule-09_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s09_30)
      (free christine s09_30)
      (free anna s09_30)
      (free terry s09_30)
      (free julie s09_30)
      (free abigail s09_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s09_30))
  )

  (:action schedule-10_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s10_00)
      (free christine s10_00)
      (free anna s10_00)
      (free terry s10_00)
      (free julie s10_00)
      (free abigail s10_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s10_00))
  )

  (:action schedule-10_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s10_30)
      (free christine s10_30)
      (free anna s10_30)
      (free terry s10_30)
      (free julie s10_30)
      (free abigail s10_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s10_30))
  )

  (:action schedule-11_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s11_00)
      (free christine s11_00)
      (free anna s11_00)
      (free terry s11_00)
      (free julie s11_00)
      (free abigail s11_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s11_00))
  )

  (:action schedule-11_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s11_30)
      (free christine s11_30)
      (free anna s11_30)
      (free terry s11_30)
      (free julie s11_30)
      (free abigail s11_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s11_30))
  )

  (:action schedule-12_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s12_00)
      (free christine s12_00)
      (free anna s12_00)
      (free terry s12_00)
      (free julie s12_00)
      (free abigail s12_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s12_00))
  )

  (:action schedule-12_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s12_30)
      (free christine s12_30)
      (free anna s12_30)
      (free terry s12_30)
      (free julie s12_30)
      (free abigail s12_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s12_30))
  )

  (:action schedule-13_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s13_00)
      (free christine s13_00)
      (free anna s13_00)
      (free terry s13_00)
      (free julie s13_00)
      (free abigail s13_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s13_00))
  )

  (:action schedule-13_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s13_30)
      (free christine s13_30)
      (free anna s13_30)
      (free terry s13_30)
      (free julie s13_30)
      (free abigail s13_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s13_30))
  )

  (:action schedule-14_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s14_00)
      (free christine s14_00)
      (free anna s14_00)
      (free terry s14_00)
      (free julie s14_00)
      (free abigail s14_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s14_00))
  )

  (:action schedule-14_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s14_30)
      (free christine s14_30)
      (free anna s14_30)
      (free terry s14_30)
      (free julie s14_30)
      (free abigail s14_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s14_30))
  )

  (:action schedule-15_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s15_00)
      (free christine s15_00)
      (free anna s15_00)
      (free terry s15_00)
      (free julie s15_00)
      (free abigail s15_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s15_00))
  )

  (:action schedule-15_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s15_30)
      (free christine s15_30)
      (free anna s15_30)
      (free terry s15_30)
      (free julie s15_30)
      (free abigail s15_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s15_30))
  )

  (:action schedule-16_00
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s16_00)
      (free christine s16_00)
      (free anna s16_00)
      (free terry s16_00)
      (free julie s16_00)
      (free abigail s16_00)
    )
    :effect (and (meeting-scheduled) (meeting-at s16_00))
  )

  (:action schedule-16_30
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free nicole s16_30)
      (free christine s16_30)
      (free anna s16_30)
      (free terry s16_30)
      (free julie s16_30)
      (free abigail s16_30)
    )
    :effect (and (meeting-scheduled) (meeting-at s16_30))
  )
)