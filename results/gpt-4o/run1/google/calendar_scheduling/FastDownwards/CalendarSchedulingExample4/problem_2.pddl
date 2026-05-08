(define (problem schedule_meeting_problem)
  (:domain meeting_scheduling)
  
  (:objects
    donna john billy - person
    time_09_00 time_09_30 time_10_00 time_10_30 time_11_00 time_11_30
    time_12_00 time_12_30 time_13_00 time_13_30 time_14_00 time_14_30
    time_15_00 time_15_30 time_16_00 time_16_30 - time_slot
  )
  
  (:init
    (busy donna time_14_00)
    (busy donna time_14_30)
    (busy donna time_15_30)
    (busy donna time_16_00)
    (busy john time_11_00)
    (busy john time_11_30)
    (busy john time_16_30)
    (busy john time_17_00)
    (busy billy time_09_00)
    (busy billy time_09_30)
    (busy billy time_10_00)
    (busy billy time_10_30)
    (busy billy time_11_00)
    (busy billy time_11_30)
    (busy billy time_12_00)
    (busy billy time_12_30)
    (busy billy time_13_00)
    (busy billy time_14_00)
    (busy billy time_14_30)
    (busy billy time_15_00)
    (busy billy time_15_30)
    (busy billy time_16_00)
    (busy billy time_16_30)
    (busy billy time_17_00)

    (consecutive time_09_00 time_09_30)
    (consecutive time_09_30 time_10_00)
    (consecutive time_10_00 time_10_30)
    (consecutive time_10_30 time_11_00)
    (consecutive time_11_00 time_11_30)
    (consecutive time_11_30 time_12_00)
    (consecutive time_12_00 time_12_30)
    (consecutive time_12_30 time_13_00)
    (consecutive time_13_00 time_13_30)
    (consecutive time_13_30 time_14_00)
    (consecutive time_14_00 time_14_30)
    (consecutive time_14_30 time_15_00)
    (consecutive time_15_00 time_15_30)
    (consecutive time_15_30 time_16_00)
    (consecutive time_16_00 time_16_30)
  )

  (:goal 
    (exists (?t1 ?t2 - time_slot)
      (and 
        (meeting_scheduled ?t1 ?t2)
      )
    )
  )
)