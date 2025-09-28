(define (problem CalendarSchedulingExample37)
  (:domain calendar-scheduling)
  (:objects
    ronald stephen brittany dorothy rebecca jordan - person
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )
  (:init
    (free ronald t09_00) (free ronald t09_30) (free ronald t10_00) (free ronald t10_30)
    (free ronald t11_00) (free ronald t11_30) (free ronald t12_00) (free ronald t12_30)
    (free ronald t13_00) (free ronald t13_30) (free ronald t14_00) (free ronald t14_30)
    (free ronald t15_00) (free ronald t15_30) (free ronald t16_00) (free ronald t16_30)

    (free stephen t09_00) (free stephen t09_30) (free stephen t10_30)
    (free stephen t11_00) (free stephen t11_30)
    (free stephen t12_30) (free stephen t13_00) (free stephen t13_30)
    (free stephen t14_00) (free stephen t14_30) (free stephen t15_00)
    (free stephen t15_30) (free stephen t16_00) (free stephen t16_30)

    (free brittany t09_00) (free brittany t09_30) (free brittany t10_00) (free brittany t10_30)
    (free brittany t11_30) (free brittany t12_00) (free brittany t12_30)
    (free brittany t13_00) (free brittany t14_00) (free brittany t14_30)
    (free brittany t15_00) (free brittany t16_00)

    (free dorothy t09_30) (free dorothy t10_30) (free dorothy t12_30) (free dorothy t15_00)

    (free rebecca t09_00) (free rebecca t10_30) (free rebecca t11_30) (free rebecca t12_30)

    (free jordan t09_30) (free jordan t11_00) (free jordan t12_00)
    (free jordan t12_30) (free jordan t15_00) (free jordan t16_30)
  )
  (:goal (meeting-scheduled))
)