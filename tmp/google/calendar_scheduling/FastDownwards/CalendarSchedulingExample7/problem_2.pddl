(define (problem schedule-monday-integrated)
  (:domain integrated-meeting-scheduling)
  (:objects
    heather nicholas zachary - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )

  (:init
    (slot t0) (slot t1) (slot t2) (slot t3) (slot t4) (slot t5)
    (slot t6) (slot t7) (slot t8) (slot t9) (slot t10) (slot t11)
    (slot t12) (slot t13) (slot t14) (slot t15)

    (slot-available t0) (slot-available t1) (slot-available t2) (slot-available t3)
    (slot-available t4) (slot-available t5) (slot-available t6) (slot-available t7)
    (slot-available t8) (slot-available t9) (slot-available t10) (slot-available t11)
    (slot-available t12) (slot-available t13) (slot-available t14) (slot-available t15)

    (preferred-slot t0) (preferred-slot t1) (preferred-slot t2) (preferred-slot t3)
    (preferred-slot t4) (preferred-slot t5) (preferred-slot t6) (preferred-slot t7)
    (preferred-slot t8) (preferred-slot t9)

    (free heather t1) (free heather t2) (free heather t4) (free heather t5)
    (free heather t6) (free heather t7) (free heather t10)
    (free heather t12) (free heather t13) (free heather t15)

    (free nicholas t0) (free nicholas t1) (free nicholas t2) (free nicholas t3)
    (free nicholas t4) (free nicholas t5) (free nicholas t6) (free nicholas t7)
    (free nicholas t8) (free nicholas t9) (free nicholas t10) (free nicholas t11)
    (free nicholas t12) (free nicholas t13) (free nicholas t14) (free nicholas t15)

    (free zachary t3)
    (free zachary t6)
    (free zachary t8)
    (free zachary t15)
  )

  (:goal (and
    (meeting-scheduled)
    (attends heather)
    (attends nicholas)
    (attends zachary)
  ))
)