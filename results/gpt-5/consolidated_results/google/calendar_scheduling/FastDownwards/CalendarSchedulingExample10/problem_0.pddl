(define (problem schedule-monday-0930-1700)
  (:domain meeting-scheduling-strips)
  (:objects
    diana ethan janet - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ; selection phase is open
    (selection-open)

    ; enforce earliest-feasible-before-noon as a hard constraint: only the earliest feasible slot is selectable
    (free s1000)

    ; participant distinctness facts
    (distinct diana ethan) (distinct ethan diana)
    (distinct diana janet) (distinct janet diana)
    (distinct ethan janet) (distinct janet ethan)

    ; availability facts from inputs

    ; Diana
    (available diana s0900)
    (available diana s0930)
    (available diana s1000)
    (available diana s1030)
    (available diana s1100)
    (available diana s1200)
    (available diana s1230)
    (available diana s1330)
    (available diana s1400)
    (available diana s1430)
    (available diana s1500)
    (available diana s1530)
    (available diana s1600)
    (available diana s1630)

    ; Ethan (all slots)
    (available ethan s0900)
    (available ethan s0930)
    (available ethan s1000)
    (available ethan s1030)
    (available ethan s1100)
    (available ethan s1130)
    (available ethan s1200)
    (available ethan s1230)
    (available ethan s1300)
    (available ethan s1330)
    (available ethan s1400)
    (available ethan s1430)
    (available ethan s1500)
    (available ethan s1530)
    (available ethan s1600)
    (available ethan s1630)

    ; Janet
    (available janet s1000)
    (available janet s1030)
    (available janet s1100)
    (available janet s1130)
    (available janet s1200)
    (available janet s1300)
    (available janet s1330)
    (available janet s1500)
  )
  (:goal
    (and
      (meeting-scheduled)
    )
  )
)