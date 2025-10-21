; Chosen meeting time (human-readable): Monday 12:00-12:30

(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    margaret donna helen - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Margaret's availability derived from:
    ;; [{"start":"10:00","end":"10:30"},{"start":"11:00","end":"11:30"},{"start":"12:00","end":"13:00"},
    ;;  {"start":"13:30","end":"15:00"},{"start":"15:30","end":"17:00"}]
    (available margaret s1000)
    (available margaret s1100)
    (available margaret s1200)
    (available margaret s1230)
    (available margaret s1330)
    (available margaret s1400)
    (available margaret s1430)
    (available margaret s1530)
    (available margaret s1600)
    (available margaret s1630)

    ;; Donna's availability derived from:
    ;; [{"start":"09:00","end":"14:30"},{"start":"15:00","end":"16:00"},{"start":"16:30","end":"17:00"}]
    ;; Note: 14:30 end excludes a slot starting at 14:30 (which would run until 15:00),
    ;; so latest slot in that block is 14:00.
    (available donna s0900)
    (available donna s0930)
    (available donna s1000)
    (available donna s1030)
    (available donna s1100)
    (available donna s1130)
    (available donna s1200)
    (available donna s1230)
    (available donna s1300)
    (available donna s1330)
    (available donna s1400)
    (available donna s1500)
    (available donna s1630)

    ;; Helen's available intervals (respecting preference not to meet after 13:30):
    ;; [{"start":"09:30","end":"10:00"},{"start":"11:30","end":"13:00"}]
    (available helen s0930)
    (available helen s1130)
    (available helen s1200)
    (available helen s1230)
  )

  ;; Goal: meeting scheduled at the selected slot (human-readable choice above: 12:00-12:30).
  (:goal (and
    (scheduled s1200)
  ))
)