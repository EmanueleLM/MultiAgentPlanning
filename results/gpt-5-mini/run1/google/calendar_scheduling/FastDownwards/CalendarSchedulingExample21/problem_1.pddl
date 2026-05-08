(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    bobby scott kimberly - person
    s0900 s0915 s0930 s0945 s1000 s1015 s1030 s1045
    s1100 s1115 s1130 s1145 s1200 s1215 s1230 s1245
    s1300 s1315 s1330 s1345 s1400 s1415 s1430 s1445
    s1500 s1515 s1530 s1545 s1600 s1615 s1630 s1645 - slot
  )

  (:init
    ;; seq4 facts: consecutive 4-slot sequences (start through start+45min)
    (seq4 s0900 s0915 s0930 s0945)
    (seq4 s0915 s0930 s0945 s1000)
    (seq4 s0930 s0945 s1000 s1015)
    (seq4 s0945 s1000 s1015 s1030)
    (seq4 s1000 s1015 s1030 s1045)
    (seq4 s1015 s1030 s1045 s1100)
    (seq4 s1030 s1045 s1100 s1115)
    (seq4 s1045 s1100 s1115 s1130)
    (seq4 s1100 s1115 s1130 s1145)
    (seq4 s1115 s1130 s1145 s1200)
    (seq4 s1130 s1145 s1200 s1215)
    (seq4 s1145 s1200 s1215 s1230)
    (seq4 s1200 s1215 s1230 s1245)
    (seq4 s1215 s1230 s1245 s1300)
    (seq4 s1230 s1245 s1300 s1315)
    (seq4 s1245 s1300 s1315 s1330)
    (seq4 s1300 s1315 s1330 s1345)
    (seq4 s1315 s1330 s1345 s1400)
    (seq4 s1330 s1345 s1400 s1415)
    (seq4 s1345 s1400 s1415 s1430)
    (seq4 s1400 s1415 s1430 s1445)
    (seq4 s1415 s1430 s1445 s1500)
    (seq4 s1430 s1445 s1500 s1515)
    (seq4 s1445 s1500 s1515 s1530)
    (seq4 s1500 s1515 s1530 s1545)
    (seq4 s1515 s1530 s1545 s1600)
    (seq4 s1530 s1545 s1600 s1615)
    (seq4 s1545 s1600 s1615 s1630)
    (seq4 s1600 s1615 s1630 s1645)

    ;; Bobby: no busy events -> free all 15-min slots
    (free bobby s0900) (free bobby s0915) (free bobby s0930) (free bobby s0945)
    (free bobby s1000) (free bobby s1015) (free bobby s1030) (free bobby s1045)
    (free bobby s1100) (free bobby s1115) (free bobby s1130) (free bobby s1145)
    (free bobby s1200) (free bobby s1215) (free bobby s1230) (free bobby s1245)
    (free bobby s1300) (free bobby s1315) (free bobby s1330) (free bobby s1345)
    (free bobby s1400) (free bobby s1415) (free bobby s1430) (free bobby s1445)
    (free bobby s1500) (free bobby s1515) (free bobby s1530) (free bobby s1545)
    (free bobby s1600) (free bobby s1615) (free bobby s1630) (free bobby s1645)

    ;; Scott: busy 11:30-12:00 (s1130,s1145) and 15:30-16:00 (s1530,s1545) -> those are NOT free; all other slots free
    (free scott s0900) (free scott s0915) (free scott s0930) (free scott s0945)
    (free scott s1000) (free scott s1015) (free scott s1030) (free scott s1045)
    (free scott s1100) (free scott s1115)
    ;; s1130 and s1145 are busy for Scott -> omitted
    (free scott s1200) (free scott s1215) (free scott s1230) (free scott s1245)
    (free scott s1300) (free scott s1315) (free scott s1330) (free scott s1345)
    (free scott s1400) (free scott s1415) (free scott s1430) (free scott s1445)
    (free scott s1500) (free scott s1515)
    ;; s1530 and s1545 are busy for Scott -> omitted
    (free scott s1600) (free scott s1615) (free scott s1630) (free scott s1645)

    ;; Kimberly: busy 11:00-12:00 (s1100,s1115,s1130,s1145),
    ;; 12:30-13:00 (s1230,s1245),
    ;; 13:30-14:00 (s1330,s1345),
    ;; 14:30-15:00 (s1430,s1445),
    ;; 15:30-17:00 (s1530,s1545,s1600,s1615,s1630,s1645)
    ;; thus free at remaining slots:
    (free kimberly s0900) (free kimberly s0915) (free kimberly s0930) (free kimberly s0945)
    (free kimberly s1000) (free kimberly s1015) (free kimberly s1030) (free kimberly s1045)
    ;; s1100 s1115 s1130 s1145 busy -> omitted
    (free kimberly s1200) (free kimberly s1215)
    ;; s1230 s1245 busy -> omitted
    (free kimberly s1300) (free kimberly s1315)
    ;; s1330 s1345 busy -> omitted
    (free kimberly s1400) (free kimberly s1415)
    ;; s1430 s1445 busy -> omitted
    (free kimberly s1500) (free kimberly s1515)
    ;; s1530..s1645 busy -> omitted

  )

  (:goal (scheduled_any))
)