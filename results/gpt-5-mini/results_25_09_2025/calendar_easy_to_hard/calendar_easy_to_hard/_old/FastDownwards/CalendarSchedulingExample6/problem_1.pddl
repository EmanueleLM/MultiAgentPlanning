(define (problem schedule-meeting-integrated-monday)
  (:domain meeting-scheduling-integrated)

  (:objects
    thomas dylan jerry - person
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30
    t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 - timeslot
    monday - day
  )

  (:init
    (participant thomas) (participant dylan) (participant jerry)

    (day monday)

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

    (startable t_09_00) (startable t_09_30) (startable t_10_00) (startable t_10_30)
    (startable t_11_00) (startable t_11_30) (startable t_12_00) (startable t_12_30)
    (startable t_13_00) (startable t_13_30) (startable t_14_00) (startable t_14_30)
    (startable t_15_00) (startable t_15_30) (startable t_16_00)

    (unscheduled)
    (meeting-unscheduled)

    (available thomas t_09_00) (available thomas t_09_30) (available thomas t_10_00) (available thomas t_10_30)
    (available thomas t_11_00) (available thomas t_11_30) (available thomas t_12_00) (available thomas t_12_30)
    (available thomas t_13_00) (available thomas t_13_30) (available thomas t_14_00) (available thomas t_14_30)
    (available thomas t_15_00) (available thomas t_15_30) (available thomas t_16_00)

    (free thomas t_09_00) (free thomas t_09_30) (free thomas t_10_00) (free thomas t_10_30)
    (free thomas t_11_00) (free thomas t_11_30) (free thomas t_12_00) (free thomas t_12_30)
    (free thomas t_13_00) (free thomas t_13_30) (free thomas t_14_00) (free thomas t_14_30)
    (free thomas t_15_00) (free thomas t_15_30) (free thomas t_16_00)

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

    (available jerry t_14_30) (available jerry t_15_00)
    (free jerry t_14_30) (free jerry t_15_00)

    (feasible-for-all t_14_30)
  )

  (:goal (meeting-scheduled t_14_30))
)