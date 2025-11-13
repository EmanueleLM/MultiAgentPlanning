(define (problem schedule-meeting-monday-09-10)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant
    slot_09_00_10_00 - slot
  )
  (:init
    ; Meeting is initially unscheduled
    (unscheduled)

    ; Candidate one-hour slot(s) that passed the auditor:
    ; Only slots that are fully within 09:00-17:00 and conflict-free for all participants are included.
    (available slot_09_00_10_00)

    ; Free facts per participant for the candidate slot (validated by the auditor):
    ; Bobby: free entire 09:00-17:00 -> free on slot 09:00-10:00
    (free bobby slot_09_00_10_00)

    ; Scott: busy 11:30-12:00 and 15:30-16:00 -> free 09:00-11:30 includes 09:00-10:00
    (free scott slot_09_00_10_00)

    ; Kimberly: free window that can host a 60-minute meeting is 09:00-11:00 -> includes 09:00-10:00
    (free kimberly slot_09_00_10_00)
  )

  ; Goal: the meeting is scheduled (i.e., no longer unscheduled).
  (:goal (not (unscheduled)))
)