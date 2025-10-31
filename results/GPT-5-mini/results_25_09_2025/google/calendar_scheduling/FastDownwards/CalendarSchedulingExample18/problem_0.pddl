(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  ;; Objects: discrete 30-minute slots from 09:00 to 17:00 on Monday.
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  ;; Comments / soft preferences:
  ;;; All participants: meeting must be on Monday between 09:00 and 17:00
  ;;; Meeting duration: 30 minutes (slots are 30-minute quanta)
  ;;; Billy's soft preference: avoid meetings after 15:30 if possible (prefer slots <= 15:30).
  ;;; This is a soft preference only; not encoded as a hard constraint in classical PDDL.
  ;;; Feasible solution exists per agents' shared information.

  (:init
    ;; Declare all slots
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; Meeting not yet scheduled
    (meeting-not-scheduled)

    ;; Participant availabilities derived from each agent's private info:

    ;; Brian: I have no meetings on Monday and am available between 09:00 and 17:00
    (available-brian t0900) (available-brian t0930) (available-brian t1000) (available-brian t1030)
    (available-brian t1100) (available-brian t1130) (available-brian t1200) (available-brian t1230)
    (available-brian t1300) (available-brian t1330) (available-brian t1400) (available-brian t1430)
    (available-brian t1500) (available-brian t1530) (available-brian t1600) (available-brian t1630)

    ;; Billy: busy at 10:00-10:30 (t1000), 11:30-12:00 (t1130), 14:00-14:30 (t1400), 16:30-17:00 (t1630)
    ;; Available in all other work slots
    (available-billy t0900) (available-billy t0930)
    ;; t1000 busy -> omitted
    (available-billy t1030) (available-billy t1100)
    ;; t1130 busy -> omitted
    (available-billy t1200) (available-billy t1230) (available-billy t1300) (available-billy t1330)
    ;; t1400 busy -> omitted
    (available-billy t1430) (available-billy t1500) (available-billy t1530)
    (available-billy t1600)
    ;; t1630 busy -> omitted

    ;; Patricia: busy 09:00-12:30 (t0900..t1200), busy 13:30-14:00 (t1330), busy 14:30-16:00 (t1430,t1500,t1530), busy 16:30-17:00 (t1630)
    ;; Available otherwise
    ;; t0900..t1200 busy -> omitted
    (available-patricia t1230) (available-patricia t1300)
    ;; t1330 busy -> omitted
    (available-patricia t1400)
    ;; t1430,t1500,t1530 busy -> omitted
    (available-patricia t1600)
    ;; t1630 busy -> omitted
  )

  ;; Goal: a single meeting has been scheduled acceptable to all participants.
  (:goal (meeting-done))
)