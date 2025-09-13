(define (problem integrated_find_meeting_slot)
  (:domain integrated_meeting_scheduler)

  (:objects
      9_00 9_30 10_00 10_30 11_00 11_30 12_00 12_30
      13_00 13_30 14_00 14_30 15_00 15_30 16_00 16_30 17_00 
      - time
      slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 
      slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 
      slot_14_30 slot_15_00 slot_15_30 slot_16_00 
      - slot
  )

  (:init
    (available 9_00 9_30) 
    (available 9_30 10_00) 
    (available 10_00 10_30) 
    (available 10_30 11_00) 
    (available 11_30 12_00) 
    (available 12_00 12_30)
    (available 12_30 13_00)
    (available 13_00 13_30)
    (available 13_30 14_00)
    (available 14_30 15_00)
    (available 15_00 15_30)
    (available 16_00 16_30)

    (available_slot slot_9_00)
    (available_slot slot_9_30)
    (available_slot slot_10_00)
    (available_slot slot_10_30)
    (available_slot slot_11_00)
    (available_slot slot_12_00)
    (available_slot slot_12_30)
    (available_slot slot_13_00)
    (available_slot slot_13_30)
    (available_slot slot_14_00)
    (available_slot slot_14_30)
    (available_slot slot_15_00)
    (available_slot slot_15_30)
    (available_slot slot_16_00)

    (busy 11_00 11_30)
    (busy 14_00 14_30)
    (busy 15_30 16_00)
    (busy 16_30 17_00)
  )

  (:goal
    (exists (?start ?end - time) 
      (and (scheduled ?start ?end) 
           (or 
               (and (= ?start 9_00) (= ?end 9_30))
               (and (= ?start 9_30) (= ?end 10_00))
               (and (= ?start 10_00) (= ?end 10_30))
               (and (= ?start 10_30) (= ?end 11_00))
               (and (= ?start 11_30) (= ?end 12_00))
               (and (= ?start 12_00) (= ?end 12_30))
               (and (= ?start 12_30) (= ?end 13_00))
               (and (= ?start 13_00) (= ?end 13_30))
               (and (= ?start 13_30) (= ?end 14_00))
               (and (= ?start 14_30) (= ?end 15_00))
               (and (= ?start 15_00) (= ?end 15_30))
               (and (= ?start 16_00) (= ?end 16_30))
           )
      )
    )
  )
)