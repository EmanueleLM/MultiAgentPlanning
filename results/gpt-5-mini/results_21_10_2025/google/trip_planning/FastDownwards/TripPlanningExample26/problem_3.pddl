(define (problem schedule-trip-16d)
  (:domain travel-scheduling)

  (:objects
    porto berlin reykjavik - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day

    p1 p2 p3 p4 p5 - slot
    b1 b2 b3 b4 b5 b6 - slot
    r1 r2 r3 r4 r5 - slot
  )

  (:init
    (flight porto berlin)
    (flight berlin porto)
    (flight berlin reykjavik)
    (flight reykjavik berlin)

    (day-next d1 d2)  (day-next d2 d3)  (day-next d3 d4)  (day-next d4 d5)
    (day-next d5 d6)  (day-next d6 d7)  (day-next d7 d8)  (day-next d8 d9)
    (day-next d9 d10) (day-next d10 d11)(day-next d11 d12)(day-next d12 d13)
    (day-next d13 d14)(day-next d14 d15)(day-next d15 d16)

    (at porto d1)
    (occupied d1)

    (slot-of p1 porto) (slot-of p2 porto) (slot-of p3 porto) (slot-of p4 porto) (slot-of p5 porto)
    (slot-of b1 berlin) (slot-of b2 berlin) (slot-of b3 berlin) (slot-of b4 berlin) (slot-of b5 berlin) (slot-of b6 berlin)
    (slot-of r1 reykjavik) (slot-of r2 reykjavik) (slot-of r3 reykjavik) (slot-of r4 reykjavik) (slot-of r5 reykjavik)

    (filled p1)

    (in_meeting_window d12) (in_meeting_window d13) (in_meeting_window d14) (in_meeting_window d15) (in_meeting_window d16)
  )

  (:goal
    (and
      (occupied d1) (occupied d2) (occupied d3) (occupied d4) (occupied d5)
      (occupied d6) (occupied d7) (occupied d8) (occupied d9) (occupied d10)
      (occupied d11) (occupied d12) (occupied d13) (occupied d14) (occupied d15) (occupied d16)

      (filled p1) (filled p2) (filled p3) (filled p4) (filled p5)
      (filled b1) (filled b2) (filled b3) (filled b4) (filled b5) (filled b6)
      (filled r1) (filled r2) (filled r3) (filled r4) (filled r5)

      (meeting_done)
    )
  )
)