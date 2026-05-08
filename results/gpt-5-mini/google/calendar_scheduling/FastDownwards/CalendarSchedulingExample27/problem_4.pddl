(define (problem calendar_scheduling_example27)
  (:domain calendar_scheduling)

  (:objects
    jesse kathryn megan - person
  )

  (:init
    (slot_free s0900)
    (slot_free s0930)
    (slot_free s1100)
    (slot_free s1230)
    (slot_free s1300)
    (slot_free s1430)
    (slot_free s1630)
  )

  (:goal (meeting_scheduled))
)