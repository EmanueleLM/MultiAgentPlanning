(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (busy ?p - participant ?s - slot)            ; participant is busy in slot
    (slot-available ?s - slot)                   ; all participants free and within constraints (precomputed)
    (meeting-scheduled ?s - slot)                ; meeting scheduled at slot
    (scheduled)                                  ; a meeting has been scheduled
  )

  ; Schedule actions for each 30-minute slot between 09:00 and 17:00.
  ; Each action requires that the slot is available, that no meeting has yet been scheduled,
  ; and (for later slots) that no earlier slot is available (enforce earliest preference).
  (:action schedule-t0
    :parameters ()
    :precondition (and
      (slot-available t0)
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t0)
      (scheduled)
    )
  )

  (:action schedule-t1
    :parameters ()
    :precondition (and
      (slot-available t1)
      (not (slot-available t0))   ; earlier-slot-available checks enforce earliest-slot preference
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t1)
      (scheduled)
    )
  )

  (:action schedule-t2
    :parameters ()
    :precondition (and
      (slot-available t2)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t2)
      (scheduled)
    )
  )

  (:action schedule-t3
    :parameters ()
    :precondition (and
      (slot-available t3)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t3)
      (scheduled)
    )
  )

  (:action schedule-t4
    :parameters ()
    :precondition (and
      (slot-available t4)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t4)
      (scheduled)
    )
  )

  (:action schedule-t5
    :parameters ()
    :precondition (and
      (slot-available t5)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t5)
      (scheduled)
    )
  )

  (:action schedule-t6
    :parameters ()
    :precondition (and
      (slot-available t6)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t6)
      (scheduled)
    )
  )

  (:action schedule-t7
    :parameters ()
    :precondition (and
      (slot-available t7)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t7)
      (scheduled)
    )
  )

  (:action schedule-t8
    :parameters ()
    :precondition (and
      (slot-available t8)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t8)
      (scheduled)
    )
  )

  (:action schedule-t9
    :parameters ()
    :precondition (and
      (slot-available t9)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (slot-available t8))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t9)
      (scheduled)
    )
  )

  (:action schedule-t10
    :parameters ()
    :precondition (and
      (slot-available t10)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (slot-available t8))
      (not (slot-available t9))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t10)
      (scheduled)
    )
  )

  (:action schedule-t11
    :parameters ()
    :precondition (and
      (slot-available t11)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (slot-available t8))
      (not (slot-available t9))
      (not (slot-available t10))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t11)
      (scheduled)
    )
  )

  (:action schedule-t12
    :parameters ()
    :precondition (and
      (slot-available t12)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (slot-available t8))
      (not (slot-available t9))
      (not (slot-available t10))
      (not (slot-available t11))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t12)
      (scheduled)
    )
  )

  (:action schedule-t13
    :parameters ()
    :precondition (and
      (slot-available t13)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (slot-available t8))
      (not (slot-available t9))
      (not (slot-available t10))
      (not (slot-available t11))
      (not (slot-available t12))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t13)
      (scheduled)
    )
  )

  (:action schedule-t14
    :parameters ()
    :precondition (and
      (slot-available t14)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (slot-available t8))
      (not (slot-available t9))
      (not (slot-available t10))
      (not (slot-available t11))
      (not (slot-available t12))
      (not (slot-available t13))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t14)
      (scheduled)
    )
  )

  (:action schedule-t15
    :parameters ()
    :precondition (and
      (slot-available t15)
      (not (slot-available t0))
      (not (slot-available t1))
      (not (slot-available t2))
      (not (slot-available t3))
      (not (slot-available t4))
      (not (slot-available t5))
      (not (slot-available t6))
      (not (slot-available t7))
      (not (slot-available t8))
      (not (slot-available t9))
      (not (slot-available t10))
      (not (slot-available t11))
      (not (slot-available t12))
      (not (slot-available t13))
      (not (slot-available t14))
      (not (scheduled))
    )
    :effect (and
      (meeting-scheduled t15)
      (scheduled)
    )
  )

)