(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    c0900 c0930 c1000 c1030 c1100 c1130 - cslot
  )
  (:init
    (allowed_start c0900) (allowed_start c0930) (allowed_start c1000) (allowed_start c1030) (allowed_start c1100) (allowed_start c1130)
    (free stephen c0900) (free stephen c0930) (free stephen c1000) (free stephen c1030) (free stephen c1130)
    (free edward c0900) (free edward c0930) (free edward c1000) (free edward c1030) (free edward c1100) (free edward c1130)
    (free angela c0900) (free angela c0930)
  )
  (:goal (meeting_scheduled))
)