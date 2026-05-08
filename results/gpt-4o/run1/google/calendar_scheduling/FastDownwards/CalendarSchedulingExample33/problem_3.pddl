(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)

  (:objects
    lisa bobby randy - participant
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - time_slot
  )

  (:init
    (busy lisa slot_9_00) (busy lisa slot_9_30)
    (busy lisa slot_10_30) (busy lisa slot_11_00)
    (busy lisa slot_12_30) (busy lisa slot_13_00)
    (busy lisa slot_16_00) (busy lisa slot_16_30)
    
    (busy bobby slot_9_00) (busy bobby slot_9_30)
    (busy bobby slot_10_00) (busy bobby slot_10_30)
    (busy bobby slot_11_30) (busy bobby slot_12_00)
    (busy bobby slot_15_00) (busy bobby slot_15_30)
    
    (busy randy slot_9_30) (busy randy slot_10_00)
    (busy randy slot_10_30) (busy randy slot_11_00)
    (busy randy slot_11_30) (busy randy slot_12_30)
    (busy randy slot_13_00) (busy randy slot_13_30)
    (busy randy slot_14_30) (busy randy slot_15_30)
    (busy randy slot_16_00) (busy randy slot_16_30)
    
    (meeting_preference bobby slot_15_00)
    (meeting_preference bobby slot_15_30)
    (meeting_preference bobby slot_16_00)
    (meeting_preference bobby slot_16_30)
    
    (next slot_9_00 slot_9_30) (next slot_9_30 slot_10_00)
    (next slot_10_00 slot_10_30) (next slot_10_30 slot_11_00)
    (next slot_11_00 slot_11_30) (next slot_11_30 slot_12_00)
    (next slot_12_00 slot_12_30) (next slot_12_30 slot_13_00)
    (next slot_13_00 slot_13_30) (next slot_13_30 slot_14_00)
    (next slot_14_00 slot_14_30) (next slot_14_30 slot_15_00)
    (next slot_15_00 slot_15_30) (next slot_15_30 slot_16_00)
    (next slot_16_00 slot_16_30)
    
    (available lisa slot_10_00) (available lisa slot_10_30)
    (available lisa slot_11_30) (available lisa slot_12_00)
    (available lisa slot_13_30) (available lisa slot_14_00)
    (available lisa slot_14_30) (available lisa slot_15_00)
    (available lisa slot_15_30)

    (available bobby slot_10_30) (available bobby slot_11_00)
    (available bobby slot_12_00) (available bobby slot_12_30)
    (available bobby slot_13_00) (available bobby slot_13_30)
    (available bobby slot_14_00) (available bobby slot_14_30)
    
    (available randy slot_9_00) (available randy slot_12_00)
    (available randy slot_13_30) (available randy slot_14_00)
    (available randy slot_15_00)
  )

  (:goal
    (exists (?t1 - time_slot ?t2 - time_slot)
      (meeting_scheduled ?t1 ?t2)
    )
  )
)