(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    shirley jacob stephen margaret mason - person
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )
  (:init
    (unscheduled)
    ; shirley free (busy at 10:30 and 12:00)
    (free shirley t09_00) (free shirley t09_30) (free shirley t10_00) (free shirley t11_00) (free shirley t11_30)
    (free shirley t12_30) (free shirley t13_00) (free shirley t13_30) (free shirley t14_00) (free shirley t14_30)
    (free shirley t15_00) (free shirley t15_30) (free shirley t16_00) (free shirley t16_30)
    ; jacob free (busy at 09:00,10:00,11:00,12:30,13:00,14:30)
    (free jacob t09_30) (free jacob t10_30) (free jacob t11_30) (free jacob t12_00)
    (free jacob t13_30) (free jacob t14_00) (free jacob t15_00) (free jacob t15_30) (free jacob t16_00) (free jacob t16_30)
    ; stephen free (busy at 11:30 and 12:30)
    (free stephen t09_00) (free stephen t09_30) (free stephen t10_00) (free stephen t10_30) (free stephen t11_00)
    (free stephen t12_00) (free stephen t13_00) (free stephen t13_30) (free stephen t14_00) (free stephen t14_30)
    (free stephen t15_00) (free stephen t15_30) (free stephen t16_00) (free stephen t16_30)
    ; margaret free respecting preference "do not want to meet before 14:30" and busy intervals
    ; margaret busy at 09:00,10:30-12:30,13:00,15:00,16:30 and not before 14:30 -> available only t14_30,t15_30,t16_00 (t15_00 and t16_30 busy)
    (free margaret t14_30) (free margaret t15_30) (free margaret t16_00)
    ; mason free (busy at 09:00-10:00 => t09_00,t09_30; 10:30;11:30-12:30 => t11_30,t12_00;13:00;14:00;16:30)
    (free mason t10_00) (free mason t11_00) (free mason t12_30) (free mason t13_30)
    (free mason t14_30) (free mason t15_00) (free mason t15_30) (free mason t16_00)
  )
  (:goal (scheduled))
)