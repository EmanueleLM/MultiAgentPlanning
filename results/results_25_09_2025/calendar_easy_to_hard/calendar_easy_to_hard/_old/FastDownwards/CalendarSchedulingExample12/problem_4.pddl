(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)

  (:objects
    dylan kathryn hannah anna - person
    meeting1 - meeting
    t09 t10 t11 t12 t13 t14 t15 t16 - hour
  )

  (:init
    ;; within work window 09:00-17:00 (hour start times 09..16)
    (within-window t09) (within-window t10) (within-window t11) (within-window t12)
    (within-window t13) (within-window t14) (within-window t15) (within-window t16)

    ;; Unscheduled meeting initially
    (unscheduled meeting1)
    (meeting-free)

    ;; Free hours per participant computed so a full 60-minute meeting fits without overlap:
    ;; Dylan: blocked 14:00-15:00 -> free at 09,10,11,12,13,15,16
    (free_hour dylan t09) (free_hour dylan t10) (free_hour dylan t11) (free_hour dylan t12)
    (free_hour dylan t13) (free_hour dylan t15) (free_hour dylan t16)

    ;; Kathryn: busy 09:00-09:30 and 10:00-10:30 -> cannot start at 09 or 10; free at 11..16
    (free_hour kathryn t11) (free_hour kathryn t12) (free_hour kathryn t13)
    (free_hour kathryn t14) (free_hour kathryn t15) (free_hour kathryn t16)

    ;; Hannah: busy 09:00-10:30, 12:30-15:30, 16:00-16:30 -> only full hour available is 11:00-12:00
    (free_hour hannah t11)

    ;; Anna: busy 09:00-11:00, 12:00-14:00, 14:30-15:00, 16:00-16:30 -> full hours available 11:00-12:00 and 15:00-16:00
    (free_hour anna t11) (free_hour anna t15)
  )

  (:goal (and
    (meeting-scheduled-global meeting1)
    (attends dylan meeting1)
    (attends kathryn meeting1)
    (attends hannah meeting1)
    (attends anna meeting1)
  ))
)