(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling-multiagent)

  (:objects
    margaret donna helen - agent

    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  ;; Initial facts:
  ;; Agents' availability is derived from their private calendar blocks and Helen's preference
  ;; (Helen: do not meet after 13:30). Only those slots that are free for an agent are listed.

  (:init
    ;; Margaret's availability (blocked: 09:00-10:00 => t0900,t0930;
    ;; 10:30-11:00 => t1030; 11:30-12:00 => t1130; 13:00-13:30 => t1300; 15:00-15:30 => t1500)
    (available margaret t1000)
    (available margaret t1100)
    (available margaret t1200)
    (available margaret t1230)
    (available margaret t1330)
    (available margaret t1400)
    (available margaret t1430)
    (available margaret t1530)
    (available margaret t1600)
    (available margaret t1630)

    ;; Donna's availability (blocked: 14:30-15:00 => t1430; 16:00-16:30 => t1600)
    (available donna t0900)
    (available donna t0930)
    (available donna t1000)
    (available donna t1030)
    (available donna t1100)
    (available donna t1130)
    (available donna t1200)
    (available donna t1230)
    (available donna t1300)
    (available donna t1330)
    (available donna t1400)
    (available donna t1500)
    (available donna t1530)
    (available donna t1630)

    ;; Helen's availability (private blocks: 09:00-09:30 => t0900;
    ;; 10:00-11:30 => t1000,t1030,t1100; 13:00-14:00 => t1300,t1330;
    ;; 14:30-15:00 => t1430; 15:30-17:00 => t1530,t1600,t1630)
    ;; plus preference: do not meet after 13:30, so only slots that start at or before 13:30 are allowed.
    (available helen t0930)
    (available helen t1130)
    (available helen t1200)
    (available helen t1230)
  )

  ;; Goal: have the meeting scheduled (any slot that satisfies all constraints)
  (:goal (meeting-scheduled))
)