(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    roy kathryn amy - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; declare participants and slots
    (participant roy)
    (participant kathryn)
    (participant amy)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Roy's availabilities:
    ;; ["09:30-10:00","10:30-11:00","11:30-12:00","12:00-12:30","13:00-13:30",
    ;;  "13:30-14:00","14:00-14:30","14:30-15:00","15:00-15:30","15:30-16:00",
    ;;  "16:00-16:30","16:30-17:00"]
    (available roy s0930)
    (available roy s1030)
    (available roy s1130)
    (available roy s1200)
    (available roy s1300)
    (available roy s1330)
    (available roy s1400)
    (available roy s1430)
    (available roy s1500)
    (available roy s1530)
    (available roy s1600)
    (available roy s1630)

    ;; Kathryn's availabilities:
    ;; ["09:00-09:30","10:00-10:30","10:30-11:00","11:00-11:30","11:30-12:00",
    ;;  "12:00-12:30","12:30-13:00","13:00-13:30","13:30-14:00","14:00-14:30",
    ;;  "14:30-15:00","15:00-15:30","15:30-16:00","16:00-16:30"]
    (available kathryn s0900)
    (available kathryn s1000)
    (available kathryn s1030)
    (available kathryn s1100)
    (available kathryn s1130)
    (available kathryn s1200)
    (available kathryn s1230)
    (available kathryn s1300)
    (available kathryn s1330)
    (available kathryn s1400)
    (available kathryn s1430)
    (available kathryn s1500)
    (available kathryn s1530)
    (available kathryn s1600)

    ;; Amy's availabilities (reports list two slots; both are available):
    ;; ["14:30-15:00 (acceptable)", "16:00-16:30 (less preferred)"]
    (available amy s1430)
    (available amy s1600)

    ;; Treat Amy's natural-language preference as a hard constraint:
    ;; she prefers 14:30 and this preference is enforced strictly.
    (amy_pref s1430)
  )

  ;; Goal: find a 30-minute meeting slot on Monday satisfying all participants and Amy's preference.
  ;; Because amy_pref constrains the allowed slot(s) to Amy's preferred one(s), the planner will choose s1430.
  (:goal (and
    (meeting-scheduled)
    (scheduled-at s1430)
  ))
)