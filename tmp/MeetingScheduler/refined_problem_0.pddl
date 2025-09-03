(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    michelle - person

    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot

    m0900 m0930 m1000 m1030 m1100 m1130 m1200 m1230
    m1300 m1330 m1400 m1430 m1500 m1530 m1600 m1630 - slot
  )

  (:init
    (= (total-cost) 0)

    (next s09_00 s09_30) (next s09_30 s10_00) (next s10_00 s10_30) (next s10_30 s11_00)
    (next s11_00 s11_30) (next s11_30 s12_00) (next s12_00 s12_30) (next s12_30 s13_00)
    (next s13_00 s13_30) (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00) (next s16_00 s16_30)

    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    (slot_steven s0900) (slot_steven s0930) (slot_steven s1000) (slot_steven s1030)
    (slot_steven s1100) (slot_steven s1130) (slot_steven s1200) (slot_steven s1230)
    (slot_steven s1300) (slot_steven s1330) (slot_steven s1400) (slot_steven s1430)
    (slot_steven s1500) (slot_steven s1530) (slot_steven s1600) (slot_steven s1630)

    (next m0900 m0930) (next m0930 m1000) (next m1000 m1030) (next m1030 m1100)
    (next m1100 m1130) (next m1130 m1200) (next m1200 m1230) (next m1230 m1300)
    (next m1300 m1330) (next m1330 m1400) (next m1400 m1430) (next m1430 m1500)
    (next m1500 m1530) (next m1530 m1600) (next m1600 m1630)

    (same-slot s09_00 s0900) (same-slot s0900 s09_00)
    (same-slot s09_00 m0900) (same-slot m0900 s09_00)
    (same-slot s0900 m0900) (same-slot m0900 s0900)
    (same-slot s09_30 s0930) (same-slot s0930 s09_30)
    (same-slot s09_30 m0930) (same-slot m0930 s09_30)
    (same-slot s0930 m0930) (same-slot m0930 s0930)
    (same-slot s10_00 s1000) (same-slot s1000 s10_00)
    (same-slot s10_00 m1000) (same-slot m1000 s10_00)
    (same-slot s1000 m1000) (same-slot m1000 s1000)
    (same-slot s10_30 s1030) (same-slot s1030 s10_30)
    (same-slot s10_30 m1030) (same-slot m1030 s10_30)
    (same-slot s1030 m1030) (same-slot m1030 s1030)
    (same-slot s11_00 s1100) (same-slot s1100 s11_00)
    (same-slot s11_00 m1100) (same-slot m1100 s11_00)
    (same-slot s1100 m1100) (same-slot m1100 s1100)
    (same-slot s11_30 s1130) (same-slot s1130 s11_30)
    (same-slot s11_30 m1130) (same-slot m1130 s11_30)
    (same-slot s1130 m1130) (same-slot m1130 s1130)
    (same-slot s12_00 s1200) (same-slot s1200 s12_00)
    (same-slot s12_00 m1200) (same-slot m1200 s12_00)
    (same-slot s1200 m1200) (same-slot m1200 s1200)
    (same-slot s12_30 s1230) (same-slot s1230 s12_30)
    (same-slot s12_30 m1230) (same-slot m1230 s12_30)
    (same-slot s1230 m1230) (same-slot m1230 s1230)
    (same-slot s13_00 s1300) (same-slot s1300 s13_00)
    (same-slot s13_00 m1300) (same-slot m1300 s13_00)
    (same-slot s1300 m1300) (same-slot m1300 s1300)
    (same-slot s13_30 s1330) (same-slot s1330 s13_30)
    (same-slot s13_30 m1330) (same-slot m1330 s13_30)
    (same-slot s1330 m1330) (same-slot m1330 s1330)
    (same-slot s14_00 s1400) (same-slot s1400 s14_00)
    (same-slot s14_00 m1400) (same-slot m1400 s14_00)
    (same-slot s1400 m1400) (same-slot m1400 s1400)
    (same-slot s14_30 s1430) (same-slot s1430 s14_30)
    (same-slot s14_30 m1430) (same-slot m1430 s14_30)
    (same-slot s1430 m1430) (same-slot m1430 s1430)
    (same-slot s15_00 s1500) (same-slot s1500 s15_00)
    (same-slot s15_00 m1500) (same-slot m1500 s15_00)
    (same-slot s1500 m1500) (same-slot m1500 s1500)
    (same-slot s15_30 s1530) (same-slot s1530 s15_30)
    (same-slot s15_30 m1530) (same-slot m1530 s15_30)
    (same-slot s1530 m1530) (same-slot m1530 s1530)
    (same-slot s16_00 s1600) (same-slot s1600 s16_00)
    (same-slot s16_00 m1600) (same-slot m1600 s16_00)
    (same-slot s1600 m1600) (same-slot m1600 s1600)
    (same-slot s16_30 s1630) (same-slot s1630 s16_30)
    (same-slot s16_30 m1630) (same-slot m1630 s16_30)
    (same-slot s1630 m1630) (same-slot m1630 s1630)

    (available_p1 michelle s09_00) (available_p1 michelle s09_30)
    (available_p1 michelle s10_00) (available_p1 michelle s10_30)
    (available_p1 michelle s12_00) (available_p1 michelle s12_30)
    (available_p1 michelle s13_00) (available_p1 michelle s13_30)
    (available_p1 michelle s14_00) (available_p1 michelle s14_30)
    (available_p1 michelle s15_00) (available_p1 michelle s15_30)
    (available_p1 michelle s16_00) (available_p1 michelle s16_30)

    (free_steven s0930) (free_steven s1000) (free_steven s1030)
    (free_steven s1100) (free_steven s1200) (free_steven s1230)
    (free_steven s1300) (free_steven s1400) (free_steven s1430)
    (free_steven s1500) (free_steven s1600) (free_steven s1630)

    (available_p3 m0930)
    (available_p3 m1100)
    (available_p3 m1230)
    (available_p3 m1430)
    (available_p3 m1500)
    (available_p3 m1600)
  )

  (:goal (meeting_scheduled_global))
  (:metric minimize (total-cost))
)