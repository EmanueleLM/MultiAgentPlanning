(define (problem schedule-meeting-integrated-monday)
  (:domain meeting-scheduling-integrated)

  (:objects
    thomas dylan jerry - person

    ;; 30-minute start slots between 09:00 and 16:00 (a 60-minute meeting starting at these times fits into 09:00-17:00)
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30
    t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 - timeslot

    monday - day
  )

  (:init
    ;; participants
    (participant thomas) (participant dylan) (participant jerry)

    ;; day and timeslot membership
    (day monday)
    (timeslot t_09_00) (timeslot t_09_30) (timeslot t_10_00) (timeslot t_10_30)
    (timeslot t_11_00) (timeslot t_11_30) (timeslot t_12_00) (timeslot t_12_30)
    (timeslot t_13_00) (timeslot t_13_30) (timeslot t_14_00) (timeslot t_14_30)
    (timeslot t_15_00) (timeslot t_15_30) (timeslot t_16_00)

    ;; all these slots occur on Monday and are within workhours / startable for a 60-minute meeting
    (on-day t_09_00 monday) (on-day t_09_30 monday) (on-day t_10_00 monday) (on-day t_10_30 monday)
    (on-day t_11_00 monday) (on-day t_11_30 monday) (on-day t_12_00 monday) (on-day t_12_30 monday)
    (on-day t_13_00 monday) (on-day t_13_30 monday) (on-day t_14_00 monday) (on-day t_14_30 monday)
    (on-day t_15_00 monday) (on-day t_15_30 monday) (on-day t_16_00 monday)

    (within-workhours t_09_00) (within-workhours t_09_30) (within-workhours t_10_00) (within-workhours t_10_30)
    (within-workhours t_11_00) (within-workhours t_11_30) (within-workhours t_12_00) (within-workhours t_12_30)
    (within-workhours t_13_00) (within-workhours t_13_30) (within-workhours t_14_00) (within-workhours t_14_30)
    (within-workhours t_15_00) (within-workhours t_15_30) (within-workhours t_16_00)

    (startable t_09_00) (startable t_09_30) (startable t_10_00) (startable t_10_30)
    (startable t_11_00) (startable t_11_30) (startable t_12_00) (startable t_12_30)
    (startable t_13_00) (startable t_13_30) (startable t_14_00) (startable t_14_30)
    (startable t_15_00) (startable t_15_30) (startable t_16_00)

    ;; Bookkeeping bits initially: meeting unscheduled according to both agent conventions
    (unscheduled)
    (meeting-unscheduled)

    ;; -------------------------
    ;; Availability integrated from agents:
    ;; - Thomas (Agent 1): known free entire workday -> available/free for all start slots.
    ;; - Dylan (Agent 2): busy 10:30-11:00 and 13:30-14:00, hence available only for start times that do not overlap those busy windows.
    ;; - Jerry (Agent 3): busy windows given; only t_14_30 and t_15_00 are free for a 60-min meeting according to agent 3.
    ;; We include both 'available' and 'free' facts as different agents use different predicates.
    ;; -------------------------

    ;; Thomas: available and free for all start times
    (available thomas t_09_00) (available thomas t_09_30) (available thomas t_10_00) (available thomas t_10_30)
    (available thomas t_11_00) (available thomas t_11_30) (available thomas t_12_00) (available thomas t_12_30)
    (available thomas t_13_00) (available thomas t_13_30) (available thomas t_14_00) (available thomas t_14_30)
    (available thomas t_15_00) (available thomas t_15_30) (available thomas t_16_00)

    (free thomas t_09_00) (free thomas t_09_30) (free thomas t_10_00) (free thomas t_10_30)
    (free thomas t_11_00) (free thomas t_11_30) (free thomas t_12_00) (free thomas t_12_30)
    (free thomas t_13_00) (free thomas t_13_30) (free thomas t_14_00) (free thomas t_14_30)
    (free thomas t_15_00) (free thomas t_15_30) (free thomas t_16_00)

    ;; Dylan: according to Agent 2, busy 10:30-11:00 and 13:30-14:00 -> exclude starts that would overlap those busy intervals.
    ;; Allowed start times for Dylan (computed to avoid overlap with busy intervals for a 60-min meeting):
    (available dylan t_09_00) (available dylan t_09_30)
    (available dylan t_11_00) (available dylan t_11_30)
    (available dylan t_12_00) (available dylan t_12_30)
    (available dylan t_14_00) (available dylan t_14_30)
    (available dylan t_15_00) (available dylan t_15_30)
    (available dylan t_16_00)

    (free dylan t_09_00) (free dylan t_09_30)
    (free dylan t_11_00) (free dylan t_11_30)
    (free dylan t_12_00) (free dylan t_12_30)
    (free dylan t_14_00) (free dylan t_14_30)
    (free dylan t_15_00) (free dylan t_15_30)
    (free dylan t_16_00)

    ;; Jerry: according to Agent 3, Jerry is only free for starts that do not overlap his busy windows;
    ;; Agent 3 provided that t_14_30 is feasible-for-all and Jerry is free at t_14_30 and t_15_00.
    (available jerry t_14_30) (available jerry t_15_00)
    (free jerry t_14_30) (free jerry t_15_00)

    ;; Public fact from Agent 3: a feasible-for-all time exists (use the known feasible time)
    (feasible-for-all t_14_30)
  )

  ;; Goal: schedule the 60-minute meeting at the integrated feasible time where all reported availabilities align:
  ;; we target t_14_30 (14:30 start -> 14:30-15:30 meeting within 9:00-17:00).
  (:goal (meeting-scheduled t_14_30))
)