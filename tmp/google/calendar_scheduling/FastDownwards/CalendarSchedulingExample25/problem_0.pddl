(define (problem monday_meeting common_slot)
  (:domain multi_agent_meeting_scheduler)

  (:objects pamela anthony zachary - person)

  ; Initial knowledge: reflect availability per the three participants
  (:init
     ; Pamela: busy 09:30-10:00 and 16:30-17:00
     (free pamela t09_00)
     (free pamela t10_00)
     (free pamela t10_30)
     (free pamela t11_00)
     (free pamela t11_30)
     (free pamela t12_00)
     (free pamela t12_30)
     (free pamela t13_00)
     (free pamela t13_30)
     (free pamela t14_00)
     (free pamela t14_30)
     (free pamela t15_00)
     (free pamela t15_30)
     (free pamela t16_00)

     ; Anthony: public information only; assume free during work hours
     (free anthony t09_00) (free anthony t09_30)
     (free anthony t10_00) (free anthony t10_30)
     (free anthony t11_00) (free anthony t11_30)
     (free anthony t12_00) (free anthony t12_30)
     (free anthony t13_00) (free anthony t13_30)
     (free anthony t14_00) (free anthony t14_30)
     (free anthony t15_00) (free anthony t15_30)
     (free anthony t16_00) (free anthony t16_30)

     ; Zachary: available only in certain slots per private busy times
     (free zachary t12_30)
     (free zachary t13_30)
     (free zachary t14_00)
     (free zachary t15_00)
     (free zachary t15_30)
  )

  ; Goal: schedule the meeting at any start time (a common 1-hour slot)
  (:goal
     (or (scheduled t09_00)
         (scheduled t09_30)
         (scheduled t10_00)
         (scheduled t10_30)
         (scheduled t11_00)
         (scheduled t11_30)
         (scheduled t12_00)
         (scheduled t12_30)
         (scheduled t13_00)
         (scheduled t13_30)
         (scheduled t14_00)
         (scheduled t14_30)
         (scheduled t15_00)
         (scheduled t15_30)
         (scheduled t16_00))
  )