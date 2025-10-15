(define (problem schedule-monday)
  (:domain meeting-schedule)
  (:objects
    theresa alexander virginia lisa natalie victoria
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630
  )
  (:init
    ; all participants available at all slots (no participant-specific unavailability provided)
    (available theresa s0900) (available theresa s0930) (available theresa s1000) (available theresa s1030)
    (available theresa s1100) (available theresa s1130) (available theresa s1200) (available theresa s1230)
    (available theresa s1300) (available theresa s1330) (available theresa s1400) (available theresa s1430)
    (available theresa s1500) (available theresa s1530) (available theresa s1600) (available theresa s1630)

    (available alexander s0900) (available alexander s0930) (available alexander s1000) (available alexander s1030)
    (available alexander s1100) (available alexander s1130) (available alexander s1200) (available alexander s1230)
    (available alexander s1300) (available alexander s1330) (available alexander s1400) (available alexander s1430)
    (available alexander s1500) (available alexander s1530) (available alexander s1600) (available alexander s1630)

    (available virginia s0900) (available virginia s0930) (available virginia s1000) (available virginia s1030)
    (available virginia s1100) (available virginia s1130) (available virginia s1200) (available virginia s1230)
    (available virginia s1300) (available virginia s1330) (available virginia s1400) (available virginia s1430)
    (available virginia s1500) (available virginia s1530) (available virginia s1600) (available virginia s1630)

    (available lisa s0900) (available lisa s0930) (available lisa s1000) (available lisa s1030)
    (available lisa s1100) (available lisa s1130) (available lisa s1200) (available lisa s1230)
    (available lisa s1300) (available lisa s1330) (available lisa s1400) (available lisa s1430)
    (available lisa s1500) (available lisa s1530) (available lisa s1600) (available lisa s1630)

    (available natalie s0900) (available natalie s0930) (available natalie s1000) (available natalie s1030)
    (available natalie s1100) (available natalie s1130) (available natalie s1200) (available natalie s1230)
    (available natalie s1300) (available natalie s1330) (available natalie s1400) (available natalie s1430)
    (available natalie s1500) (available natalie s1530) (available natalie s1600) (available natalie s1630)

    (available victoria s0900) (available victoria s0930) (available victoria s1000) (available victoria s1030)
    (available victoria s1100) (available victoria s1130) (available victoria s1200) (available victoria s1230)
    (available victoria s1300) (available victoria s1330) (available victoria s1400) (available victoria s1430)
    (available victoria s1500) (available victoria s1530) (available victoria s1600) (available victoria s1630)
  )
  (:goal (meeting-scheduled s0900))
)