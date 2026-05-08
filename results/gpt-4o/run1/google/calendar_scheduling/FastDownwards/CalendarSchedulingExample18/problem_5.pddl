(define (problem schedule_meeting_instance)
  (:domain schedule_meeting)

  (:objects
    brian billy patricia - participant
    monday_9_00_to_9_30 monday_9_30_to_10_00 monday_10_00_to_10_30 
    monday_10_30_to_11_00 monday_11_00_to_11_30 monday_11_30_to_12_00 
    monday_12_00_to_12_30 monday_12_30_to_13_00 monday_13_30_to_14_00 
    monday_14_30_to_15_00 monday_15_00_to_15_30 monday_15_30_to_16_00 
    monday_16_00_to_16_30 - time_slot
  )

  (:init
    (available brian monday_9_00_to_9_30)
    (available brian monday_9_30_to_10_00)
    (available brian monday_10_00_to_10_30)
    (available brian monday_10_30_to_11_00)
    (available brian monday_11_00_to_11_30)
    (available brian monday_11_30_to_12_00)
    (available brian monday_12_00_to_12_30)
    (available brian monday_12_30_to_13_00)
    (available brian monday_13_30_to_14_00)
    (available brian monday_14_00_to_14_30)
    (available brian monday_15_00_to_15_30)
    (available brian monday_15_30_to_16_00)
    (available brian monday_16_00_to_16_30)

    (available billy monday_9_00_to_9_30)
    (available billy monday_9_30_to_10_00)
    (available billy monday_10_30_to_11_00)
    (available billy monday_11_00_to_11_30)
    (available billy monday_12_00_to_12_30)
    (available billy monday_12_30_to_13_00)
    (available billy monday_13_00_to_13_30)
    (available billy monday_14_30_to_15_00)
    (available billy monday_15_00_to_15_30)
    (available billy monday_15_30_to_16_00)
    (prefer_early billy monday_15_00_to_15_30)
   
    (available patricia monday_12_30_to_13_00)
    (available patricia monday_13_00_to_13_30)
    (available patricia monday_14_00_to_14_30)
    (available patricia monday_16_00_to_16_30)
  )

  (:goal
    (exists (?t - time_slot)
      (and
        (meeting_time ?t)
      )
    )
  )
)