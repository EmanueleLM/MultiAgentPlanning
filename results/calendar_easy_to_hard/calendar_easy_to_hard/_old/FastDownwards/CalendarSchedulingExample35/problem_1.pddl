(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30
  )
  (:init
    (slot t09_00) (slot t09_30) (slot t10_00) (slot t10_30)
    (slot t11_00) (slot t11_30) (slot t12_00) (slot t12_30)
    (slot t13_00) (slot t13_30) (slot t14_00) (slot t14_30)
    (slot t15_00) (slot t15_30) (slot t16_00) (slot t16_30)
    (unscheduled)
    ;; Diane: available all day but prefers to avoid meetings after 15:30,
    ;; so only slots starting at or before 15:00 are marked available.
    (available-diane t09_00) (available-diane t09_30)
    (available-diane t10_00) (available-diane t10_30)
    (available-diane t11_00) (available-diane t11_30)
    (available-diane t12_00) (available-diane t12_30)
    (available-diane t13_00) (available-diane t13_30)
    (available-diane t14_00) (available-diane t14_30)
    (available-diane t15_00)
    ;; Helen: available all work hours
    (available-helen t09_00) (available-helen t09_30) (available-helen t10_00) (available-helen t10_30)
    (available-helen t11_00) (available-helen t11_30) (available-helen t12_00) (available-helen t12_30)
    (available-helen t13_00) (available-helen t13_30) (available-helen t14_00) (available-helen t14_30)
    (available-helen t15_00) (available-helen t15_30) (available-helen t16_00) (available-helen t16_30)
    ;; Arthur: available all work hours
    (available-arthur t09_00) (available-arthur t09_30) (available-arthur t10_00) (available-arthur t10_30)
    (available-arthur t11_00) (available-arthur t11_30) (available-arthur t12_00) (available-arthur t12_30)
    (available-arthur t13_00) (available-arthur t13_30) (available-arthur t14_00) (available-arthur t14_30)
    (available-arthur t15_00) (available-arthur t15_30) (available-arthur t16_00) (available-arthur t16_30)
    ;; Ethan: busy 09:00-09:30, 10:00-10:30, 11:00-12:30, 13:30-15:00
    ;; Available slots computed accordingly
    (available-ethan t09_30) (available-ethan t10_30)
    (available-ethan t12_30) (available-ethan t13_00)
    (available-ethan t15_00) (available-ethan t15_30)
    (available-ethan t16_00) (available-ethan t16_30)
    ;; Beverly: busy 09:00-10:00, 10:30-11:00, 11:30-12:30, 13:30-15:30, 16:30-17:00
    (available-beverly t10_00) (available-beverly t11_00)
    (available-beverly t12_30) (available-beverly t13_00)
    (available-beverly t15_30) (available-beverly t16_00)
    ;; Deborah: busy 09:00-11:00, 12:30-13:00, 13:30-14:30, 15:00-15:30, 16:00-17:00
    (available-deborah t11_00) (available-deborah t11_30)
    (available-deborah t12_00) (available-deborah t13_00)
    (available-deborah t14_30) (available-deborah t15_30)
  )
  (:goal (meeting-scheduled))
)