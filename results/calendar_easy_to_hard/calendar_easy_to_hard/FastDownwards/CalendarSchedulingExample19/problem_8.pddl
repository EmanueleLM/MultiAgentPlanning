(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    marie janice elijah theresa - person
    c0900 c0930 c1000 c1030 c1100 c1130 - cslot
  )
  (:init
    (allowed_start c0900) (allowed_start c0930) (allowed_start c1000) (allowed_start c1030) (allowed_start c1100) (allowed_start c1130)
    (free marie c0900) (free marie c0930) (free marie c1000) (free marie c1030) (free marie c1130)
    (free janice c0900) (free janice c0930) (free janice c1000) (free janice c1030) (free janice c1100) (free janice c1130)
    (free elijah c0900) (free elijah c0930)
    (free theresa c0900) (free theresa c1130)
  )
  (:goal (meeting_scheduled))
)