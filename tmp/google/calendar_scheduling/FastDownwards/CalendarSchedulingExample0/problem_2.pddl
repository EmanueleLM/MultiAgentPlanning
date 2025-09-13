(define (problem combined-schedule-meeting)
  (:domain combined-meeting-scheduling)
  (:objects
    t09-10 t10-11 t11-12 t12-13 t13-14 t14-15 t15-16 t16-17 - time
    slot0-1 slot1-2 slot2-3 slot3-4 slot4-5 slot5-6 slot6-7 slot7-8 - time
    slot09-10 slot09-30 slot10-11 slot11-12 slot11-30
    slot13-14 slot14-15 slot14-30 slot15-16 slot16-30 slot16-17 - time
  )

  (:init
    (free t09-10)
    (free t10-11)
    (free t12-13)
    (free t13-14)
    (free t14-15)
    (free t15-16)
    (free t16-17)

    (blocked slot09-10)
    (blocked slot10-11)
    (blocked slot11-30)
    (blocked slot13-14)
    (blocked slot15-16)
    (blocked slot16-30)

    (free slot0-1)
    (free slot1-2)
    (not (free slot2-3))
    (not (free slot4-5))
    (not (free slot6-7))
  )

  (:goal
    (exists (?slot - time)
      (and (free ?slot) (meeting-scheduled ?slot))
    )
  )
)