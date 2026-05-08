(define (problem schedule_team_meeting_monday)
  (:domain jack_of_all_trades)

  (:objects
    lisa bobby randy - participant
    team_meeting - meeting
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ;; type tags
    (participant lisa)
    (participant bobby)
    (participant randy)
    (meeting team_meeting)

    ;; slot objects
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; work hours: all enumerated slots are within workhours (09:00-16:30 starts)
    (slot_within_workhours t0900) (slot_within_workhours t0930)
    (slot_within_workhours t1000) (slot_within_workhours t1030)
    (slot_within_workhours t1100) (slot_within_workhours t1130)
    (slot_within_workhours t1200) (slot_within_workhours t1230)
    (slot_within_workhours t1300) (slot_within_workhours t1330)
    (slot_within_workhours t1400) (slot_within_workhours t1430)
    (slot_within_workhours t1500) (slot_within_workhours t1530)
    (slot_within_workhours t1600) (slot_within_workhours t1630)

    ;; Bobby's hard preference: avoid meetings after 15:00.
    ;; Allow starts that end by 15:00 => start <= 14:30 (t1430 included)
    (allowed_by_bobby t0900) (allowed_by_bobby t0930)
    (allowed_by_bobby t1000) (allowed_by_bobby t1030)
    (allowed_by_bobby t1100) (allowed_by_bobby t1130)
    (allowed_by_bobby t1200) (allowed_by_bobby t1230)
    (allowed_by_bobby t1300) (allowed_by_bobby t1330)
    (allowed_by_bobby t1400) (allowed_by_bobby t1430)

    ;; Existing busy slots derived from provided schedules
    ;; Lisa busy: 09:00-10:00 -> blocks t0900, t0930
    ;;            10:30-11:30 -> blocks t1030, t1100
    ;;            12:30-13:00 -> blocks t1230
    ;;            16:00-16:30 -> blocks t1600
    (busy_existing lisa t0900)
    (busy_existing lisa t0930)
    (busy_existing lisa t1030)
    (busy_existing lisa t1100)
    (busy_existing lisa t1230)
    (busy_existing lisa t1600)

    ;; Bobby busy: 09:00-09:30 -> t0900
    ;;             10:00-10:30 -> t1000
    ;;             11:30-12:00 -> t1130
    ;;             15:00-15:30 -> t1500
    (busy_existing bobby t0900)
    (busy_existing bobby t1000)
    (busy_existing bobby t1130)
    (busy_existing bobby t1500)

    ;; Randy busy:
    ;; 09:30-10:00 -> t0930
    ;; 10:30-11:00 -> t1030
    ;; 11:30-12:30 -> t1130, t1200
    ;; 13:00-13:30 -> t1300
    ;; 14:30-15:30 -> t1430, t1500
    ;; 16:00-16:30 -> t1600
    (busy_existing randy t0930)
    (busy_existing randy t1030)
    (busy_existing randy t1130)
    (busy_existing randy t1200)
    (busy_existing randy t1300)
    (busy_existing randy t1430)
    (busy_existing randy t1500)
    (busy_existing randy t1600)
  )

  (:goal (scheduled team_meeting))
)