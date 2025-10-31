(define (problem integrated-schedule-monday)
  (:domain integrated-scheduling)
  (:objects
    adam jerry matthew - person
    m1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (is-meeting m1)
    (meeting-participant m1 adam) (meeting-participant m1 jerry) (meeting-participant m1 matthew)

    (is-slot s0900) (is-slot s0930) (is-slot s1000) (is-slot s1030)
    (is-slot s1100) (is-slot s1130) (is-slot s1200) (is-slot s1230)
    (is-slot s1300) (is-slot s1330) (is-slot s1400) (is-slot s1430)
    (is-slot s1500) (is-slot s1530) (is-slot s1600) (is-slot s1630)

    (slot-free s0900) (slot-free s0930) (slot-free s1000) (slot-free s1030)
    (slot-free s1100) (slot-free s1130) (slot-free s1200) (slot-free s1230)
    (slot-free s1300) (slot-free s1330) (slot-free s1400) (slot-free s1430)
    (slot-free s1500) (slot-free s1530) (slot-free s1600) (slot-free s1630)

    (available adam s0900) (available adam s0930)
    (available adam s1030) (available adam s1100) (available adam s1130)
    (available adam s1200) (available adam s1300)
    (available adam s1430) (available adam s1500) (available adam s1530)
    (available adam s1600) (available adam s1630)

    (busy adam s1000) (busy adam s1230) (busy adam s1330) (busy adam s1400)

    (free adam s0900) (free adam s0930) (free adam s1000) (free adam s1030)
    (free adam s1100) (free adam s1130) (free adam s1200) (free adam s1230)
    (free adam s1300) (free adam s1330) (free adam s1400) (free adam s1430)
    (free adam s1500) (free adam s1530) (free adam s1600) (free adam s1630)

    (free matthew s0900) (free matthew s0930) (free matthew s1000) (free matthew s1030)
    (free matthew s1100) (free matthew s1130) (free matthew s1200) (free matthew s1230)
    (free matthew s1300) (free matthew s1330) (free matthew s1400) (free matthew s1430)
    (free matthew s1500) (free matthew s1530) (free matthew s1600) (free matthew s1630)

    (free jerry s0930) (free jerry s1000) (free jerry s1030)
    (free jerry s1100) (free jerry s1130) (free jerry s1230)
    (free jerry s1300) (free jerry s1330) (free jerry s1400)
    (free jerry s1430) (free jerry s1600) (free jerry s1630)

    (busy jerry s0900) (busy jerry s1200) (busy jerry s1500) (busy jerry s1530)

    (busy matthew s0930) (busy matthew s1000) (busy matthew s1030)
    (busy matthew s1130) (busy matthew s1200)
    (busy matthew s1300) (busy matthew s1330)
    (busy matthew s1430) (busy matthew s1500) (busy matthew s1530) (busy matthew s1600) (busy matthew s1630)
  )

  (:goal (exists (?s - slot) (meeting_scheduled ?s)))
)