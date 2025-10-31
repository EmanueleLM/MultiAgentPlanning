(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    marie janice elijah theresa - person
    c0900 c0930 c1000 c1030 c1100 c1130 - cslot
  )
  (:init
    ; allowed start times (30-minute meeting must end by 12:00 per Theresa's constraint -> latest start 11:30)
    (allowed_start c0900) (allowed_start c0930) (allowed_start c1000) (allowed_start c1030) (allowed_start c1100) (allowed_start c1130)

    ; free slots for Marie (busy 11:00-11:30 and 15:00-16:30)
    (free marie c0900) (free marie c0930) (free marie c1000) (free marie c1030) (free marie c1130)

    ; free slots for Janice (busy 12:30-13:00, 13:30-15:00 — does not affect morning starts)
    (free janice c0900) (free janice c0930) (free janice c1000) (free janice c1030) (free janice c1100) (free janice c1130)

    ; free slots for Elijah (busy 10:00-13:00, 14:30-15:00, 16:00-16:30)
    (free elijah c0900) (free elijah c0930)

    ; free slots for Theresa (busy 9:30-10:30, 12:00-13:00, ... and does not want to meet after 12:00)
    (free theresa c0900) (free theresa c1030) (free theresa c1100) (free theresa c1130)
  )
  (:goal (meeting_scheduled))
)