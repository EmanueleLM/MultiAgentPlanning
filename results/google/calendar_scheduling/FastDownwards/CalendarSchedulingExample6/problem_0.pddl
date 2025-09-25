(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    thomas dylan jerry - agent
    s9 s930 s10 s1030 s11 s1130 s12 s1230 s13 s1330 s14 s1430 s15 s1530 s16 s1630 - slot
  )

  (:init
    ;; Temporal adjacency (30-minute granularity)
    (next s9    s930)
    (next s930  s10)
    (next s10   s1030)
    (next s1030 s11)
    (next s11   s1130)
    (next s1130 s12)
    (next s12   s1230)
    (next s1230 s13)
    (next s13   s1330)
    (next s1330 s14)
    (next s14   s1430)
    (next s1430 s15)
    (next s15   s1530)
    (next s1530 s16)
    (next s16   s1630)

    ;; Thomas: free all work slots (public info: Thomas free 9:00-17:00)
    (free thomas s9) (free thomas s930) (free thomas s10) (free thomas s1030)
    (free thomas s11) (free thomas s1130) (free thomas s12) (free thomas s1230)
    (free thomas s13) (free thomas s1330) (free thomas s14) (free thomas s1430)
    (free thomas s15) (free thomas s1530) (free thomas s16) (free thomas s1630)

    ;; Dylan: busy 10:30-11:00 (s1030) and 13:30-14:00 (s1330)
    ;; so free on all other slots
    (free dylan s9) (free dylan s930) (free dylan s10)
    ;; (dylan not free at s1030)
    (free dylan s11) (free dylan s1130) (free dylan s12) (free dylan s1230)
    (free dylan s13)
    ;; (dylan not free at s1330)
    (free dylan s14) (free dylan s1430) (free dylan s15) (free dylan s1530)
    (free dylan s16) (free dylan s1630)

    ;; Jerry: busy 9:00-11:00 (s9,s930,s10), busy 11:30-14:30 (s1130,s12,s1230,s13,s1330,s14),
    ;; busy 16:00-17:00 (s16,s1630). Available windows: 11:00-11:30 (s11) and 14:30-16:00 (s1430,s15,s1530).
    (free jerry s11) (free jerry s1430) (free jerry s15) (free jerry s1530)
  )

  (:goal (meeting-scheduled))
  (:metric minimize 0)
)