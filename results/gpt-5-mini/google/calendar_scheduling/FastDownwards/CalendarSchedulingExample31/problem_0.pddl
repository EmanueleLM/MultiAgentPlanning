(define (problem schedule_monday_meeting)
  (:domain jack_of_all_trades_scheduling)

  (:objects
    richard martha kimberly - participant
    s_9_00 s_9_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    ;; type membership facts (explicit)
    (participant richard)
    (participant martha)
    (participant kimberly)

    (slot s_9_00) (slot s_9_30) (slot s_10_00) (slot s_10_30)
    (slot s_11_00) (slot s_11_30) (slot s_12_00) (slot s_12_30)
    (slot s_13_00) (slot s_13_30) (slot s_14_00) (slot s_14_30)
    (slot s_15_00) (slot s_15_30) (slot s_16_00) (slot s_16_30)

    ;; busy facts from participants' existing schedules
    ;; Richard busy: 13:30-14:00 (s_13_30), 15:00-15:30 (s_15_00)
    (busy richard s_13_30)
    (busy richard s_15_00)

    ;; Martha busy: 09:00-09:30 (s_9_00), 13:00-13:30 (s_13_00)
    (busy martha s_9_00)
    (busy martha s_13_00)

    ;; Kimberly busy:
    ;; 09:00-11:00 -> s_9_00, s_9_30, s_10_00, s_10_30
    (busy kimberly s_9_00)
    (busy kimberly s_9_30)
    (busy kimberly s_10_00)
    (busy kimberly s_10_30)
    ;; 11:30-12:00 -> s_11_30
    (busy kimberly s_11_30)
    ;; 12:30-13:00 -> s_12_30
    (busy kimberly s_12_30)
    ;; 14:00-16:00 -> s_14_00, s_14_30, s_15_00, s_15_30
    (busy kimberly s_14_00)
    (busy kimberly s_14_30)
    (busy kimberly s_15_00)
    (busy kimberly s_15_30)

    ;; allowed facts (hard constraints / working-hours and Martha's preference)
    ;; Richard: allowed all work-hour slots
    (allowed richard s_9_00) (allowed richard s_9_30)
    (allowed richard s_10_00) (allowed richard s_10_30)
    (allowed richard s_11_00) (allowed richard s_11_30)
    (allowed richard s_12_00) (allowed richard s_12_30)
    (allowed richard s_13_00) (allowed richard s_13_30)
    (allowed richard s_14_00) (allowed richard s_14_30)
    (allowed richard s_15_00) (allowed richard s_15_30)
    (allowed richard s_16_00) (allowed richard s_16_30)

    ;; Martha: does not want to meet before 14:00 -> allowed only at or after s_14_00
    (allowed martha s_14_00) (allowed martha s_14_30)
    (allowed martha s_15_00) (allowed martha s_15_30)
    (allowed martha s_16_00) (allowed martha s_16_30)

    ;; Kimberly: allowed only in slots not occupied by her busy periods
    ;; allowed: s_11_00, s_12_00, s_13_00, s_13_30, s_16_00, s_16_30
    (allowed kimberly s_11_00) (allowed kimberly s_12_00)
    (allowed kimberly s_13_00) (allowed kimberly s_13_30)
    (allowed kimberly s_16_00) (allowed kimberly s_16_30)
  )

  (:goal
    (meeting_done)
  )
)