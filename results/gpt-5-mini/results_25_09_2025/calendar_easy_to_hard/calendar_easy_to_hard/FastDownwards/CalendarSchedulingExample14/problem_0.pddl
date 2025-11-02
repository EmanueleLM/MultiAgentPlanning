(define (problem schedule-meeting-monday)
  (:domain multiagent-meeting)

  (:objects
    brandon jerry bradley - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Brandon's availability:
    ;; Brandon has meetings on Monday 13:00-14:00 (blocks s1300 and s1330),
    ;; 15:30-16:00 (blocks s1530), and 16:30-17:00 (blocks s1630).
    ;; He prefers to avoid meetings before 14:30 (we encode preferred slots >= 14:30).
    (available brandon s0900)
    (available brandon s0930)
    (available brandon s1000)
    (available brandon s1030)
    (available brandon s1100)
    (available brandon s1130)
    (available brandon s1200)
    (available brandon s1230)
    (available brandon s1400)
    (available brandon s1430)
    (available brandon s1500)
    (available brandon s1600)
    ;; Note: s1300, s1330, s1530, s1630 are not marked available (busy).

    ;; Jerry's availability: no meetings on Monday => available all slots
    (available jerry s0900) (available jerry s0930) (available jerry s1000) (available jerry s1030)
    (available jerry s1100) (available jerry s1130) (available jerry s1200) (available jerry s1230)
    (available jerry s1300) (available jerry s1330) (available jerry s1400) (available jerry s1430)
    (available jerry s1500) (available jerry s1530) (available jerry s1600) (available jerry s1630)

    ;; Bradley's availability:
    ;; Bradley has meetings 09:00-11:30 (blocks s0900,s0930,s1000,s1030,s1100),
    ;; 12:00-15:00 (blocks s1200,s1230,s1300,s1330,s1400,s1430), and 16:00-16:30 (blocks s1600).
    ;; So Bradley is free at s1130, s1500, s1530, s1630.
    (available bradley s1130)
    (available bradley s1500)
    (available bradley s1530)
    (available bradley s1630)

    ;; Brandon's preference encoded: prefer slots starting at or after 14:30
    (preferred s1430)
    (preferred s1500)
    (preferred s1530)
    (preferred s1600)
    (preferred s1630)
  )

  ;; Goal: a 30-minute meeting between 09:00 and 17:00 on Monday scheduled and attended by all.
  ;; Because slots represent 30-minute start times between 09:00 and 16:30, scheduling any slot yields a 30-minute meeting.
  (:goal (meeting-scheduled))
)