(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling-integrated)
  (:objects
    gerald roy barbara - person

    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot
  )

  (:init
    (early t09_00) (early t09_30) (early t10_00) (early t10_30)
    (early t11_00) (early t11_30) (early t12_00) (early t12_30)

    (free-at gerald t09_30)
    (free-at gerald t10_00)
    (free-at gerald t10_30)
    (free-at gerald t11_00)
    (free-at gerald t11_30)
    (free-at gerald t12_00)
    (free-at gerald t12_30)
    (free-at gerald t14_00)
    (free-at gerald t14_30)
    (free-at gerald t15_30)

    (free-at roy t09_00) (free-at roy t09_30) (free-at roy t10_00) (free-at roy t10_30)
    (free-at roy t11_00) (free-at roy t11_30) (free-at roy t12_00) (free-at roy t12_30)
    (free-at roy t13_00) (free-at roy t13_30) (free-at roy t14_00) (free-at roy t14_30)
    (free-at roy t15_00) (free-at roy t15_30) (free-at roy t16_00) (free-at roy t16_30)

    (free-at barbara t09_00) (free-at barbara t09_30) (free-at barbara t10_00) (free-at barbara t10_30)
    (free-at barbara t11_00) (free-at barbara t11_30) (free-at barbara t12_00) (free-at barbara t12_30)
    (free-at barbara t13_00) (free-at barbara t13_30) (free-at barbara t14_00) (free-at barbara t14_30)
    (free-at barbara t15_00) (free-at barbara t15_30) (free-at barbara t16_00) (free-at barbara t16_30)

    (slot2 t09_00) (slot2 t09_30) (slot2 t10_00) (slot2 t10_30)
    (slot2 t11_00) (slot2 t11_30) (slot2 t12_00) (slot2 t12_30)
    (slot2 t13_00) (slot2 t13_30) (slot2 t14_00) (slot2 t14_30)
    (slot2 t15_00) (slot2 t15_30) (slot2 t16_00) (slot2 t16_30)

    (free2 roy t09_00) (free2 roy t09_30) (free2 roy t10_00) (free2 roy t10_30)
    (free2 roy t11_00) (free2 roy t11_30) (free2 roy t12_00) (free2 roy t12_30)
    (free2 roy t13_00) (free2 roy t13_30) (free2 roy t14_00) (free2 roy t14_30)
    (free2 roy t15_00) (free2 roy t15_30) (free2 roy t16_00) (free2 roy t16_30)

    (common-available t10_00)

    (participant3 barbara) (participant3 gerald) (participant3 roy)

    (free3 barbara t09_00)
    (free3 barbara t10_00)
    (free3 barbara t10_30)
    (free3 barbara t11_00)
    (free3 barbara t14_00)
    (free3 barbara t15_00)

    (free3 gerald t10_00)
    (free3 roy t10_00)
  )

  (:goal (and
           (meeting-scheduled-global)
           (meeting-at-global t10_00)
         )
  )
)