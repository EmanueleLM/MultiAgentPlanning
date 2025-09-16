(define (problem schedule-meeting-multiagent)
  (:domain multiagent-meet-scheduler)

  (:objects t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot)

  (:init
     ;; Joyce (Agent 1) availability
     (joyce-available t09_00)
     (joyce-available t09_30)
     (joyce-available t10_00)
     (joyce-available t10_30)
     (joyce-available t11_30)
     (joyce-available t12_00)
     (joyce-available t12_30)
     (joyce-available t13_00)
     (joyce-available t14_00)
     (joyce-available t16_30)

     (not (joyce-available t11_00))  ; Joyce busy 11:00–11:30
     (not (joyce-available t13_30))  ; Joyce busy 13:30–14:00
     (not (joyce-available t14_30))  ; Joyce busy 14:30–16:30
     (not (joyce-available t15_00))  ; Joyce busy 15:00–15:30
     (not (joyce-available t15_30))  ; Joyce busy 15:30–16:00
     (not (joyce-available t16_00))  ; Joyce busy 16:00–16:30

     ;; Christine (Agent 2) availability: cannot meet before 12:00
     (christine-available t12_00)
     (christine-available t12_30)
     (christine-available t13_00)
     (christine-available t13_30)
     (christine-available t14_00)
     (christine-available t14_30)
     (christine-available t15_00)
     (christine-available t15_30)
     (christine-available t16_00)
     (christine-available t16_30)

     (not (christine-available t09_00))
     (not (christine-available t09_30))
     (not (christine-available t10_00))
     (not (christine-available t10_30))
     (not (christine-available t11_00))
     (not (christine-available t11_30))

     ;; Alexander (Agent 3) availability (based on provided busy times)
     (alexander-available t11_00)
     (alexander-available t11_30)
     (alexander-available t12_30)
     (alexander-available t13_00)
     (alexander-available t15_00)
     (alexander-available t16_00)

     (not (alexander-available t09_00))
     (not (alexander-available t09_30))
     (not (alexander-available t10_00))
     (not (alexander-available t10_30))
     (not (alexander-available t12_00))
     (not (alexander-available t13_30))
     (not (alexander-available t14_00))
     (not (alexander-available t14_30))
     (not (alexander-available t15_30))
     (not (alexander-available t16_30))
  )

  ;; Goal: schedule a 30-minute meeting in one of the common feasible slots
  (:goal (or
     (meeting_at_joyce_christine_alexander t12_30)
     (meeting_at_joyce_christine_alexander t13_00)
  ))
)