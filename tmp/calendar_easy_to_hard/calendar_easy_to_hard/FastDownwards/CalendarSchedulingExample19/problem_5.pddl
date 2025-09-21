(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    marie janice elijah theresa - person
    c0900 c0930 c1000 c1030 c1100 c1130 c1200 c1230 c1300 c1330 c1400 c1430 c1500 c1530 c1600 c1630 - cslot
  )
  (:init
    (allowed_start c0900) (allowed_start c0930) (allowed_start c1000) (allowed_start c1030) (allowed_start c1100) (allowed_start c1130)

    (free marie c0900) (free marie c0930) (free marie c1000) (free marie c1030) (free marie c1130) (free marie c1200) (free marie c1230) (free marie c1300) (free marie c1330) (free marie c1400) (free marie c1430) (free marie c1630)

    (free janice c0900) (free janice c0930) (free janice c1000) (free janice c1030) (free janice c1100) (free janice c1130) (free janice c1200) (free janice c1300) (free janice c1500) (free janice c1530) (free janice c1600) (free janice c1630)

    (free elijah c0900) (free elijah c0930) (free elijah c1200) (free elijah c1230) (free elijah c1300) (free elijah c1330) (free elijah c1400) (free elijah c1500) (free elijah c1530) (free elijah c1630)

    (free theresa c0900) (free theresa c1030) (free theresa c1100) (free theresa c1130) (free theresa c1300) (free theresa c1400) (free theresa c1500) (free theresa c1600)
  )
  (:goal (meeting_scheduled))
)