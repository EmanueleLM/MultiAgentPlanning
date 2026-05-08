(define (problem schedule_meeting_instance)
  (:domain scheduling_meeting)
  (:objects
    david eric roger - person
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 t17_00 - time_slot
  )

  (:init
    ; David's availability
    (available_at david t9_00) (available_at david t9_30)
    (available_at david t10_00) (available_at david t10_30)
    (available_at david t11_00) (available_at david t11_30)
    (available_at david t12_00) (available_at david t12_30)
    (available_at david t13_00) (available_at david t13_30)
    (available_at david t14_00) (available_at david t14_30)
    (available_at david t15_00) (available_at david t15_30)
    (available_at david t16_00) (available_at david t16_30)
    (available_at david t17_00)

    ; Eric's availability
    (available_at eric t9_30) (available_at eric t10_00)
    (available_at eric t11_30) (available_at eric t12_00) (available_at eric t12_30)
    (available_at eric t13_00) (available_at eric t13_30)
    (available_at eric t14_00) (available_at eric t14_30)
    (available_at eric t16_00) (available_at eric t16_30) (available_at eric t17_00)

    ; Roger's availability
    (available_at roger t9_00) (available_at roger t9_30)
    (available_at roger t10_30) (available_at roger t12_00)
    (available_at roger t13_00) (available_at roger t13_30)
    (available_at roger t14_00)
    (available_at roger t16_30) (available_at roger t17_00)

    ; Meeting slot continuity
    (meeting_slot t9_00 t9_30) (meeting_slot t9_30 t10_00)
    (meeting_slot t10_00 t10_30) (meeting_slot t10_30 t11_00)
    (meeting_slot t11_00 t11_30) (meeting_slot t11_30 t12_00)
    (meeting_slot t12_00 t12_30) (meeting_slot t12_30 t13_00)
    (meeting_slot t13_00 t13_30) (meeting_slot t13_30 t14_00)
    (meeting_slot t14_00 t14_30) (meeting_slot t14_30 t15_00)
    (meeting_slot t15_00 t15_30) (meeting_slot t15_30 t16_00)
    (meeting_slot t16_00 t16_30) (meeting_slot t16_30 t17_00)
  )

  (:goal
    (exists (?t1 - time_slot ?t2 - time_slot)
      (meeting_scheduled david eric roger ?t1 ?t2))
  )
)