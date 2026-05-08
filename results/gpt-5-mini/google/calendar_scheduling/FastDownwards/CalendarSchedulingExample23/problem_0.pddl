(define (problem schedule_monday_meeting)
  (:domain meeting-scheduling)
  ; Objects: three participants and explicitly enumerated candidate start timepoints (half-hour granularity)
  (:objects
    participant_1 participant_2 participant_3 - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1430 t1500 t1530 t1600 - timepoint
  )

  (:init
    ; Participant 1 availability sufficient for a full 1-hour meeting when starting at these times (derived from audited intervals)
    (available-for-meeting participant_1 t0900)
    (available-for-meeting participant_1 t0930)
    (available-for-meeting participant_1 t1000)
    (available-for-meeting participant_1 t1030)
    (available-for-meeting participant_1 t1200)
    (available-for-meeting participant_1 t1500)

    ; Participant 2 availability sufficient for a full 1-hour meeting when starting at these times
    (available-for-meeting participant_2 t1030)
    (available-for-meeting participant_2 t1100)
    (available-for-meeting participant_2 t1130)
    (available-for-meeting participant_2 t1200)
    (available-for-meeting participant_2 t1430)
    (available-for-meeting participant_2 t1500)
    (available-for-meeting participant_2 t1530)
    (available-for-meeting participant_2 t1600)

    ; Participant 3 availability sufficient for a full 1-hour meeting when starting at these times
    (available-for-meeting participant_3 t1000)
    (available-for-meeting participant_3 t1030)
    (available-for-meeting participant_3 t1100)
    (available-for-meeting participant_3 t1230)
  )

  ; Goal fixes the mandated terminal conditions: a meeting scheduled at the validated common slot (10:30)
  ; and all participants attending that meeting start time.
  (:goal (and
    (meeting-scheduled t1030)
    (attended participant_1 t1030)
    (attended participant_2 t1030)
    (attended participant_3 t1030)
  ))
)