(define (domain multi_agent_meeting_scheduler)
  (:requirements :typing :strips)

  (:types person time)

  ; Participants
  (:constants pamela anthony zachary - person
              t09_00 t09_30 t10_00 t10_30 t11_00 t11_30
              t12_00 t12_30 t13_00 t13_30 t14_00 t14_30
              t15_00 t15_30 t16_00 t16_30 - time)

  ; Predicates
  (:predicates
     (free ?p - person ?t - time)
     (scheduled ?start - time)
  )

  ; Actions: one for each possible 1-hour start time
  ; Start at 09:00 -> uses 09:00 and 09:30
  (:action schedule_meeting_09_00
     :parameters ()
     :precondition (and (free pamela t09_00) (free pamela t09_30)
                        (free anthony t09_00) (free anthony t09_30)
                        (free zachary t09_00) (free zachary t09_30))
     :effect (and (not (free pamela t09_00)) (not (free pamela t09_30))
                  (not (free anthony t09_00)) (not (free anthony t09_30))
                  (not (free zachary t09_00)) (not (free zachary t09_30))
                  (scheduled t09_00)))
  ; Start at 09:30 -> uses 09:30 and 10:00
  (:action schedule_meeting_09_30
     :parameters ()
     :precondition (and (free pamela t09_30) (free pamela t10_00)
                        (free anthony t09_30) (free anthony t10_00)
                        (free zachary t09_30) (free zachary t10_00))
     :effect (and (not (free pamela t09_30)) (not (free pamela t10_00))
                  (not (free anthony t09_30)) (not (free anthony t10_00))
                  (not (free zachary t09_30)) (not (free zachary t10_00))
                  (scheduled t09_30)))
  ; Start at 10:00 -> uses 10:00 and 10:30
  (:action schedule_meeting_10_00
     :parameters ()
     :precondition (and (free pamela t10_00) (free pamela t10_30)
                        (free anthony t10_00) (free anthony t10_30)
                        (free zachary t10_00) (free zachary t10_30))
     :effect (and (not (free pamela t10_00)) (not (free pamela t10_30))
                  (not (free anthony t10_00)) (not (free anthony t10_30))
                  (not (free zachary t10_00)) (not (free zachary t10_30))
                  (scheduled t10_00)))
  ; Start at 10:30 -> uses 10:30 and 11:00
  (:action schedule_meeting_10_30
     :parameters ()
     :precondition (and (free pamela t10_30) (free pamela t11_00)
                        (free anthony t10_30) (free anthony t11_00)
                        (free zachary t10_30) (free zachary t11_00))
     :effect (and (not (free pamela t10_30)) (not (free pamela t11_00))
                  (not (free anthony t10_30)) (not (free anthony t11_00))
                  (not (free zachary t10_30)) (not (free zachary t11_00))
                  (scheduled t10_30)))
  ; Start at 11:00 -> uses 11:00 and 11:30
  (:action schedule_meeting_11_00
     :parameters ()
     :precondition (and (free pamela t11_00) (free pamela t11_30)
                        (free anthony t11_00) (free anthony t11_30)
                        (free zachary t11_00) (free zachary t11_30))
     :effect (and (not (free pamela t11_00)) (not (free pamela t11_30))
                  (not (free anthony t11_00)) (not (free anthony t11_30))
                  (not (free zachary t11_00)) (not (free zachary t11_30))
                  (scheduled t11_00)))
  ; Start at 11:30 -> uses 11:30 and 12:00
  (:action schedule_meeting_11_30
     :parameters ()
     :precondition (and (free pamela t11_30) (free pamela t12_00)
                        (free anthony t11_30) (free anthony t12_00)
                        (free zachary t11_30) (free zachary t12_00))
     :effect (and (not (free pamela t11_30)) (not (free pamela t12_00))
                  (not (free anthony t11_30)) (not (free anthony t12_00))
                  (not (free zachary t11_30)) (not (free zachary t12_00))
                  (scheduled t11_30)))
  ; Start at 12:00 -> uses 12:00 and 12:30
  (:action schedule_meeting_12_00
     :parameters ()
     :precondition (and (free pamela t12_00) (free pamela t12_30)
                        (free anthony t12_00) (free anthony t12_30)
                        (free zachary t12_00) (free zachary t12_30))
     :effect (and (not (free pamela t12_00)) (not (free pamela t12_30))
                  (not (free anthony t12_00)) (not (free anthony t12_30))
                  (not (free zachary t12_00)) (not (free zachary t12_30))
                  (scheduled t12_00)))
  ; Start at 12:30 -> uses 12:30 and 13:00
  (:action schedule_meeting_12_30
     :parameters ()
     :precondition (and (free pamela t12_30) (free pamela t13_00)
                        (free anthony t12_30) (free anthony t13_00)
                        (free zachary t12_30) (free zachary t13_00))
     :effect (and (not (free pamela t12_30)) (not (free pamela t13_00))
                  (not (free anthony t12_30)) (not (free anthony t13_00))
                  (not (free zachary t12_30)) (not (free zachary t13_00))
                  (scheduled t12_30)))
  ; Start at 13:00 -> uses 13:00 and 13:30
  (:action schedule_meeting_13_00
     :parameters ()
     :precondition (and (free pamela t13_00) (free pamela t13_30)
                        (free anthony t13_00) (free anthony t13_30)
                        (free zachary t13_00) (free zachary t13_30))
     :effect (and (not (free pamela t13_00)) (not (free pamela t13_30))
                  (not (free anthony t13_00)) (not (free anthony t13_30))
                  (not (free zachary t13_00)) (not (free zachary t13_30))
                  (scheduled t13_00)))
  ; Start at 13:30 -> uses 13:30 and 14:00
  (:action schedule_meeting_13_30
     :parameters ()
     :precondition (and (free pamela t13_30) (free pamela t14_00)
                        (free anthony t13_30) (free anthony t14_00)
                        (free zachary t13_30) (free zachary t14_00))
     :effect (and (not (free pamela t13_30)) (not (free pamela t14_00))
                  (not (free anthony t13_30)) (not (free anthony t14_00))
                  (not (free zachary t13_30)) (not (free zachary t14_00))
                  (scheduled t13_30)))
  ; Start at 14:00 -> uses 14:00 and 14:30
  (:action schedule_meeting_14_00
     :parameters ()
     :precondition (and (free pamela t14_00) (free pamela t14_30)
                        (free anthony t14_00) (free anthony t14_30)
                        (free zachary t14_00) (free zachary t14_30))
     :effect (and (not (free pamela t14_00)) (not (free pamela t14_30))
                  (not (free anthony t14_00)) (not (free anthony t14_30))
                  (not (free zachary t14_00)) (not (free zachary t14_30))
                  (scheduled t14_00)))
  ; Start at 14:30 -> uses 14:30 and 15:00
  (:action schedule_meeting_14_30
     :parameters ()
     :precondition (and (free pamela t14_30) (free pamela t15_00)
                        (free anthony t14_30) (free anthony t15_00)
                        (free zachary t14_30) (free zachary t15_00))
     :effect (and (not (free pamela t14_30)) (not (free pamela t15_00))
                  (not (free anthony t14_30)) (not (free anthony t15_00))
                  (not (free zachary t14_30)) (not (free zachary t15_00))
                  (scheduled t14_30)))
  ; Start at 15:00 -> uses 15:00 and 15:30
  (:action schedule_meeting_15_00
     :parameters ()
     :precondition (and (free pamela t15_00) (free pamela t15_30)
                        (free anthony t15_00) (free anthony t15_30)
                        (free zachary t15_00) (free zachary t15_30))
     :effect (and (not (free pamela t15_00)) (not (free pamela t15_30))
                  (not (free anthony t15_00)) (not (free anthony t15_30))
                  (not (free zachary t15_00)) (not (free zachary t15_30))
                  (scheduled t15_00)))
  ; Start at 15:30 -> uses 15:30 and 16:00
  (:action schedule_meeting_15_30
     :parameters ()
     :precondition (and (free pamela t15_30) (free pamela t16_00)
                        (free anthony t15_30) (free anthony t16_00)
                        (free zachary t15_30) (free zachary t16_00))
     :effect (and (not (free pamela t15_30)) (not (free pamela t16_00))
                  (not (free anthony t15_30)) (not (free anthony t16_00))
                  (not (free zachary t15_30)) (not (free zachary t16_00))
                  (scheduled t15_30)))
  ; Start at 16:00 -> uses 16:00 and 16:30
  (:action schedule_meeting_16_00
     :parameters ()
     :precondition (and (free pamela t16_00) (free pamela t16_30)
                        (free anthony t16_00) (free anthony t16_30)
                        (free zachary t16_00) (free zachary t16_30))
     :effect (and (not (free pamela t16_00)) (not (free pamela t16_30))
                  (not (free anthony t16_00)) (not (free anthony t16_30))
                  (not (free zachary t16_00)) (not (free zachary t16_30))
                  (scheduled t16_00)))
)