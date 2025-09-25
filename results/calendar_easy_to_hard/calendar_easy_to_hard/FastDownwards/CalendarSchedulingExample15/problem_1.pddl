(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630
    - slot
  )
  (:init
    (free-joyce s0900) (free-joyce s0930) (free-joyce s1000) (free-joyce s1030)
    (free-joyce s1130) (free-joyce s1200) (free-joyce s1230) (free-joyce s1300)
    (free-joyce s1400) (free-joyce s1630)

    (free-christine s1200) (free-christine s1230) (free-christine s1300) (free-christine s1330)
    (free-christine s1400) (free-christine s1430) (free-christine s1500) (free-christine s1530)
    (free-christine s1600) (free-christine s1630)

    (free-alexander s1100) (free-alexander s1130) (free-alexander s1230)
    (free-alexander s1300) (free-alexander s1500) (free-alexander s1600)
  )
  (:goal (scheduled))
)