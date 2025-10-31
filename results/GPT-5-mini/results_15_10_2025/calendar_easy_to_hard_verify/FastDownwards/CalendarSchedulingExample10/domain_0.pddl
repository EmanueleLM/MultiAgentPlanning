(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (available ?p - participant ?s - slot)
    (meeting-not-scheduled)
    (meeting-scheduled)
    (meeting-scheduled-at ?s - slot)
    (attending ?p - participant ?s - slot)
  )

  ;; An action for scheduling the required 60-minute meeting at each discrete one-hour slot.
  ;; Preconditions require every participant to be available at that slot and that no meeting
  ;; has been scheduled yet. Effects mark the meeting scheduled and record attendance.
  (:action schedule-09-10
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s09_10)
      (available joseph s09_10)
      (available henry s09_10)
      (available christian s09_10)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s09_10)
      (attending denise s09_10)
      (attending joseph s09_10)
      (attending henry s09_10)
      (attending christian s09_10)
    )
  )

  (:action schedule-10-11
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s10_11)
      (available joseph s10_11)
      (available henry s10_11)
      (available christian s10_11)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s10_11)
      (attending denise s10_11)
      (attending joseph s10_11)
      (attending henry s10_11)
      (attending christian s10_11)
    )
  )

  (:action schedule-11-12
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s11_12)
      (available joseph s11_12)
      (available henry s11_12)
      (available christian s11_12)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s11_12)
      (attending denise s11_12)
      (attending joseph s11_12)
      (attending henry s11_12)
      (attending christian s11_12)
    )
  )

  (:action schedule-12-13
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s12_13)
      (available joseph s12_13)
      (available henry s12_13)
      (available christian s12_13)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s12_13)
      (attending denise s12_13)
      (attending joseph s12_13)
      (attending henry s12_13)
      (attending christian s12_13)
    )
  )

  (:action schedule-13-14
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s13_14)
      (available joseph s13_14)
      (available henry s13_14)
      (available christian s13_14)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s13_14)
      (attending denise s13_14)
      (attending joseph s13_14)
      (attending henry s13_14)
      (attending christian s13_14)
    )
  )

  (:action schedule-14-15
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s14_15)
      (available joseph s14_15)
      (available henry s14_15)
      (available christian s14_15)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s14_15)
      (attending denise s14_15)
      (attending joseph s14_15)
      (attending henry s14_15)
      (attending christian s14_15)
    )
  )

  (:action schedule-15-16
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s15_16)
      (available joseph s15_16)
      (available henry s15_16)
      (available christian s15_16)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s15_16)
      (attending denise s15_16)
      (attending joseph s15_16)
      (attending henry s15_16)
      (attending christian s15_16)
    )
  )

  (:action schedule-16-17
    :parameters ()
    :precondition (and
      (meeting-not-scheduled)
      (available denise s16_17)
      (available joseph s16_17)
      (available henry s16_17)
      (available christian s16_17)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at s16_17)
      (attending denise s16_17)
      (attending joseph s16_17)
      (attending henry s16_17)
      (attending christian s16_17)
    )
  )

)