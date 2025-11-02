(define (problem schedule-meeting-2025-10-21)
  (:domain meeting-scheduling)
  (:objects
    alice bob carol - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
    d2025_10_21 - date
  )
  (:init
    ;; date and that every slot is on the required meeting date
    (date d2025_10_21)
    (slot t0900)  (on-date t0900 d2025_10_21)
    (slot t0930)  (on-date t0930 d2025_10_21)
    (slot t1000)  (on-date t1000 d2025_10_21)
    (slot t1030)  (on-date t1030 d2025_10_21)
    (slot t1100)  (on-date t1100 d2025_10_21)
    (slot t1130)  (on-date t1130 d2025_10_21)
    (slot t1200)  (on-date t1200 d2025_10_21)
    (slot t1230)  (on-date t1230 d2025_10_21)
    (slot t1300)  (on-date t1300 d2025_10_21)
    (slot t1330)  (on-date t1330 d2025_10_21)
    (slot t1400)  (on-date t1400 d2025_10_21)
    (slot t1430)  (on-date t1430 d2025_10_21)
    (slot t1500)  (on-date t1500 d2025_10_21)
    (slot t1530)  (on-date t1530 d2025_10_21)
    (slot t1600)  (on-date t1600 d2025_10_21)
    (slot t1630)  (on-date t1630 d2025_10_21)

    ;; persons
    (person alice)
    (person bob)
    (person carol)

    ;; Free slots per participant (a slot denotes a 30-minute interval starting at that time)
    ;; Alice availability: 2025-10-21 09:00-11:00 and 13:00-16:00
    (free alice t0900)
    (free alice t0930)
    (free alice t1000)
    (free alice t1030)
    (free alice t1300)
    (free alice t1330)
    (free alice t1400)
    (free alice t1430)
    (free alice t1500)
    (free alice t1530)

    ;; Bob availability: 2025-10-21 10:30-12:00 and 14:00-15:30
    (free bob t1030)
    (free bob t1100)
    (free bob t1130)
    (free bob t1400)
    (free bob t1430)
    (free bob t1500)

    ;; Carol availability: 2025-10-21 09:30-10:30, 11:00-12:30, 15:00-17:00
    (free carol t0930)
    (free carol t1000)
    (free carol t1100)
    (free carol t1130)
    (free carol t1200)
    (free carol t1500)
    (free carol t1530)
    (free carol t1600)
    (free carol t1630)

    ;; Preference encoded as a hard constraint: choose the earliest feasible slot that minimizes interruption to Bob's morning.
    ;; From the availability intersection, the earliest common 30-min slot is 15:00-15:30 (t1500).
    (preferred-slot t1500)
  )

  ;; Goal: schedule the meeting in the preferred (and feasible) slot t1500
  (:goal (scheduled t1500))
)