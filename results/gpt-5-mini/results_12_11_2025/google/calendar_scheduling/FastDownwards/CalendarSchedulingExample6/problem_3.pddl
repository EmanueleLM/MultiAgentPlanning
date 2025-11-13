(define (problem schedule-monday-09-17-30min)
  (:domain calendar-scheduling)

  (:objects
    thomas dylan jerry - participant
    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230
    slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
  )

  (:init
    ;; slot objects
    (slot slot0900) (slot slot0930) (slot slot1000) (slot slot1030)
    (slot slot1100) (slot slot1130) (slot slot1200) (slot slot1230)
    (slot slot1300) (slot slot1330) (slot slot1400) (slot slot1430)
    (slot slot1500) (slot slot1530) (slot slot1600) (slot slot1630)

    ;; successor relation (30-minute granularity)
    (next slot0900 slot0930)
    (next slot0930 slot1000)
    (next slot1000 slot1030)
    (next slot1030 slot1100)
    (next slot1100 slot1130)
    (next slot1130 slot1200)
    (next slot1200 slot1230)
    (next slot1230 slot1300)
    (next slot1300 slot1330)
    (next slot1330 slot1400)
    (next slot1400 slot1430)
    (next slot1430 slot1500)
    (next slot1500 slot1530)
    (next slot1530 slot1600)
    (next slot1600 slot1630)

    ;; required participants for this meeting
    (required thomas) (required dylan) (required jerry)

    ;; distinctness facts for participants (pairwise distinct)
    (distinct thomas dylan) (distinct thomas jerry) (distinct dylan jerry)

    ;; availabilities (free) computed from each participant's busy windows
    ;; Thomas: completely free 09:00-17:00
    (free thomas slot0900) (free thomas slot0930) (free thomas slot1000) (free thomas slot1030)
    (free thomas slot1100) (free thomas slot1130) (free thomas slot1200) (free thomas slot1230)
    (free thomas slot1300) (free thomas slot1330) (free thomas slot1400) (free thomas slot1430)
    (free thomas slot1500) (free thomas slot1530) (free thomas slot1600) (free thomas slot1630)

    ;; Dylan: busy 10:30-11:00 (slot1030) and 13:30-14:00 (slot1330)
    (free dylan slot0900) (free dylan slot0930) (free dylan slot1000)
    ;; slot1030 busy -> omitted
    (free dylan slot1100) (free dylan slot1130) (free dylan slot1200) (free dylan slot1230)
    (free dylan slot1300)
    ;; slot1330 busy -> omitted
    (free dylan slot1400) (free dylan slot1430) (free dylan slot1500) (free dylan slot1530)
    (free dylan slot1600) (free dylan slot1630)

    ;; Jerry: busy 09:00-11:00 (slot0900,0930,1000,1030), busy 11:30-14:30 (1130,1200,1230,1300,1330,1400),
    ;; and busy 16:00-17:00 (slot1600,1630). Thus free slots: 11:00 (slot1100), 14:30-16:00 (slot1430,1500,1530)
    (free jerry slot1100)
    (free jerry slot1430) (free jerry slot1500) (free jerry slot1530)

    ;; earliest feasible slot computed by auditor: 14:30
    (earliest_start slot1430)
  )

  (:goal (and
    (meeting_scheduled)
    (scheduled_start slot1430)
  ))
)