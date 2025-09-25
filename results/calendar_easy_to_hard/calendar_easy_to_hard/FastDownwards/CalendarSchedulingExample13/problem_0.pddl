(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)

  (:objects
    gerald roy barbara - agent

    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  ;; Initial facts: agents and timeslots
  (:init
    (agent gerald) (agent roy) (agent barbara)

    (timeslot t0900) (timeslot t0930) (timeslot t1000) (timeslot t1030)
    (timeslot t1100) (timeslot t1130) (timeslot t1200) (timeslot t1230)
    (timeslot t1300) (timeslot t1330) (timeslot t1400) (timeslot t1430)
    (timeslot t1500) (timeslot t1530) (timeslot t1600) (timeslot t1630)

    ; total-cost starts at 0
    (= (total-cost) 0)
  )

  ;; Availability (free) computed from each agent's private busy slots.
  ;; Work hours 09:00-17:00, 30-minute granularity; meeting duration 30 min.
  ;; Gerald private busy intervals (converted to start slots):
  ;; 09:00-09:30 -> t0900
  ;; 13:00-14:00 -> t1300, t1330
  ;; 15:00-15:30 -> t1500
  ;; 16:00-17:00 -> t1600, t1630
  ;; Gerald prefers avoiding meetings before 13:00: preferred slots are starts >= 13:00
  (:init
    ; Gerald free at all slots except his busy ones
    (free gerald t0930)
    (free gerald t1000)
    (free gerald t1030)
    (free gerald t1100)
    (free gerald t1130)
    (free gerald t1200)
    (free gerald t1230)
    ;; t1300 t1330 busy (not free)
    (free gerald t1400)
    ;; t1500 busy
    (free gerald t1530)
    ;; t1600 t1630 busy

    ; Roy is free 09:00-17:00 (all slots)
    (free roy t0900) (free roy t0930) (free roy t1000) (free roy t1030)
    (free roy t1100) (free roy t1130) (free roy t1200) (free roy t1230)
    (free roy t1300) (free roy t1330) (free roy t1400) (free roy t1430)
    (free roy t1500) (free roy t1530) (free roy t1600) (free roy t1630)

    ; Barbara private busy intervals (converted to start slots):
    ;; 09:30-10:00 -> t0930
    ;; 11:30-14:00 -> t1130, t1200, t1230, t1300, t1330
    ;; 14:30-15:00 -> t1430
    ;; 15:30-17:00 -> t1530, t1600, t1630
    ; Barbara free at other slots:
    (free barbara t0900)
    ;; t0930 busy
    (free barbara t1000)
    (free barbara t1030)
    (free barbara t1100)
    ;; t1130,t1200,t1230,t1300,t1330 busy
    (free barbara t1400)
    ;; t1430 busy
    (free barbara t1500)
    ;; t1530,t1600,t1630 busy

    ; Gerald's preference predicate: prefers slots starting at or after 13:00
    (gerald-pref t1300) (gerald-pref t1330) (gerald-pref t1400) (gerald-pref t1430)
    (gerald-pref t1500) (gerald-pref t1530) (gerald-pref t1600) (gerald-pref t1630)
  )

  ; Goal: schedule a 30-minute meeting on Monday between 09:00 and 17:00 with Gerald and Barbara.
  ; We accept any timeslot as long as an action establishes (meeting-scheduled <slot>).
  ; We enumerate all start slots in an OR; feasibility is controlled by preconditions (free ...).
  (:goal
    (or
      (meeting-scheduled t0900) (meeting-scheduled t0930) (meeting-scheduled t1000) (meeting-scheduled t1030)
      (meeting-scheduled t1100) (meeting-scheduled t1130) (meeting-scheduled t1200) (meeting-scheduled t1230)
      (meeting-scheduled t1300) (meeting-scheduled t1330) (meeting-scheduled t1400) (meeting-scheduled t1430)
      (meeting-scheduled t1500) (meeting-scheduled t1530) (meeting-scheduled t1600) (meeting-scheduled t1630)
    )
  )

  ; Optimize to respect Gerald's soft preference (avoid before 13:00) by minimizing total-cost.
  (:metric minimize (total-cost))
)