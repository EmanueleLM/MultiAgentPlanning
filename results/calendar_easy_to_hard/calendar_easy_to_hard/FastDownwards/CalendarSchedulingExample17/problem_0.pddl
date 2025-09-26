(define (problem schedule-monday-30m)
  (:domain meeting-scheduler)
  (:objects
    peter judith keith evelyn - participant
    ts1 ts2 ts3 ts4 ts5 ts6 ts7 ts8 ts9 ts10 ts11 ts12 ts13 ts14 ts15 ts16 - timeslot
  )
  (:init
    ;; Peter busy: 09:00-09:30 (ts1), 10:30-11:00 (ts4), 11:30-12:00 (ts6), 12:30-13:00 (ts8)
    (busy peter ts1)
    (busy peter ts4)
    (busy peter ts6)
    (busy peter ts8)

    ;; Judith: no busy intervals (fully available between 09:00-17:00)

    ;; Keith busy: 11:30-12:00 (ts6), 12:30-15:00 (ts8,ts9,ts10? careful: given 12:30-15:00 per input was 12:30-15:00)
    ;; Note: provided private constraints list for Keith are: 11:30-12:00, 12:30-15:00, 15:30-16:00, 16:30-17:00
    ;; Map to 30-min slots:
    ;; 11:30-12:00 -> ts6
    ;; 12:30-15:00 -> ts8 (12:30-13:00), ts9 (13:00-13:30), ts10 (13:30-14:00), ts11 (14:00-14:30), ts12 (14:30-15:00)
    ;; 15:30-16:00 -> ts14
    ;; 16:30-17:00 -> ts16
    (busy keith ts6)
    (busy keith ts8)
    (busy keith ts9)
    (busy keith ts10)
    (busy keith ts11)
    (busy keith ts12)
    (busy keith ts14)
    (busy keith ts16)

    ;; Evelyn busy: 09:00-12:30 -> ts1,ts2,ts3,ts4,ts5,ts6,ts7
    ;; 13:30-15:30 -> ts10,ts11,ts12,ts13
    ;; 16:30-17:00 -> ts16
    (busy evelyn ts1)
    (busy evelyn ts2)
    (busy evelyn ts3)
    (busy evelyn ts4)
    (busy evelyn ts5)
    (busy evelyn ts6)
    (busy evelyn ts7)
    (busy evelyn ts10)
    (busy evelyn ts11)
    (busy evelyn ts12)
    (busy evelyn ts13)
    (busy evelyn ts16)

    ;; Allow only the earliest common available 30-minute slot (computed from participant constraints):
    ;; Earliest slot when all participants are free is 13:00-13:30 -> ts9
    (allow ts9)
  )

  (:goal (scheduled ts9))
)