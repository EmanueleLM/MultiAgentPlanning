(define (problem meeting_schedule_problem)
  (:domain meeting_scheduler)
  
  (:objects
    adam jerry matthew - participant
    9_00 9_30 10_00 10_30 11_00 11_30 12_00 12_30 13_00 13_30
    14_00 14_30 15_00 15_30 16_00 16_30 - time_slot
  )
  
  (:init
    (busy adam 10_00)
    (busy adam 12_30)
    (busy adam 13_30)
    (busy jerry 9_00)
    (busy jerry 12_00)
    (busy jerry 15_00)
    (busy matthew 9_30)
    (busy matthew 11_30)
    (busy matthew 13_00)
    (busy matthew 14_30)
    (consecutive 9_00 9_30)
    (consecutive 9_30 10_00)
    (consecutive 10_00 10_30)
    (consecutive 10_30 11_00)
    (consecutive 11_00 11_30)
    (consecutive 11_30 12_00)
    (consecutive 12_00 12_30)
    (consecutive 12_30 13_00)
    (consecutive 13_00 13_30)
    (consecutive 13_30 14_00)
    (consecutive 14_00 14_30)
    (consecutive 14_30 15_00)
    (consecutive 15_00 15_30)
    (consecutive 15_30 16_00)
    (consecutive 16_00 16_30)
  )

  (:goal
    (exists (?t - time_slot) (meeting_scheduled ?t))
  )
)