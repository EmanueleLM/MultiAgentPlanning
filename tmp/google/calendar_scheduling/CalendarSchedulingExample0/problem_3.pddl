(define (problem find-meeting-time)
  (:domain combined-scheduling)

  (:objects
    slot9-10 slot10-11 slot11-12 slot12-13 slot13-14 slot14-15 slot15-16 slot16-17 - time_slot
  )

  (:init
    (free-michelle slot9-10)
    (free-michelle slot10-11)
    (not (free-michelle slot11-12))
    (free-michelle slot12-13)
    (free-michelle slot13-14)
    (free-michelle slot14-15)
    (free-michelle slot15-16)
    (free-michelle slot16-17)

    (free-steven slot9-10)
    (free-steven slot10-11)
    (not (free-steven slot11-12))
    (free-steven slot12-13)
    (not (free-steven slot13-14))
    (free-steven slot14-15)
    (not (free-steven slot15-16))
    (free-steven slot16-17)

    (free-jerry slot9-10)
    (not (free-jerry slot10-11))
    (free-jerry slot11-12)
    (free-jerry slot12-13)
    (not (free-jerry slot13-14))
    (free-jerry slot14-15)
    (not (free-jerry slot15-16))
    (not (free-jerry slot16-17))

    (not (meeting-scheduled))
  )

  (:goal
    (meeting-scheduled)
  )
)