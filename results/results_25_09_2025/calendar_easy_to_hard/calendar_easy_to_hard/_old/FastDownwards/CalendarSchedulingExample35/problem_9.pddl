(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    diane helen arthur ethan beverly deborah - person
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )
  (:init
    (unscheduled)
    (available diane t09_00) (available diane t09_30)
    (available diane t10_00) (available diane t10_30)
    (available diane t11_00) (available diane t11_30)
    (available diane t12_00) (available diane t12_30)
    (available diane t13_00) (available diane t13_30)
    (available diane t14_00) (available diane t14_30)
    (available diane t15_00)

    (available helen t09_00) (available helen t09_30)
    (available helen t10_00) (available helen t10_30)
    (available helen t11_00) (available helen t11_30)
    (available helen t12_00) (available helen t12_30)
    (available helen t13_00) (available helen t13_30)
    (available helen t14_00) (available helen t14_30)
    (available helen t15_00) (available helen t15_30)
    (available helen t16_00) (available helen t16_30)

    (available arthur t09_00) (available arthur t09_30)
    (available arthur t10_00) (available arthur t10_30)
    (available arthur t11_00) (available arthur t11_30)
    (available arthur t12_00) (available arthur t12_30)
    (available arthur t13_00) (available arthur t13_30)
    (available arthur t14_00) (available arthur t14_30)
    (available arthur t15_00) (available arthur t15_30)
    (available arthur t16_00) (available arthur t16_30)

    (available ethan t09_30) (available ethan t10_30)
    (available ethan t12_30) (available ethan t13_00)
    (available ethan t15_00) (available ethan t15_30)
    (available ethan t16_00) (available ethan t16_30)

    (available beverly t10_00) (available beverly t11_00)
    (available beverly t12_30) (available beverly t13_00)
    (available beverly t15_30) (available beverly t16_00)

    (available deborah t11_00) (available deborah t11_30)
    (available deborah t12_00) (available deborah t13_00)
    (available deborah t14_30) (available deborah t15_30)
  )
  (:goal (meeting-scheduled))
)