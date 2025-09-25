(define (problem schedule-meeting-diane-deborah)
  (:domain meeting-scheduling)

  ;; Objects: 30-minute slots from Monday 09:00 to 17:00
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
    diane_kelly deborah - person
  )

  (:init
    ;; declare slots and persons
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    (person diane_kelly) (person deborah)

    ;; WORK HOURS: implicitly enforced by the provided slot set (09:00-17:00).
    ;; MEETING DURATION: 30 minutes (each slot is a 30-minute interval).

    ;; Availability is set explicitly from agents' provided unavailable intervals.
    ;; We merged the schedules where necessary to represent Diane Kelly consistently
    ;; (agent naming mismatch resolved: 'diane' and 'kelly' refer to the same participant).
    ;;
    ;; Derived unavailable slots (hard constraints interpreted from inputs):
    ;; - Diane Kelly busy: 09:00-09:30 (t0900), 09:30-10:00 (t0930), 10:30-11:00 (t1030),
    ;;                    12:00-12:30 (t1200), 14:30-15:30 (t1430 and t1500 start at 15:00)
    ;;   (from union of diane and kelly agent constraints).
    ;; - Deborah busy: 09:00-09:30 (t0900), 10:00-14:00 (t1000..t1330), 14:30-17:00 (t1430..t1630)
    ;; The rest of the slots (inside work hours) are treated as free in the initial state.

    ;; Free slots for diane_kelly (all slots within work hours except her busy slots):
    ;; From the union of diane + kelly busy intervals, Diane Kelly is free at:
    ;; t1000, t1100, t1130, t1230, t1300, t1330, t1400, t1530, t1600, t1630
    (free diane_kelly t1000)
    (free diane_kelly t1100)
    (free diane_kelly t1130)
    (free diane_kelly t1230)
    (free diane_kelly t1300)
    (free diane_kelly t1330)
    (free diane_kelly t1400)
    (free diane_kelly t1530)
    (free diane_kelly t1600)
    (free diane_kelly t1630)

    ;; Free slots for deborah (from Deborah's constraints):
    ;; Deborah is free only at t0930 and t1400 within work hours.
    (free deborah t0930)
    (free deborah t1400)
  )

  ;; Goal: schedule a 30-minute meeting for Diane Kelly and Deborah (both must attend).
  ;; The scheduling action will mark both as attended when a feasible slot is chosen.
  (:goal (and (attended diane_kelly) (attended deborah)))
)