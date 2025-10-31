(define (problem orchestrate-schedule-monday)
  (:domain orchestrated-meeting)

  (:objects
    ;; 16 half-hour slots 09:00-17:00
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7
    slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot

    ;; participants
    brian billy patricia - person

    meeting1 - meeting
  )

  (:init
    ;; ----------------------
    ;; Agent 1 (first agent) facts:
    ;; Brian is known to be available at every 30-min slot (agent1 asserted this).
    ;; (Agent1 deliberately did not assert availability for Billy or Patricia.)
    ;; ----------------------
    (avail_a1 brian slot0) (avail_a1 brian slot1) (avail_a1 brian slot2) (avail_a1 brian slot3)
    (avail_a1 brian slot4) (avail_a1 brian slot5) (avail_a1 brian slot6) (avail_a1 brian slot7)
    (avail_a1 brian slot8) (avail_a1 brian slot9) (avail_a1 brian slot10) (avail_a1 brian slot11)
    (avail_a1 brian slot12) (avail_a1 brian slot13) (avail_a1 brian slot14) (avail_a1 brian slot15)

    ;; ----------------------
    ;; Agent 2 (second agent) facts:
    ;; slot naming s1..s16 from agent2 maps to slot0..slot15 here.
    ;; All slots are work-hours and initially free in agent2's view.
    ;; Billy busy times (agent2 provided): s3, s6, s11, s16 => slot2, slot5, slot10, slot15
    ;; Agent2's attendee list includes billy, brian, patricia.
    ;; Agent2 also marks late slots s14,s15,s16 => slot13, slot14, slot15.
    ;; ----------------------
    ;; free slots (agent2)
    (free_a2 slot0) (free_a2 slot1) (free_a2 slot2) (free_a2 slot3)
    (free_a2 slot4) (free_a2 slot5) (free_a2 slot6) (free_a2 slot7)
    (free_a2 slot8) (free_a2 slot9) (free_a2 slot10) (free_a2 slot11)
    (free_a2 slot12) (free_a2 slot13) (free_a2 slot14) (free_a2 slot15)

    ;; agent2 busy facts (only for billy as provided)
    (busy_a2 billy slot2)  ;; s3 -> slot2 (10:00-10:30)
    (busy_a2 billy slot5)  ;; s6 -> slot5 (11:30-12:00)
    (busy_a2 billy slot10) ;; s11 -> slot10 (14:00-14:30)
    (busy_a2 billy slot15) ;; s16 -> slot15 (16:30-17:00)

    ;; attendees per agent2's view
    (attendee_a2 meeting1 billy)
    (attendee_a2 meeting1 brian)
    (attendee_a2 meeting1 patricia)

    ;; meeting initially unscheduled in agent2's view
    (unscheduled_a2 meeting1)

    ;; late slots according to agent2's soft preference (s14,s15,s16 -> slot13,slot14,slot15)
    (late slot13) (late slot14) (late slot15)

    ;; initialize penalty (agent2's soft preference counter)
    (= (penalty) 0)

    ;; ----------------------
    ;; Agent 3 (third agent) facts:
    ;; Patricia's known available slots (from agent3):
    ;; slot7 (12:30-13:00), slot8 (13:00-13:30), slot10 (14:00-14:30), slot14 (16:00-16:30)
    ;; (Agent3 did not assert availability for Brian or Billy.)
    ;; ----------------------
    (avail_a3 patricia slot7)
    (avail_a3 patricia slot8)
    (avail_a3 patricia slot10)
    (avail_a3 patricia slot14)
  )

  ;; Goal: the meeting is globally scheduled and includes all three participants.
  (:goal (and
           (meeting-scheduled)
           (meeting-with brian)
           (meeting-with billy)
           (meeting-with patricia)
         ))

  ;; Metric: prefer schedules that minimize the agent2 penalty (avoid late slots if possible).
  (:metric minimize (penalty))
)