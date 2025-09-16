(define (problem multi-party-meeting-problem)
  (:domain multi-party-meeting-domain)

  ; We use three candidate 1-hour slots (start times): 9:00-10:00, 11:00-12:00, 15:00-16:00
  (:objects
     slot_9_10 slot_11_12 slot_15_16 - slot
  )

  (:init
    ; Arthur: free only at 15:00-16:00 among the three candidate slots
    (free-arthur slot_15_16)

    ; Michael: free at all three candidate slots
    (free-michael slot_9_10)
    (free-michael slot_11_12)
    (free-michael slot_15_16)

    ; Samantha: free at 9:00-10:00 and 11:00-12:00 (not at 15:00-16:00)
    (free-samantha slot_9_10)
    (free-samantha slot_11_12)
  )

  ; The goal is to have a single slot where all three are scheduled for the meeting
  ; i.e., pick a slot s such that Arthur, Michael, and Samantha are scheduled at s,
  ; and a meeting is at s.
  (:goal
    (or
      (and (meeting-at slot_9_10)
           (scheduled-arthur slot_9_10)
           (scheduled-michael slot_9_10)
           (scheduled-samantha slot_9_10))
      (and (meeting-at slot_11_12)
           (scheduled-arthur slot_11_12)
           (scheduled-michael slot_11_12)
           (scheduled-samantha slot_11_12))
      (and (meeting-at slot_15_16)
           (scheduled-arthur slot_15_16)
           (scheduled-michael slot_15_16)
           (scheduled-samantha slot_15_16))
    )
  )
)