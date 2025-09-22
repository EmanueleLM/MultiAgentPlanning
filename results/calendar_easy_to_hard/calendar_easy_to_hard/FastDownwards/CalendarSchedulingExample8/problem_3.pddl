(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    monday - day
    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230
    slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
  )

  (:init
    (work-slot slot0900) (work-slot slot0930) (work-slot slot1000) (work-slot slot1030)
    (work-slot slot1100) (work-slot slot1130) (work-slot slot1200) (work-slot slot1230)
    (work-slot slot1300) (work-slot slot1330) (work-slot slot1400) (work-slot slot1430)
    (work-slot slot1500) (work-slot slot1530) (work-slot slot1600) (work-slot slot1630)

    (busy adam slot1000)
    (busy adam slot1230)
    (busy adam slot1330)
    (busy adam slot1400)

    (busy jerry slot0900)
    (busy jerry slot1200)
    (busy jerry slot1500)
    (busy jerry slot1530)

    (busy matthew slot0930)
    (busy matthew slot1000)
    (busy matthew slot1030)
    (busy matthew slot1130)
    (busy matthew slot1200)
    (busy matthew slot1300)
    (busy matthew slot1330)
    (busy matthew slot1430)
    (busy matthew slot1500)
    (busy matthew slot1530)
    (busy matthew slot1600)
    (busy matthew slot1630)
  )

  (:goal (and
    (meeting-scheduled)
    (meeting-at slot1100)
    (attending adam monday slot1100)
    (attending jerry monday slot1100)
    (attending matthew monday slot1100)
  ))
)