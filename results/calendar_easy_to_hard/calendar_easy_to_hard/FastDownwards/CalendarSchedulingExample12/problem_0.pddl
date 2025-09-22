(define (problem integrated-schedule-monday)
  (:domain integrated-schedule-meeting)

  (:objects
    david debra kevin - person
    meeting1 - meeting

    ; hourly start times (09:00 .. 16:00)
    t09 t10 t11 t12 t13 t14 t15 t16 - hour

    ; 30-minute halfslots from 09:00..16:30 (s0900 .. s1630)
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - halfslot
  )

  (:init
    ;; --- Agent 1 initial facts: (they reported everyone free in hourly slots)
    (free_hour david t09) (free_hour david t10) (free_hour david t11) (free_hour david t12)
    (free_hour david t13) (free_hour david t14) (free_hour david t15) (free_hour david t16)

    (free_hour debra t09) (free_hour debra t10) (free_hour debra t11) (free_hour debra t12)
    (free_hour debra t13) (free_hour debra t14) (free_hour debra t15) (free_hour debra t16)

    (free_hour kevin t09) (free_hour kevin t10) (free_hour kevin t11) (free_hour kevin t12)
    (free_hour kevin t13) (free_hour kevin t14) (free_hour kevin t15) (free_hour kevin t16)

    (unscheduled meeting1)

    ;; --- Agent 2 initial facts: 30-min slot graph and debra's known halfslot free facts
    (slot-next s0900 s0930)
    (slot-next s0930 s1000)
    (slot-next s1000 s1030)
    (slot-next s1030 s1100)
    (slot-next s1100 s1130)
    (slot-next s1130 s1200)
    (slot-next s1200 s1230)
    (slot-next s1230 s1300)
    (slot-next s1300 s1330)
    (slot-next s1330 s1400)
    (slot-next s1400 s1430)
    (slot-next s1430 s1500)
    (slot-next s1500 s1530)
    (slot-next s1530 s1600)
    (slot-next s1600 s1630)

    (meeting-available)

    ; Debra's known free halfslots (agent 2 provided these)
    (free_half debra s0900)
    (free_half debra s1000) (free_half debra s1030)
    (free_half debra s1130)
    (free_half debra s1300) (free_half debra s1330)
    (free_half debra s1430)
    (free_half debra s1500) (free_half debra s1530)
    (free_half debra s1630)

    ;; Note: agent2 provided no free_half facts for david or kevin (unknown to agent2)

    ;; --- Agent 3 initial facts: hourly slots and kevin's availability (agent 3 provided)
    (slot t09) (slot t10) (slot t11) (slot t12) (slot t13) (slot t14) (slot t15) (slot t16)
    (within-window t09) (within-window t10) (within-window t11) (within-window t12)
    (within-window t13) (within-window t14) (within-window t15) (within-window t16)

    ;; Agent 3: kevin is available at these hourly starts (their provided knowledge)
    (available_hour kevin t09) (available_hour kevin t10) (available_hour kevin t11)
    (available_hour kevin t14) (available_hour kevin t15) (available_hour kevin t16)

    ;; Agent 3 provided no available_hour facts for david or debra (unknown for them)

    ;; --- Mapping hourly starts to halfslots (so agent2's halfslot starts align with the hourly model)
    (hour-starts t09 s0900)
    (hour-starts t10 s1000)
    (hour-starts t11 s1100)
    (hour-starts t12 s1200)
    (hour-starts t13 s1300)
    (hour-starts t14 s1400)
    (hour-starts t15 s1500)
    (hour-starts t16 s1600)

    ;; --- Global mutex used by all agents so only one scheduling action can succeed
    (meeting-free)

    ;; --- Aggregated availability (computed by integrating all agents' knowledge).
    ;; free_hour_agg is true for a person-hour only if all known agent constraints for that person at that hour allow the meeting.
    ;; We computed these conservatively:
    ;; - david: agent1 said he is free at all hours; no other agent contradicted that -> include all hours.
    ;; - debra: agent2's halfslot data restricts full-hour availability to hours where both halfslots are free:
    ;;          debra has both halfslots free for t10 (s1000,s1030), t13 (s1300,s1330), and t15 (s1500,s1530).
    ;; - kevin: agent3 indicated kevin is available at t09,t10,t11,t14,t15,t16.
    ;; Intersection across agents will then constrain valid scheduling choices to times where all three are aggregated-free.
    ;; (free_hour_agg david ... )
    (free_hour_agg david t09) (free_hour_agg david t10) (free_hour_agg david t11) (free_hour_agg david t12)
    (free_hour_agg david t13) (free_hour_agg david t14) (free_hour_agg david t15) (free_hour_agg david t16)

    ;; (free_hour_agg debra ...) computed from agent2 halfslot facts
    (free_hour_agg debra t10) (free_hour_agg debra t13) (free_hour_agg debra t15)

    ;; (free_hour_agg kevin ...) from agent3
    (free_hour_agg kevin t09) (free_hour_agg kevin t10) (free_hour_agg kevin t11)
    (free_hour_agg kevin t14) (free_hour_agg kevin t15) (free_hour_agg kevin t16)
  )

  ;; Goal: schedule meeting1 so that all three attend (and global scheduled marker set)
  (:goal (and
            (meeting-scheduled-global meeting1)
            (attends david meeting1)
            (attends debra meeting1)
            (attends kevin meeting1)
         ))
)