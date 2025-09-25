(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    margaret donna helen - agent
    slot-09_00 slot-09_30 slot-10_00 slot-10_30 slot-11_00 slot-11_30 slot-12_00 slot-12_30
    slot-13_00 slot-13_30 slot-14_00 slot-14_30 slot-15_00 slot-15_30 slot-16_00 slot-16_30 - slot
  )

  (:init
    ;; Margaret busy blocks (private information)
    (busy margaret slot-09_00)
    (busy margaret slot-09_30)
    (busy margaret slot-10_30)
    (busy margaret slot-11_30)
    (busy margaret slot-13_00)
    (busy margaret slot-15_00)

    ;; Donna busy blocks (private information)
    (busy donna slot-14_30)
    (busy donna slot-16_00)

    ;; Helen busy blocks and hard preference "Do not meet on Monday after 13:30" (private information)
    (busy helen slot-09_00)
    (busy helen slot-10_00)
    (busy helen slot-10_30)
    (busy helen slot-11_00)
    (busy helen slot-13_00)
    (busy helen slot-13_30)
    (busy helen slot-14_30)
    (busy helen slot-15_30)
    (busy helen slot-16_00)
    (busy helen slot-16_30)
  )

  (:goal (meeting_scheduled))
)