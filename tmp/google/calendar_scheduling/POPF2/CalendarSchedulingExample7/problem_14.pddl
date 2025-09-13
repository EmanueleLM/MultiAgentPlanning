(define (problem unified-schedule-meeting)
  (:domain unified-meeting-scheduling)

  (:objects
    heather nicholas zachary - participant
    slot-0930 slot-1100 slot-1130 slot-1200 slot-1230 
    slot-1300 slot-1500 slot-1530 slot-1600 - time-slot
  )

  (:init
    (available heather slot-0930)
    (available heather slot-1100)
    (available heather slot-1130)
    (available heather slot-1200)
    (available heather slot-1230)
    (available heather slot-1500)
    (available heather slot-1530)
    (available heather slot-1600)

    (available nicholas slot-0930)
    (available nicholas slot-1100)
    (available nicholas slot-1130)
    (available nicholas slot-1200)
    (available nicholas slot-1230)
    (available nicholas slot-1300)
    (available nicholas slot-1500)
    (available nicholas slot-1530)
    (available nicholas slot-1600)

    (available zachary slot-0930)
    (available zachary slot-1300)
    (available zachary slot-1500)
    (available zachary slot-1530)
    (available zachary slot-1600)
  )

  (:goal
    (exists (?t - time-slot) 
      (and
        (meeting-scheduled ?t)
        (participant-attending heather ?t)
        (participant-attending nicholas ?t)
        (participant-attending zachary ?t)
      )
    )
  )
)