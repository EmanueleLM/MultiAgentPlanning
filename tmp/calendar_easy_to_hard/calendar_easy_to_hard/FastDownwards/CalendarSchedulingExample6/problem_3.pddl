(define (problem schedule-meeting-monday-multiagent)
  (:domain meeting-scheduling-multiagent)

  (:objects
    thomas dylan jerry - person
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30
    t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 - timeslot
    monday - day
  )

  (:init
    (participant thomas) (participant dylan) (participant jerry)

    (is-day monday)

    (is-timeslot t_09_00) (is-timeslot t_09_30) (is-timeslot t_10_00) (is-timeslot t_10_30)
    (is-timeslot t_11_00) (is-timeslot t_11_30) (is-timeslot t_12_00) (is-timeslot t_12_30)
    (is-timeslot t_13_00) (is-timeslot t_13_30) (is-timeslot t_14_00) (is-timeslot t_14_30)
    (is-timeslot t_15_00) (is-timeslot t_15_30) (is-timeslot t_16_00)

    (on-day t_09_00 monday) (on-day t_09_30 monday) (on-day t_10_00 monday) (on-day t_10_30 monday)
    (on-day t_11_00 monday) (on-day t_11_30 monday) (on-day t_12_00 monday) (on-day t_12_30 monday)
    (on-day t_13_00 monday) (on-day t_13_30 monday) (on-day t_14_00 monday) (on-day t_14_30 monday)
    (on-day t_15_00 monday) (on-day t_15_30 monday) (on-day t_16_00 monday)

    (within-workhours t_09_00) (within-workhours t_09_30) (within-workhours t_10_00) (within-workhours t_10_30)
    (within-workhours t_11_00) (within-workhours t_11_30) (within-workhours t_12_00) (within-workhours t_12_30)
    (within-workhours t_13_00) (within-workhours t_13_30) (within-workhours t_14_00) (within-workhours t_14_30)
    (within-workhours t_15_00) (within-workhours t_15_30) (within-workhours t_16_00)

    (next t_09_00 t_09_30) (next t_09_30 t_10_00) (next t_10_00 t_10_30) (next t_10_30 t_11_00)
    (next t_11_00 t_11_30) (next t_11_30 t_12_00) (next t_12_00 t_12_30) (next t_12_30 t_13_00)
    (next t_13_00 t_13_30) (next t_13_30 t_14_00) (next t_14_00 t_14_30) (next t_14_30 t_15_00)
    (next t_15_00 t_15_30) (next t_15_30 t_16_00)

    (meeting-unscheduled)

    ; Thomas is free whole day
    (available thomas t_09_00) (available thomas t_09_30) (available thomas t_10_00) (available thomas t_10_30)
    (available thomas t_11_00) (available thomas t_11_30) (available thomas t_12_00) (available thomas t_12_30)
    (available thomas t_13_00) (available thomas t_13_30) (available thomas t_14_00) (available thomas t_14_30)
    (available thomas t_15_00) (available thomas t_15_30) (available thomas t_16_00)

    ; Dylan busy 10:30-11:00 (t_10_30) and 13:30-14:00 (t_13_30) so available otherwise
    (available dylan t_09_00) (available dylan t_09_30)
    (available dylan t_10_00)
    (available dylan t_11_00) (available dylan t_11_30) (available dylan t_12_00) (available dylan t_12_30)
    (available dylan t_14_00) (available dylan t_14_30)
    (available dylan t_15_00) (available dylan t_15_30) (available dylan t_16_00)

    ; Jerry busy 9:00-11:00 (t_09_00,t_09_30,t_10_00,t_10_30) and 11:30-14:30 (t_11_30..t_14_00), and 16:00-17:00 (t_16_00)
    ; So Jerry only available at t_14_30 and t_15_00 in these workhours
    (available jerry t_14_30) (available jerry t_15_00)
  )

  (:goal (meeting-starts t_14_30))
)