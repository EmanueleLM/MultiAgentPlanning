(define (problem schedule-meeting-monday-09-10)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant
    slot_09_00_10_00 slot_10_00_11_00 - slot
  )
  (:init
    ; There is one meeting to schedule
    (unscheduled)

    ; Candidate one-hour slots (only those that passed the auditor)
    (available slot_09_00_10_00)
    (available slot_10_00_11_00)

    ; Free facts (each participant is free on the candidate slots per the auditor)
    ; Bobby: free 09:00-17:00, so free on both candidate slots
    (free bobby slot_09_00_10_00)
    (free bobby slot_10_00_11_00)

    ; Scott: candidate slots were validated as free for Scott
    (free scott slot_09_00_10_00)
    (free scott slot_10_00_11_00)

    ; Kimberly: candidate slots were validated as free for Kimberly
    (free kimberly slot_09_00_10_00)
    (free kimberly slot_10_00_11_00)
  )

  ; Goal: schedule exactly one one-hour meeting; prefer the earliest feasible slot.
  ; By requiring the chosen earliest slot as the goal and making the domain
  ; prevent further choices via the (unscheduled) flag, the plan will pick
  ; exactly that slot and cannot pick any other afterwards.
  (:goal (chosen slot_09_00_10_00))
)