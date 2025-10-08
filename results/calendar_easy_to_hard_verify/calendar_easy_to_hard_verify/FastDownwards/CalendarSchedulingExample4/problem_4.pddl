(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (free donna s0900) (free donna s0930) (free donna s1000) (free donna s1030)
    (free donna s1100) (free donna s1130) (free donna s1200) (free donna s1230)
    (free donna s1300) (free donna s1330) (free donna s1430) (free donna s1500)
    (free donna s1600) (free donna s1630)

    (free john s0900) (free john s0930) (free john s1000) (free john s1030)
    (free john s1130) (free john s1200) (free john s1230) (free john s1300)
    (free john s1330) (free john s1400) (free john s1430) (free john s1500)
    (free john s1530) (free john s1600)

    (free billy s1000) (free billy s1400)
  )

  (:goal (meeting-scheduled))
)