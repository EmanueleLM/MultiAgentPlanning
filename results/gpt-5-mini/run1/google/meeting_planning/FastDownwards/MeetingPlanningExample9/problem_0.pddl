(define (problem meet-mary-75min)
  (:domain meeting-planning)
  (:objects
    traveler mary - agent
    hotel meeting-room - loc
    ;; Time points from 10:00 to 17:00 in 15-minute steps:
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 - time
  )

  (:init
    ;; Successor relations (contiguity of discrete 15-minute slots)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6)
    (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10) (next t10 t11) (next t11 t12)
    (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16) (next t16 t17) (next t17 t18)
    (next t18 t19) (next t19 t20) (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24)
    (next t24 t25) (next t25 t26) (next t26 t27) (next t27 t28)

    ;; Mary availability window: Mary is at the meeting location for every 15-minute slot between 12:00 and 16:15 inclusive.
    ;; Time mapping: t8 = 12:00, t25 = 16:15
    (at mary meeting-room t8)  (at mary meeting-room t9)  (at mary meeting-room t10)
    (at mary meeting-room t11) (at mary meeting-room t12) (at mary meeting-room t13)
    (at mary meeting-room t14) (at mary meeting-room t15) (at mary meeting-room t16)
    (at mary meeting-room t17) (at mary meeting-room t18) (at mary meeting-room t19)
    (at mary meeting-room t20) (at mary meeting-room t21) (at mary meeting-room t22)
    (at mary meeting-room t23) (at mary meeting-room t24) (at mary meeting-room t25)

    ;; Traveler initial location: traveler is at the hotel from 10:00 up through 11:45 (t0..t7).
    ;; This encodes that the traveler cannot be at the meeting room before noon unless they travel.
    (at traveler hotel t0) (at traveler hotel t1) (at traveler hotel t2) (at traveler hotel t3)
    (at traveler hotel t4) (at traveler hotel t5) (at traveler hotel t6) (at traveler hotel t7)

    ;; Note: no at(...) facts for traveler at t8 or later; traveler must use travel+wait actions to establish presence.
    ;; The meeting must be a contiguous block of five 15-minute slots (75 minutes) that starts no earlier than t8 (12:00)
    ;; and finishes no later than t25 (16:15). Those time constraints are enforced by Mary's availability facts
    ;; and by the absence of Mary at other times.

    ;; No meeting-held facts initially.
  )

  ;; Goal: record that a 75-minute meeting occurred within Mary's availability window.
  ;; We require a specific contiguous 5-slot interval (t8..t12) within the allowed window as the mandated terminal condition.
  ;; This fixes the terminal condition explicitly so the solver must produce a plan that achieves it.
  (:goal (and
    (meeting-held t8 t12)
  ))
)